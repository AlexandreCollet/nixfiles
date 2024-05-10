#!/usr/bin/env bash

declare -A monitors
declare -A setups

monitors[laptop]='"Chimei Innolux Corporation 0x14F5"'
monitors[home_center]='"Dell Inc. DELL U2414H 9TG464BE2EPL"'

setups[default]="[${monitors[laptop]}]"
setups[home_nodock]="[${monitors[laptop]}, ${monitors[home_center]}]"

update_setup() {
    monitors=$(hyprctl monitors all -j)
    monitors_descriptions=$(jq ".[].description" <<< "${monitors}")

    for key in "${!setups[@]}" 
    do
        is_current_setup=$(jq --slurp --argjson setup "${setups[$key]}" '(($setup - .) | length) == 0 and (($setup | length) == (. | length))' <<< "${monitors_descriptions}")
        echo "test $key -> $is_current_setup"
        if [[ "$is_current_setup" ==  true ]]
        then
            cp ~/nixfiles/home/desktop_environment/hyprland/hyprland/monitors_${key}.conf ~/nixfiles/home/desktop_environment/hyprland/hyprland/monitors_current.conf
            break
        fi
    done
}

handle() {
    
    case $1 in
        monitoradded*) echo $1; update_setup;;
        monitorremoved*) echo $1; update_setup;;
    esac
}

handle "monitoradded";

socat -U - UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done