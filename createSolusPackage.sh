#!/bin/bash

if [[ $# -lt 3 ]] ; then
	echo "========================================================================="
    echo "please provide the 3 arguments - packagename git-username git-emailid"
    echo " "
    echo "example: ./createSolusPackage.sh packagename username emailid@example.com"
    echo "========== arg 1 ==> provide your packagename"
    echo "========== arg 2 ==> provide your git username"
    echo "========== arg 3 ==> provide your git emailid"
    echo " "
    echo "==== Still doubt ? Youtube link ==> https://youtu.be/rlPnHjUBpJ8"
    echo "========================================================================="
    exit 1
fi
packagename=$1
export username=$2
export emailid=$3
makeFile=Makefile
makeFileCommon=Makefile.common
makeFileIso=Makefile.iso
#grep "^Name=" ~/.solus/packager | cut -d"=" -f2
#grep "^Email=" ~/.solus/packager | cut -d"=" -f2
if [ -f ~/.solus/packager ]; then 
   username=$(grep -Po "(?<=^Name=).*" ~/.solus/packager)
   emailid=$(grep -Po "(?<=^Email=).*" ~/.solus/packager)
   echo "Found existing username & emailid in ./solus/packager file"
   echo "username ==> $username :: emailid ==> $emailid"
   echo "Ignoring new username & emailid"
fi   
create_packager_file(){
	mkdir -p ~/.solus
	echo "[Packager]" >> ~/.solus/packager
	echo "Name=$username" >> ~/.solus/packager
	echo "Email=$emailid" >> ~/.solus/packager
}
sudo eopkg it -c system.devel
sudo eopkg it git solbuild arcanist solbuild-config-unstable
sudo solbuild init 
sudo solbuild update
ls ~/.solus >/dev/null 2>&1 ||$(create_packager_file)
mkdir -p repository/$packagename
echo "Project directory created..."
cd repository/
echo "Current directory ==> " $PWD
ls common >/dev/null 2>&1 || git clone https://dev.getsol.us/source/common/common.git

if [ ! -L $makeFile ]; then
  echo "=> Creating makeFile link"
  ln -sv common/Makefile.toplevel Makefile
fi
if [ ! -L $makeFileCommon ]; then
  echo "=> Creating Makefile common link"
  ln -sv common/Makefile.common .
fi
if [ ! -L $makeFileIso ]; then
  echo "=> Creating Makefile.iso link"
  ln -sv common/Makefile.iso .
fi
git config --global user.name $username  
git config --global user.email $emailid
arc set-config default https://dev.getsol.us
#arc set-config -conduit-uri ~/.arcrc
echo "============================================================================="
echo "   Conduit API Token.This token will be used to allow the CLI arc utility" 
echo "   to communicate with Phabricator"
echo "============================================================================="
arc install-certificate
cd $packagename/
echo "Current directory ==> " $PWD
git init
echo "include ../Makefile.common" > $makeFile
echo "============================================================================"
echo "======================== Basic setup is done ==============================="
echo "======================== Manual steps ======================================"
echo "============================================================================"
echo "====Step 1: Create package.yml with updated package name  =================="
echo "../common/Scripts/yauto.py <enter your package files git link>"
echo "====Step 2 - (update)               : Update package.yml ==================="
echo "====Step 3 - (make)                 : make ================================="
echo "====Step 4 - (list content)         : lseopkg <yourpackage>.eopkg =========="
echo "====Step 5 - (status of new files)  : git status ==========================="
echo "====Step 6 - (add new files to git) : git add * ============================"
echo "====Step 7 - (commit new files )    : git commit ==========================="
echo "====Step 8 - (check commit log  )   : git log    ==========================="
echo "====Step 9 - (create a patch  )     : arc diff   ==========================="
echo "====Step 9.1 - (edit the patch  )   : arc diff --edit  ====================="