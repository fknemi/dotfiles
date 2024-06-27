#!/bin/bash
# For Swaylock

sleep 0.5s; swaylock \
	--image "$HOME/Pictures/wallpapers/WALLPAPER.jpg" \
	--daemonize \
	--clock \
	--indicator \
	--indicator-radius 200 \
	--indicator-thickness 14 \
	--text-color 171f24 \
  	--text-ver-color 171f24  \
  	--text-wrong-color 171f24 \
  	--text-clear-color 171f24 \
	--text-caps-lock-color 171f24 \
	--ring-color 00000000 \
	--ring-ver-color 00000000 \
	--ring-wrong-color 00000000 \
	--ring-clear-color 00000000 \
	--ring-caps-lock-color 00000000 \
	--key-hl-color 171f2450 \
	--line-color 00000000 \
	--line-ver-color 00000000 \
	--line-wrong-color 00000000 \
	--line-clear-color 00000000 \
	--line-caps-lock-color 00000000 \
	--inside-color 171f2420 \
	--inside-ver-color 171f2420 \
	--inside-wrong-color 171f2420 \
	--inside-clear-color 171f2420 \
	--inside-caps-lock-color 171f2420 \
	--separator-color 00000000 \
	--effect-blur 7x3 \
	--grace 2 \
	--grace-no-mouse \
	--grace-no-touch \
	--fade-in 0.1 & disown
