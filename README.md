# public_devsetup

This repository contains scripts and configuration files to set up a development environment on a Linux system, such as a Raspberry Pi or an AWS Lightsail instance, with a focus on using Vim and Zsh.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Prerequisites

Before you begin, ensure you have met the following requirements:

- You are using a Linux-based operating system (e.g., Raspberry Pi OS, Ubuntu, AWS Lightsail Linux).
- You have `sudo` privileges on your system.
- You have an internet connection to download necessary packages.

## Installation

To set up your development environment, follow these steps:

1. **Clone the repository:**

    ```bash
    git clone https://github.com/yourusername/public_devsetup.git
    cd public_devsetup
    ```

2. **Run the setup script:**

    ```bash
    ./setup.sh
    ```

    This script will install necessary packages and configure your environment.

## Configuration

After running the setup script, you may need to configure some settings manually:

1. **Edit `.gitconfig`:**

    ```bash
    vim ~/.gitconfig
    ```

    Update the `[user]` section with your name and email.

2. **Edit `.vimrc`:**

    ```bash
    vim ~/.vimrc
    ```

    Customize your Vim settings as needed.

3. **Edit `.zshrc`:**

    ```bash
    vim ~/.zshrc
    ```

    Customize your Zsh settings and aliases.

## Usage

Once the setup is complete, you can start using your development environment:

- **Vim:** Open files with Vim using the `vim` command.
- **Zsh:** Use the Zsh shell with the configured settings and aliases.
- **Git:** Use Git with the configured global settings.

## Contributing

If you want to contribute to this project, follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes and commit them (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Create a pull request.

## License

This project is licensed under the MIT License. See the [`LICENSE`](LICENSE ) file for details.