#! /bin/bash

hostname=$(hostname)

if [ $hostname == "SirMixALot" ]; then
   xrandr --output DisplayPort-1 --auto --primary  --output HDMI-A-1 --auto --right-of DisplayPort-1 --off --output HDMI-A-0 --off  
fi 
