# keyboard_leds_toggle

## to view devices:
# brightnessctl -l

# to run manually:
# brightnessctl -d $(cat $XDG_CONFIG_HOME/hardware/keyboard_leds_id) set 0
# brightnessctl -d $(cat $XDG_CONFIG_HOME/hardware/keyboard_leds_id) get 

KB_LEDS_ID=$(cat $XDG_CONFIG_HOME/hardware/keyboard_leds_id)
KB_LEDS_LVL=$(brightnessctl -d $KB_LEDS_ID get)
if [[ "$KB_LEDS_LVL" == 0 ]] then 
	brightnessctl -d $KB_LEDS_ID set 1
else 
	brightnessctl -d $KB_LEDS_ID set 0
fi