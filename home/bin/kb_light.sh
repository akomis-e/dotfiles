
## to view devices:
# brightnessctl -l

brightnessctl -d $(cat $XDG_CONFIG_HOME/hardware/keyboard_leds_id) set $1


