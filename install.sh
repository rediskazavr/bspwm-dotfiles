#!/bin/bash
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#dotfiles created by rediskazavr
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#UPDATE&INSTALL PACKAGES
sudo pacman -Syu
sudo pacman -S xorg xorg-xinit bspwm sxhkd polybar alacritty feh dmenu git base-devel neovim fastfetch cava cmatrix maim firefox btop ncmpcpp lf zsh ttf-font-awesome ttf-jetbrains-mono ttf-jetbrains-mono-nerd --noconfirm

#CREATE&COPY CONFIGS
mkdir -p ~/.config
cp -r ~/bspwm-dotfiles/dotfiles/wallpapers/ ~/.config/
cp -r ~/bspwm-dotfiles/dotfiles/fastfetch/ ~/.config/
cp -r ~/bspwm-dotfiles/dotfiles/alacritty/ ~/.config/
cp -r ~/bspwm-dotfiles/dotfiles/polybar/ ~/.config/
cp -r ~/bspwm-dotfiles/dotfiles/bspwm/ ~/.config/
cp -r ~/bspwm-dotfiles/dotfiles/sxhkd/ ~/.config/
cp -r ~/bspwm-dotfiles/dotfiles/picom/ ~/.config/
chmod +x ~/.config/bspwm/bspwmrc

#INSTALL ZSH THEMES
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# EDIT .XINITRC
cat <<EOF > ~/.xinitrc
#!/bin/bash
exec bspwm
EOF

#INSTALL YAY
cd ~/bspwm-dotfiles/packages/yay/
makepkg -si --noconfirm
yay -Syu --noconfirm

#INSTALL PICON-GIT
yay -S picom-git --noconfirm

#INSTALL TTY-CLOCK
yay -S tty-clock --noconfirm

#REBOOT
sudo reboot