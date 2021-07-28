#!/bin/bash

# Init : github.com/viyoriya

cwd=$PWD
R_LIST=gitRepoList.txt

#===== find all the git repos excluding .tmux or .cache or .config ===
#find ~/ \( -name .tmux -o -name .cache -o -name .config \) -prune -false -o -name .git -printf '%h\n' > gitRepoList.txt

#=====  find all the git repos =====
find ~/ -name .git -printf '%h\n' > $R_LIST

if [[ ! -f "$R_LIST" ]]; then
    echo "==================================="
    echo "== $R_LIST not found ===="
    echo "==================================="
    exit 0;
fi    

while read dir; do
    
    if [[ -d $dir ]]; then
        cd $dir && git pull &&  echo "$PWD == Update done !!!"
    fi    

done < $R_LIST

rm $cwd/$R_LIST
