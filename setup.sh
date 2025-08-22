#!/bin/bash

# Make a backup for current configs
mkdir ~/.config/dotfiles.bak

mv ~/.config/hypr ~/.config/dotfiles.bak/hypr
mv ~/.config/waybar ~/.config/dotfiles.bak/ºwaybar
mv ~/.config/kitty ~/.config/dotfiles.bak/kitty
mv ~/.config/wofi ~/.config/dotfiles.bak/wofi
mv ~/.config/zed ~/.config/dotfiles.bak/zed

ln -s /home/gruiz/dotfiles/.config/hypr /home/gruiz/.config/
ln -s /home/gruiz/dotfiles/.config/waybar /home/gruiz/.config/
ln -s /home/gruiz/dotfiles/.config/kitty /home/gruiz/.config/
ln -s /home/gruiz/dotfiles/.config/wofi /home/gruiz/.config/
ln -s /home/gruiz/dotfiles/.config/zed /home/gruiz/.config/

# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install NVM and NodeJS
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
