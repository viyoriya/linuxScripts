
ARCVERSION="20190330"

newColorValue=626C82

count=0

echo "=================  Downloading Arc theme source  =================="
wget --quiet "https://github.com/NicoHood/arc-theme/releases/download/${ARCVERSION}/arc-theme-${ARCVERSION}.tar.xz"
tar -xJf "arc-theme-${ARCVERSION}.tar.xz"
rm "arc-theme-${ARCVERSION}.tar.xz"
echo "=================  Arc theme source download completed ============"


CWD="`pwd`/arc-theme-${ARCVERSION}"
cd "${CWD}"

rgbfunction () {
  oldRGBColor=$1
  newRGBColor=$2
  find ${CWD}/common -type f -exec sed -i 's/'$oldRGBColor'/'$newRGBColor'/g' {}  \;
  echo "The rgb colour "$oldRGBColor "is changed into " $newRGBColor
}

count=$[count+1]
echo "Fix " $count
echo "The very common colour #5294e2 is changed into capital letters."
rgbfunction "5294e2" "5294E2"

count=$[count+1]
echo "Fix " $count
rgbfunction "5294E2" $newColorValue

count=$[count+1]
echo "Fix " $count
rgbfunction "4a85cb" $newColorValue

count=$[count+1]
echo "Fix " $count
rgbfunction "4DADD4" $newColorValue

count=$[count+1]
echo "Fix " $count
rgbfunction "76c0de" $newColorValue

count=$[count+1]
echo "Fix " $count
rgbfunction "2e96c0" $newColorValue

count=$[count+1]
echo "Fix " $count
rgbfunction "2679db" $newColorValue


rgbafunction () {
  oldRGBColor=$1
  newRGBColor=$2
  redhex=${newRGBColor:0:2}
  greenhex=${newRGBColor:2:2}
  bluehex=${newRGBColor:4:2}

  reddec=$((16#$redhex))
  greendec=$((16#$greenhex))
  bluedec=$((16#$bluehex))

  rgbacolour="$reddec, $greendec, $bluedec"
  newRGBColor=$rgbacolour
  find ${CWD}/common -type f -exec sed -i "s/$oldRGBColor/$newRGBColor/g" {}  \;
  echo "The rgba colour "$oldRGBColor "is changed into " $newRGBColor

}
count=$[count+1]
echo "Fix " $count
rgbafunction "38, 121, 219" $newColorValue

count=$[count+1]
echo "Fix " $count
rgbafunction "82, 148, 226" $newColorValue

count=$[count+1]
echo "Fix " $count
rgbafunction "65, 137, 223" $newColorValue

rm -rf ${CWD}/common/gtk-2.0/dark/assets/*.png
rm -rf ${CWD}/common/gtk-2.0/light/assets/*.png
rm -rf ${CWD}/common/gtk-2.0/menubar-toolbar/*.png
rm -rf ${CWD}/common/gtk-3.0/3.20/assets/*.png

./autogen.sh --prefix=/usr --with-gnome-shell=3.32.2 --with-gtk3=3.24.10 --disable-cinnamon --disable-gnome-shell --disable-metacity --disable-unity --disable-xfwm --disable-plank --disable-openbox
#./autogen.sh --prefix=/usr --with-gnome-shell=3.32.1 --with-gtk3=3.24.8 --disable-cinnamon --disable-unity --disable-xfwm --disable-plank --disable-openbox
sudo rm -rf /usr/share/themes/{Arc,Arc-Darker,Arc-Dark}
sudo rm -rf ~/.local/share/themes/{Arc,Arc-Darker,Arc-Dark}
sudo rm -rf ~/.themes/{Arc,Arc-Darker,Arc-Dark}
sudo rm -rf /usr/local/share/themes/{Arc,Arc-Darker,Arc-Dark}

#echo "### Optimising SVGs"
#find . -name "*.svg" -exec inkscape {} --vacuum-defs --export-plain-svg={} \;

sudo make
#echo "================= Copying min/max/close png files ================="
sudo cp ~/Documents/SOLUS/GIT_PROJECTS/linuxScripts/Adapta-Eta-titleButtons/*.png ${CWD}/common/gtk-3.0/3.20/assets/
#echo "================= Copying Done ===================================="
sudo make install

echo "==================================================================="
echo "=========  installed arc-theme-${ARCVERSION} - hurray !!! ========="
echo "==================================================================="