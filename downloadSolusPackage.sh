#!/bin/bash

if [[ $# -lt 1 ]] ; then
	echo "==================================================="
    echo "please provide the packagename "
    echo " "
    echo "example: ./downloadPackage.sh packagename"
    echo "==================================================="
    exit 1
fi
packagename=$1
git clone https://dev.getsol.us/source/${packagename}.git