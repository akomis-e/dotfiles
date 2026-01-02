
if [ "$#" -eq 0 ]; then
    pactl set-source-mute @DEFAULT_SOURCE@ toggle
else
	if [ "$1" = 'check' ]; then
		pactl get-source-mute @DEFAULT_SOURCE@
	elif [ "$1" = 'off' ]; then
		pactl set-source-mute @DEFAULT_SOURCE@ 1
	elif [ "$1" = 'on' ]; then
		pactl set-source-mute @DEFAULT_SOURCE@ 0
	else 
		echo "Expected arguments: none (toogles mic), 'check', 'off', 'no'"
	fi
fi


