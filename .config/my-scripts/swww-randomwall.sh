#!/usr/bin/env bash

# Set the path to the wallpapers directory
THEME=animegirls
wallpapersDir="$HOME/Wallpapers/$THEME/"

# Get a list of all image files in the wallpapers directory
wallpapers=($(ls $wallpapersDir))

# Select a random wallpaper from the array
wallpaperIndex=$(( RANDOM % ${#wallpapers[@]} ))
selectedWallpaper="$wallpapersDir/${wallpapers[$wallpaperIndex]}"

# env variables to control transition
SWWW_TRANSITION_DURATION=3
SWWW_TRANSITION=random

# Update the wallpaper using the swww img command
echo "[~] Selected Wallpaper is $selectedWallpaper"
swww img "$selectedWallpaper" --transition-duration ${SWWW_TRANSITION_DURATION} -t ${SWWW_TRANSITION}
wal -i "$selectedWallpaper"
killall -SIGUSR2 waybar
cp ~/.cache/wal/config ~/.config/cava/config
pkill -USR2 cava
