#!/bin/bash
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#dotfiles created by rediskazavr
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Download NvChad
git clone https://github.com/ProgrammingRainbow/NvChad-2.5 ~/.config/nvim

# Remove old files
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim

# Install nvchad
cd ~/.config/nvim
nvim  