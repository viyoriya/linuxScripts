#!/bin/bash

#viyoriya

if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0000000" #black
    echo -en "\e]P19e1828" #darkred
    echo -en "\e]P200FF00" #darkgreen
    echo -en "\e]P3594e43" #brown
    echo -en "\e]P44186be" #darkblue
    echo -en "\e]P5963c59" #darkmagenta
    echo -en "\e]P6418179" #darkcyan
    echo -en "\e]P7bebebe" #lightgrey
    echo -en "\e]P84c566a" #darkgrey
    echo -en "\e]P9cf6171" #red
    echo -en "\e]PA74ed09" #green
    echo -en "\e]PB74ed09" #yellow-green
    echo -en "\e]PC4186be" #blue
    echo -en "\e]PDcf9ebe" #magenta
    echo -en "\e]PE71bebe" #cyan
    echo -en "\e]PFffffff" #white
    #clear     #for background artifacting
fi
