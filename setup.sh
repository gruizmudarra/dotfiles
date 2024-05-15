#!/bin/bash

echo "Install curl if not installed"
which curl &> /dev/null || sudo apt install curl

mkdir -p ~/.themes/
curl -L https://github.com/dracula/gtk/archive/master.zip > ~/.themes/gtk-master.zip
unzip -q ~/.themes/gtk-master.zip -d ~/.themes/
mv ~/.themes/gtk-master ~/.themes/Dracula 
rm ~/.themes/gtk-master.zip

gsettings set org.gnome.desktop.interface gtk-theme "Dracula"
gsettings set org.gnome.desktop.wm.preferences theme "Dracula"
