#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload ws -c ~/.config/polybar/config.ini &
    MONITOR=$m polybar --reload tray -c ~/.config/polybar/config.ini &
    MONITOR=$m polybar --reload title -c ~/.config/polybar/config.ini &
  done
else
  polybar --reload ws &
  polybar --reload tray &
  polybar --reload title &

fi

# Launch Polybar
# polybar top -c ~/.config/polybar/config.ini &


