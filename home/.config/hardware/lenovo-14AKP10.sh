
mkdir $XDG_CONFIG_HOME/hardware/ 2>/dev/null
rm $XDG_CONFIG_HOME/hardware/*
# now it should create files that contain ids for all things referenced in any of configs
cd $XDG_CONFIG_HOME/hardware/

## to find id: brightnessctl -l
echo "platform::kbd_backlight" > keyboard_leds_id
# zenbook - asus::kbd_backlight
