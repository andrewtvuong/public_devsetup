#!/bin/bash

# Update and install necessary packages
sudo apt update && sudo apt upgrade -y
sudo apt install -y vim zsh git curl htop

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Copy dotfiles to home directory
cp dotfiles/.gitconfig ~/
cp dotfiles/.vimrc ~/
cp dotfiles/.zshrc ~/

# Set Zsh as the default shell
chsh -s $(which zsh)

echo ".DS_Store" >> ~/.gitignore
echo "node_modules/" >> ~/.gitignore
git config --global core.excludesfile ~/.gitignore
git config --global core.editor "vim"

# Generate SSH key
ssh-keygen -t ed25519

# Add /opt/bitnami/node/bin to PATH
echo 'export PATH=$PATH:/opt/bitnami/node/bin' >> ~/.zshrc


echo "Setup complete! Please restart your terminal."
