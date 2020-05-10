#!/bin/bash

#https://gitlab.com/tista500/plata-theme
#https://material.io/design/color/#tools-for-picking-colors

echo "=================  Downloading Plata theme source  =================="
wget --quiet "https://gitlab.com/tista500/plata-theme/-/archive/master/plata-theme-master.tar"
tar -xf "plata-theme-master.tar"
rm "plata-theme-master.tar"
echo "=================  Plata theme source download complete ============="

CWD="`pwd`/plata-theme-master"
cd "${CWD}"

#./autogen.sh --prefix=/usr --with-selection_color=#88c0d0 --with-accent_color=#c5dfe7 --enable-gtk_next --disable-gnome --disable-cinnamon --disable-flashback --disable-xfce --disable-openbox
#./autogen.sh --prefix=/usr --with-selection_color=#424242 --with-accent_color=#757575 --enable-gtk_next --disable-gnome --disable-cinnamon --disable-flashback --disable-xfce --disable-openbox
./autogen.sh --prefix=/usr --with-selection_color=#88c0d0 --with-accent_color=#c5dfe7 --enable-gtk_next --disable-gnome --disable-cinnamon --disable-flashback --disable-xfce 
sudo rm -rf /usr/share/themes/{Plata,Plata-Compact,Plata-Lumine,Plata-Lumine-Compact,Plata-Noir,Plata-Noir-Compact}
sudo rm -rf /usr/local/share/themes/{Plata,Plata-Compact,Plata-Lumine,Plata-Lumine-Compact,Plata-Noir,Plata-Noir-Compact}
rm -rf ~/.local/share/themes/{Plata,Plata-Compact,Plata-Lumine,Plata-Lumine-Compact,Plata-Noir,Plata-Noir-Compact}
rm -rf ~/.themes/{Plata,Plata-Compact,Plata-Lumine,Plata-Lumine-Compact,Plata-Noir,Plata-Noir-Compact}

#echo "=================  Optimising SVGs ================================"
#find . -name "*.svg" -exec inkscape {} --vacuum-defs --export-plain-svg={} \;
sudo make
sudo make install

echo "==================================================================="
echo "================= Plata-theme-installed - hurray !!! =============="
echo "==================================================================="