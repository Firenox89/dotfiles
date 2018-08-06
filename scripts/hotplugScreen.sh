#! /bin/bash
secondScreen=$(xrandr | grep ' connected' | grep -v "primary" | awk '{print $1}')
HOME=/home/firenox
if [ -z $secondScreen];then
  xrandr --dpi 96 --output eDP1 --auto --output DP1-2 --above eDP1 --off && xrdb -merge -I$HOME $HOME/.Xresources

else
  xrandr --dpi 96 --output eDP1 --auto --output $secondScreen --above eDP1 --auto && xrdb -merge -I$HOME $HOME/.XresourcesLowDPI
fi
i3-msg restart
