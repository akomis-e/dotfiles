#!/usr/bin/env bash
HW_TEMPLATE=$(
	printf '%s\n' 'lenovo-14AKP10' 'dell-latitude-3120' 'asus-zenbook' | \
	wofi -E -W 400 --show dmenu -L 3 -p 'select action' -O alphabetical
)

# removing other
# stow -v -D -d ~/dotfiles/hardware/$HW_TEMPLATE -t ~ home

stow -v -d ~/dotfiles/hardware/ -t ~ $HW_TEMPLATE

### keyboard_leds_id
# to find id of the keyborad LEDs:
# 		brightnessctl -l
