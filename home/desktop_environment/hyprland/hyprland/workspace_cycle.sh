#!/usr/bin/env bash

if [ $# -eq 0 ]
  then
    echo "Action "next" or "previous" must be provided as argument."
    exit 2
fi

go_previous() {
    current_workspace=$(hyprctl activeworkspace -j | jq ".id")
    min_workspace=$(hyprctl workspaces -j | jq -r "map(.id) | min")

    if [[ "$current_workspace" == "$min_workspace" ]]
    then
        return
    fi

    hyprctl dispatch workspace e-1
}

go_next() {
    current_workspace=$(hyprctl activeworkspace -j | jq ".id")
    max_workspace=$(hyprctl workspaces -j | jq -r "map(.id) | max")

    if [[ "$current_workspace" == "$max_workspace" ]]
    then
        return
    fi

    hyprctl dispatch workspace e+1
}

case $1 in
    next)
        go_next 
        ;;
    previous) 
        go_previous
        ;;
    *)
        echo "Unknown action"
        ;;
esac
