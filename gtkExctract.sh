#!/bin/bash

gresource list gtk.gresource > extracted.txt
strlines=`cat extracted.txt`
for line in $strlines ; do
	sudo gresource extract gtk.gresource $line > $(basename $line)
done

#/org/adapta-project/gtk-3.24-nokto-eta/assets/