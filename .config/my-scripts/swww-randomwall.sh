#!/usr/bin/env bash

# Set the path to the wallpapers directory
wallpapersDir="$HOME/Wallpapers/animegirls/"

# Get a list of all image files in the wallpapers directory
wallpapers=("$wallpapersDir"/*)

# Check if the wallpapers array is empty
# if [ ${#wallpapers[@]} -eq 0 ]; then
#     # If the array is empty, refill it with the image files
#     wallpapers=("$wallpapersDir"/*)
# fi

# Select a random wallpaper from the array
wallpaperIndex=$(( RANDOM % ${#wallpapers[@]} ))
selectedWallpaper="${wallpapers[$wallpaperIndex]}"

# env variables to control transition
SWWW_TRANSITION_DURATION=3
SWWW_TRANSITION=random

# Update the wallpaper using the swww img command
swww img "$selectedWallpaper" --transition-duration ${SWWW_TRANSITION_DURATION} -t ${SWWW_TRANSITION}
wal -i $selectedWallpaper

# Remove the selected wallpaper from the array
unset "wallpapers[$wallpaperIndex]"

