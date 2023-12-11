#!/bin/fish

# GTK3 / GTK4
gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin-Latte-Standard-Blue-Light"
gsettings set org.gnome.desktop.interface icon-theme "Papirus-Light"

# Qt5 / Qt6
sed -i "s/color_scheme_path=.*\$/color_scheme_path=\/home\/timber3252\/.config\/qt5ct\/colors\/Catppuccin-Latte.conf/g" $HOME/.config/qt5ct/qt5ct.conf
sed -i "s/style=kvantum-dark\$/style=kvantum/g" $HOME/.config/qt6ct/qt6ct.conf
sed -i "s/icon_theme=Papirus-Dark\$/icon_theme=Papirus-Light/g" $HOME/.config/qt5ct/qt5ct.conf
sed -i "s/icon_theme=Papirus-Dark\$/icon_theme=Papirus-Light/g" $HOME/.config/qt6ct/qt6ct.conf

# Fuzzel
cp ~/.config/fuzzel/themes/fuzzel.latte.ini ~/.config/fuzzel/fuzzel.ini -f

# Kitty
kitten themes --reload-in=all Catppuccin-Latte

# Ags
cp ~/.config/ags/styles/style.latte.css ~/.config/ags/style.css -f
