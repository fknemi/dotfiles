#!/bin/bash

# Variables
scriptsDir="$HOME/.config/hypr/scripts"
wallpaper="$HOME/Pictures/wallpapers/WALLPAPER.jpg"
waybar_style="$HOME/.config/waybar/style/[Colored] Translucent.css"
#kvantum_theme="Tokyo-Night"

swww="swww img"
effect="--transition-bezier .43,1.19,1,.4 --transition-fps 30 --transition-type grow --transition-pos 0.925,0.977 --transition-duration 2"

# Check if a marker file exists.
if [ ! -f ~/.config/hypr/.initial_startup_done ]; then

    # Initialize pywal and wallpaper
	if [ -f "$wallpaper" ]; then
		wal -i $wallpaper -s -t > /dev/null 
		swww init && $swww $wallpaper $effect
	    "$scriptsDir/PywalSwww.sh" > /dev/null 2>&1 & 
	fi
     
    # Initial symlink for Pywal Dark and Light for Rofi Themes
    ln -sf "$HOME/.cache/wal/colors-rofi-dark.rasi" "$HOME/.config/rofi/pywal-color/pywal-theme.rasi" > /dev/null 2>&1 &

    # initiate GTK dark mode and apply icon and cursor theme
    
    # initiate kvantum theme
    #kvantummanager --set "$kvantum_theme" > /dev/null 2>&1 &

    # initiate the kb_layout (for some reason) waybar cant launch it
    "$scriptsDir/SwitchKeyboardLayout.sh" > /dev/null 2>&1 &

    # Initial waybar style
	if [ -f "$waybar_style" ]; then
    	ln -sf "$waybar_style" "$HOME/.config/waybar/style.css"
		"$scriptsDir/Refresh.sh" > /dev/null 2>&1 & 
	fi

    # Create a marker file to indicate that the script has been executed.
    touch ~/.config/hypr/.initial_startup_done

    exit
fi
