#!/bin/bash

CDIR="Documents/SOLUS/GIT_PROJECTS"

update_root_bash(){
	cd /root
	sudo cp ~/$CDIR/linuxScripts/bashScripts/.bashrc_color_terminal .
	echo ' ' | sudo tee -a .bashrc > /dev/null
	echo ' ' | sudo tee -a .bashrc > /dev/null
	echo 'if [ -f ~/.bashrc_color_terminal ]; then' | sudo tee -a .bashrc > /dev/null
	echo '	. ~/.bashrc_color_terminal' | sudo tee -a .bashrc > /dev/null
	echo 'fi' | sudo tee -a .bashrc > /dev/null
}
update_home_bash(){
	echo " " >> ~/.bashrc
	echo " " >> ~/.bashrc
	echo 'export GREP_COLOR="1;32"' >> ~/.bashrc
	echo "if [ -f ~/Documents/SOLUS/GIT_PROJECTS/linuxScripts/bashScripts/.bashrc_vj_script ]; then" >> ~/.bashrc
	echo "	. ~/Documents/SOLUS/GIT_PROJECTS/linuxScripts/bashScripts/.bashrc_vj_script" >> ~/.bashrc
	echo "fi" >> ~/.bashrc
}

mkdir -pv $CDIR
cd $CDIR
git clone https://github.com/viyoriya/linuxScripts.git
$(update_home_bash)
echo "=== home bashrc updated ==="
$(update_root_bash)
echo "=== root bashrc updated ==="
source ~/.bashrc