RED='#fb4934'
BLUE='#83a598'
YELLOW='#d79921'

debug_log(){
  cat
  # tee -a ~/.config/sway/status-bar.log
}

echo '{"version":1}' | debug_log
echo '['             | debug_log
echo '[]'            | debug_log
while :;
do

  # MIC_STATUS_RAW=$(pactl get-source-mute @DEFAULT_SOURCE@)
  MIC_STATUS=''
  # if [[ $MIC_STATUS_RAW = 'Mute: yes' ]]
  #   then
  #     MIC_STATUS="🎤(Mic:OFF)" # 🕩 🕪  🎤 Mic:off
  #   else
  #     MIC_STATUS=''
  # fi

  VOLUME_STATUS=''
  # 🕨 🕩 🕪
  # VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | head -n 1 | cut -d'/'  -f2 | tr -d ' ')
  # VOLUME_VAL=${VOLUME::-1}
  # if (( 50<=$VOLUME_VAL ))
  # then
  #     VOLUME_STATUS="🕪 $VOLUME_VAL"
  # elif (( 1<=$VOLUME_VAL && $VOLUME_VAL<=49 ))
  # then
  #     VOLUME_STATUS="🕩 $VOLUME_VAL" 
  # else
  #     VOLUME_STATUS="🕨 $VOLUME_VAL"
  # fi

  # setxkbmap -query | grep layout

  KEYBOARD_LAYOUT_RAW=$(swaymsg -t get_inputs | jq '.[0].xkb_active_layout_name')
  KEYBOARD_LAYOUT=''
  if [[ $KEYBOARD_LAYOUT_RAW = '"English (US)"' ]] then
      KEYBOARD_LAYOUT='🖮US🇺🇸'
  elif [[ $KEYBOARD_LAYOUT_RAW = '"Ukrainian"' ]] then
      KEYBOARD_LAYOUT='🖮UA🇺🇦'
  fi


  # tr -d ' '  		-- removes all whitespaces
  # cut -d':' -f2 	-- splits it by ':', takes second part
  POWER_PERCENT=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | tr -d ' ' | cut -d':' -f2)
  POWER_STATE=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep state | tr -d ' ' | cut -d':' -f2)
  if [[ $POWER_STATE = 'charging' ]] 
  then
      POWER_STATE_SYMBOL='⇑'
  else 
      POWER_STATE_SYMBOL=''
  fi
  POWER="$POWER_PERCENT$POWER_STATE_SYMBOL"
  

  # cutting the percent symbol
  POWER_VAL=${POWER::-1}
  if (( $POWER_VAL < 20 ))
    then
      POWER_COLOR="$RED"
    else
      POWER_COLOR="$BLUE"
  fi

  DATE_TIME=$(date +'%Y-%m-%d %H:%M')

  echo ',['                                                                                        | debug_log
  echo  "    {\"name\":\"volume\", \"full_text\": \"$MIC_STATUS\", \"color\": \"$RED\" },"         | debug_log
  echo  "    {\"name\":\"volume\", \"full_text\": \"$VOLUME_STATUS\", \"color\": \"$YELLOW\" },"   | debug_log
  echo  "    {\"name\":\"volume\", \"full_text\": \"$KEYBOARD_LAYOUT\", \"color\": \"$YELLOW\" }," | debug_log
  echo  "    {\"name\":\"battery\", \"full_text\": \"$POWER\", \"color\": \"$POWER_COLOR\" },"     | debug_log
  echo  "    {\"name\":\"time\", \"full_text\": \"$DATE_TIME\"}"                                   | debug_log
  echo ']'                                                                                         | debug_log
  sleep 1
done
