#!/usr/bin/env bash

source ~/bin/wofi-utils.sh
exit_if_wofi_is_running                # check if wofi is already running. If so - don't run a second copy

if shutdown --show >/dev/null; then
  SHUTDOWN_CMD='2) shutdown: cancel'
else
  # 'shutdown --show' returned 1 - no shutdown is scheduled
  SHUTDOWN_CMD="2) shutdown: in 1 min"
fi

CMD_INPUT=$(
	printf '%s\n' '1) suspend' "$SHUTDOWN_CMD" '3) reboot' '4) sway: logout' | \
	wofi -W 400 --show dmenu -L 5 -p 'select action' -O alphabetical
)

case $CMD_INPUT in
  '1) suspend')
    systemctl suspend
    ;;
  '2) shutdown: in 1 min')
    shutdown +1
    notify-send "Shutting down in 1 minutes"
    ;;
  '2) shutdown: cancel')
    shutdown -c
  	notify-send "Shutdown: canceled"
    ;;
  '3) reboot')
    shutdown -r +1
    ;;
  '4) sway: logout')  
    swaymsg exit
    ;;  
  *)
    STATEMENTS
    ;;
esac
