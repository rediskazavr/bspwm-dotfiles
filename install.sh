# $$$$$$$\   $$$$$$\  $$$$$$$\  $$\   $$\ $$$$$$$\  $$$$$$$$\ 
# $$  __$$\ $$  __$$\ $$  __$$\ $$ |  $$ |$$  __$$\ $$  _____|
# $$ |  $$ |$$ /  \__|$$ |  $$ |$$ |  $$ |$$ |  $$ |$$ |      
# $$$$$$$\ |\$$$$$$\  $$$$$$$  |$$ |  $$ |$$$$$$$  |$$$$$\    
# $$  __$$\  \____$$\ $$  ____/ $$ |  $$ |$$  __$$< $$  __|   
# $$ |  $$ |$$\   $$ |$$ |      $$ |  $$ |$$ |  $$ |$$ |      
# $$$$$$$  |\$$$$$$  |$$ |      \$$$$$$  |$$ |  $$ |$$$$$$$$\ 
# \_______/  \______/ \__|       \______/ \__|  \__|\________|

# Update system
sudo pacman -Syu

# Install packages
sudo pacman -S xorg xorg-xinit bspwm sxhkd polybar alacritty feh dmenu git base-devel neovim fastfetch cava cmatrix firefox thunar tgpt zsh --noconfirm

# Create folders for configs (skip if exists)
mkdir -p ~/.config

# Copy dotfiles (with -r for directories)
cp ~/bspwm-dotfiles/dotfiles/wallpaper.png ~/.config/
cp -r ~/bspwm-dotfiles/dotfiles/fastfetch/ ~/.config/
cp -r ~/bspwm-dotfiles/dotfiles/alacritty/ ~/.config/
cp -r ~/bspwm-dotfiles/dotfiles/polybar/ ~/.config/
cp -r ~/bspwm-dotfiles/dotfiles/bspwm/ ~/.config/
cp -r ~/bspwm-dotfiles/dotfiles/sxhkd/ ~/.config/
cp -r ~/bspwm-dotfiles/dotfiles/picom/ ~/.config/
cp -r ~/bspwm-dotfiles/dotfiles/rofi/ ~/.config/
chmod +x ~/.config/bspwm/bspwmrc

# Install zsh and Oh My Zsh (for current user, not root)
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# .xinitrc
cat <<EOF > ~/.xinitrc
#!/bin/bash
exec bspwm
EOF

# Install yay (as normal user)
cd ~/bspwm-dotfiles/packages/yay/
makepkg -si --noconfirm

# Install Fonts (yay doesn't need sudo)
yay -S pxplus-ibm-vga8 --noconfirm
fc-cache -fv

# Install picom(with yay)
yay -S picom-git --noconfirm

# GTK Install
mkdir -p ~/.local/share/icons/
mkdir -p ~/.local/share/themes/

cp -r ~/bspwm-dotfiles/gtk/icons/Sunset-cursor/ ~/.local/share/icons
cp -r ~/bspwm-dotfiles/gtk/themes/Sunrise-Dark/ ~/.local/share/themes

gsettings set org.gnome.desktop.interface cursor-theme "Sunset Cursors"
gsettings set org.gnome.desktop.interface gtk-theme "Sunrise-Dark"
gsettings set org.gnome.desktop.wm.preferences theme "Sunrise-Dark"

## clear terminal
clear

# Reboot system
sudo reboot