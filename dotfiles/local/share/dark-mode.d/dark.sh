#!/bin/bash

# GTK3 / GTK4
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin-Frappe-Standard-Blue-Dark"

# Qt5 / Qt6
sed -i "s/style=kvantum$/style=kvantum-dark/g" $HOME/.config/qt5ct/qt5ct.conf
sed -i "s/style=kvantum$/style=kvantum-dark/g" $HOME/.config/qt6ct/qt6ct.conf

# Fuzzel
cp ~/.config/fuzzel/themes/fuzzel.frappe.ini ~/.config/fuzzel/fuzzel.ini -f

# Kitty
kitten themes --reload-in=all Catppuccin-Frappe
