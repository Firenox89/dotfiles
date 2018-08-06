#! /bin/bash
w=$(xrandr | grep 'connected primary' | awk '{print $4}' | awk -F 'x' '{print $1}')
touchID=$(xinput | grep Finger | awk '{print $7}' | awk -F '=' '{print $2}')
if [ "$w" -eq "3840" ];then
  xinput set-prop "$touchID" "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1
  xrandr -o 1
  i3-msg restart
else
  xinput set-prop "$touchID" "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1
  xrandr -o 0
  i3-msg restart
fi
