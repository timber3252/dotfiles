#!/usr/bin/env fish
# install requirements via pacman

echo "% Installing dotdrop dependencies"
paru -S python-docopt python-ruamel-yaml python-magic python-packaging python-requests python-tomli python-tomli-w python-distro python-jinja

echo "% Init neovim configuration"
rm -rf ~/.config/nvim
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
rm -rf ~/.config/nvim/lua/custom

echo "% Installing pipewire"
paru -S wireplumber pipewire pipewire-alsa pipewire-audio pipewire-jack pipewire-pulse pulsemixer

echo "% Installing graphics drivers (for AMDGPU)"
paru -S mesa mesa-vdpau libva-mesa-driver vulkan-radeon

echo "% Installing fonts"
paru -S noto-fonts noto-fonts-cjk ttf-twemoji ttf-harmonyos-sans ttf-firacode-nerd

echo "% Installing wayland & hyprland stuff"
paru -S hyprland-hidpi-xprop-git swww wl-clipboard swaylock fuzzel xdg-desktop-portal-hyprland playerctl aylurs-gtk-shell cliphist libdbusmenu-gtk3 darkman

echo "% Installing xwayland stuff"
paru -S xorg-xdpyinfo xorg-xrdb xorg-xsetroot xsettingsd

echo "% Installing common packages (I)"
paru -S joshuto mediainfo mpv zathura zathura-cb zathura-djvu zathura-pdf-mupdf zathura-ps kitty librewolf vimiv obs-studio swappy slurp grim fcitx5 fcitx5-chinese-addons fcitx5-configtool dconf-editor electron-netease-cloud-music bat fd fzf jq neovim neofetch polkit-gnome htop mission-center pavucontrol devtools stress android-tools

echo "% Installing themes & icons"
paru -S qt5ct qt6ct kvantum catppuccin-gtk-theme-frappe catppuccin-gtk-theme-latte catppuccin-gtk-theme-macchiato catppuccin-gtk-theme-mocha capitaine-cursors papirus-folders-catppuccin-git papirus-icon-theme lightly-qt
papirus-folders -C cat-latte-blue --theme Papirus
papirus-folders -C cat-latte-blue --theme Papirus-Light
papirus-folders -C cat-macchiato-blue --theme Papirus-Dark
gsettings set org.gnome.desktop.interface cursor-size 36
gsettings set org.gnome.desktop.interface cursor-theme 'capitaine-cursors'
gsettings set org.gnome.desktop.interface document-font-name 'HarmonyOS Sans SC 11'
gsettings set org.gnome.desktop.interface font-name 'HarmonyOS Sans SC 11'
gsettings set org.gnome.desktop.interface gtk-theme 'Catppuccin-Frappe-Standard-Blue-Dark'
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'

echo "% Restore dotdrop"
./dotdrop.sh install

echo "% Installing common packages (II)"
paru -S bubblewrap flatpak-xdg-utils evtest pkgfile yt-dlp socat gdb mtr iperf3
paru -S sagemath texlive texlive-langchinese pandoc-cli
systemctl --user enable darkman.service --now
pkgfile --update
