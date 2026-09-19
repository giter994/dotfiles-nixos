#!/usr/bin/env bash

#WALLPAPERS FOLDER
WALLPAPERS="$HOME/Pictures/Wallpapers"

#INPUTS
HYPRLAND_THEMES="$HOME/.config/Themer/themes/hyprland"
WAYBAR_THEMES="$HOME/.config/Themer/themes/waybar"
KITTY_THEMES="$HOME/.config/Themer/themes/kitty"
ROFI_THEMES="$HOME/.config/Themer/themes/rofi"

#OUTPUTS
HYPRLANDFILE="$HOME/.config/hypr/colors.lua"
WAYBARFILE="$HOME/.config/waybar/colors.css"
ROFIFILE="$HOME/.config/rofi/colors.rasi"
KITTY_FILE="$HOME/.config/kitty/current-theme.conf"

TRANSITION="1.25"

case "$1" in
catpuccin)
WALLPAPER="$WALLPAPERS/cat.jpg"
THEME_FILE="$WAYBAR_THEMES/catpuccin.css"
HYPRLAND_THEME_FILE="$HYPRLAND_THEMES/catpuccin.lua"
ROFI_THEME_FILE="$ROFI_THEMES/catpuccin.rasi"
KITTY_THEME_FILE="$KITTY_THEMES/catpuccin.conf"
        ;;
winter)
WALLPAPER="$WALLPAPERS/snow.png"
THEME_FILE="$WAYBAR_THEMES/winter.css"
ROFI_THEME_FILE="$ROFI_THEMES/winter.rasi"
HYPRLAND_THEME_FILE="$HYPRLAND_THEMES/winter.lua"
KITTY_THEME_FILE="$KITTY_THEMES/winter.conf"
        ;;
rose)
WALLPAPER="$WALLPAPERS/rose.jpg"
THEME_FILE="$WAYBAR_THEMES/rose.css"
HYPRLAND_THEME_FILE="$HYPRLAND_THEMES/rose.lua"
ROFI_THEME_FILE="$ROFI_THEMES/rose.rasi"
KITTY_THEME_FILE="$KITTY_THEMES/rose.conf"
        ;;
*)
exit 1
        ;;
esac

cp "$ROFI_THEME_FILE" "$ROFIFILE"

#awww kill 2>/dev/null
awww-daemon &
sleep 0.1
awww img --transition-type center --transition-duration "$TRANSITION" "$WALLPAPER"

sleep 0.7
cp "$THEME_FILE" "$WAYBARFILE"
#pkill -SIGUSR2 waybar

cp "$HYPRLAND_THEME_FILE" "$HYPRLANDFILE"
cp "$KITTY_THEME_FILE" "$KITTY_FILE"

#kill -SIGUSR1 $(pgrep kitty)