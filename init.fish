#!/usr/bin/env fish
# install requirements via pacman

echo "% Installing dotdrop dependencies"
paru -S python-docopt python-ruamel-yaml python-magic python-packaging python-requests python-tomli python-tomli-w python-distro python-jinja

echo "% Restore dotdrop"
./dotdrop.sh install

echo "% Installing pipewire"
paru -S wireplumber pipewire pipewire-alsa pipewire-audio pipewire-jack pipewire-pulse pulsemixer

echo "% Installing fonts"
paru -S noto-fonts noto-fonts-cjk ttf-inconsolata-nerd ttf-twemoji ttf-harmonyos-sans ttf-firacode-nerd

echo "% Installing wayland & hyprland stuff"
paru -S hyprland-hidpi-xprop-git hyprpaper waybar wl-clipboard swaylock libnotify dunst fuzzel xdg-desktop-portal-hyprland playerctl python-gobject

echo "% Installing xwayland stuff"
paru -S xorg-xdpyinfo xorg-xrdb xorg-xsetroot xsettingsd

echo "% Installing common gui packages"
paru -S joshuto mediainfo mpv zathura zathura-cb zathura-djvu zathura-pdf-mupdf zathura-ps kitty librewolf nomacs obs-studio swappy slurp grim fcitx5 fcitx5-chinese-addons fcitx5-configtool dconf-editor electron-netease-cloud-music

echo "% Installing common terminal utilities"
paru -S bat fd fzf jq neovim neofetch
bat cache --build

echo "% Installing themes & icons"
paru -S qt5ct qt6ct kvantum kvantum-theme-catppuccin-git catppuccin-gtk-theme-frappe catppuccin-gtk-theme-latte catppuccin-gtk-theme-macchiato catppuccin-gtk-theme-mocha capitaine-cursors catppuccin-fcitx5-git papirus-folders-catppuccin-git papirus-icon-theme
papirus-folders -C cat-latte-blue --theme Papirus
papirus-folders -C cat-macchiato-blue --theme Papirus-Dark
gsettings set org.gnome.desktop.interface cursor-size 36
gsettings set org.gnome.desktop.interface cursor-theme 'capitaine-cursors'
gsettings set org.gnome.desktop.interface document-font-name 'HarmonyOS Sans SC 11'
gsettings set org.gnome.desktop.interface font-name 'HarmonyOS Sans SC 11'
gsettings set org.gnome.desktop.interface gtk-theme 'Catppuccin-Frappe-Standard-Blue-Dark'
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'
gsettings set org.gnome.desktop.interface monospace-font-name 'Inconsolata Nerd Font Mono 10'
