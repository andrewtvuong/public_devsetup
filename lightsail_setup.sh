#!/bin/bash

# One-Time Setup Script for 1GB Lightsail Instance (React + Nginx)

echo "🔧 Updating system..."
sudo apt update && sudo apt upgrade -y

echo "🧠 Installing essential packages..."
sudo apt install curl git ufw nginx htop -y

echo "⚙️ Setting up UFW firewall..."
sudo ufw allow OpenSSH
sudo ufw allow http
sudo ufw allow https
sudo ufw --force enable

echo "💾 Adding swap space..."
sudo fallocate -l 1G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

# echo "🔌 Installing Node.js and npm..."
# curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
# sudo apt install -y nodejs

echo "📦 Installing serve and pm2 (for serving static React builds)..."
sudo npm install -g serve pm2

echo "🧹 Disabling unnecessary services..."
sudo systemctl disable snapd
sudo systemctl disable apache2

echo "✅ Setup complete! Recommended: Build your React app locally, upload the build folder, and configure Nginx as below."

echo "🌐 Example Nginx block to paste in /etc/nginx/sites-available/default:"
cat <<EOL

server {
    listen 80;
    server_name yourdomain.com www.yourdomain.com;

    root /home/bitnami/landing/build;
    index index.html;

    location / {
        try_files \$uri /index.html;
    }

    location ~* \.(js|css|png|jpg|jpeg|gif|ico|svg|woff|woff2|ttf|eot)\$ {
        expires 30d;
        access_log off;
        add_header Cache-Control "public";
    }
}
EOL

echo "🚀 To go live:"
echo "- Upload your React 'build' folder to /home/bitnami/landing"
# build locally then push to lightsail
# scp -r build/ ubuntu@your-lightsail-ip:/home/ubuntu/genai-landing
echo "- Restart Nginx: sudo systemctl restart nginx"

# Keep the Instance Clean periodically
# sudo apt autoremove && sudo apt autoclean

git config --global core.editor "vim"

# Add SWAP	Prevents crashes under load
# Build locally	Saves RAM
# Use Nginx	Lightweight & efficient
# Disable extras	Free up RAM
# pm2 or serve	Controlled static serving
# Cache headers	Faster load time
# UFW	Lightweight security
