#!/usr/bin/env sh

primaryWithd=$(xrandr | grep 'connected primary' | awk '{print $4}' | awk -F 'x' '{print $1}')
secondScreen=$(xrandr | grep ' connected' | grep -v "primary" | awk '{print $1}')

# Terminate already running bar instances
killall -q polybar
# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch polybar
if [ -z $secondScreen];then
  if [ "$primaryWithd" -eq "3840" ];then
    SCREEN=eDP1 DPI=192 HEIGHT=50 polybar bottom &
  else
    SCREEN=eDP1 DPI=192 HEIGHT=50 systemd-inhibit --what=handle-lid-switch polybar touch &
  fi
else
  SCREEN=eDP1 DPI=192 HEIGHT=50 polybar bottom &
  SCREEN=$secondScreen DPI=96 HEIGHT=25 polybar bottom &
fi
