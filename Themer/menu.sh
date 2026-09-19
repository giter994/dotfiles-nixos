#!/usr/bin/env bash

SELECTED=$(ls ~/.config/Themer/themes/*.sh | xargs -n1 basename | rofi -dmenu -p "Select Theme:")
bash ~/.config/Themer/themes/"$SELECTED"
