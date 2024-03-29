#!/bin/fish

# GTK3 / GTK4
gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin-Frappe-Standard-Blue-Dark"
gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"

# Qt5 / Qt6
sed -i "s/color_scheme_path=.*\$/color_scheme_path=\/home\/timber3252\/.config\/qt5ct\/colors\/Catppuccin-Frappe.conf/g" $HOME/.config/qt5ct/qt5ct.conf
sed -i "s/style=kvantum\$/style=kvantum-dark/g" $HOME/.config/qt6ct/qt6ct.conf
sed -i "s/icon_theme=Papirus-Light\$/icon_theme=Papirus-Dark/g" $HOME/.config/qt5ct/qt5ct.conf
sed -i "s/icon_theme=Papirus-Light\$/icon_theme=Papirus-Dark/g" $HOME/.config/qt6ct/qt6ct.conf

# Fuzzel
cp ~/.config/fuzzel/themes/fuzzel.frappe.ini ~/.config/fuzzel/fuzzel.ini -f

# Kitty
kitten themes --reload-in=all Catppuccin-Frappe

# Ags
cp ~/.config/ags/styles/style.frappe.css ~/.config/ags/style.css -f
