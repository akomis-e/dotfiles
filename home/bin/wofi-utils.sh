#!/usr/bin/env bash

exit_if_wofi_is_running () {
  if pgrep -x wofi >/dev/null 2>&1; then
  	exit 0
  fi
}

