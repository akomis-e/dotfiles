
# TEST=$(pgrep -x wofi >/dev/null 2>&1)
# TEST=$(pgrep -x wofi >/dev/null 2>&1 && echo "true" || echo "false")

notify-send "test output:$TEST"