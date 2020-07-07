#! /bin/bash

echo $1
echo $2
if [ "$1" == "inc" ];then
  xbacklight -inc $2
elif [ "$1" == "dec" ];then
  if [ $(printf '%d' `xbacklight` ) -gt 6 ];then
    xbacklight -dec $2
  else
    xbacklight -set 1
  fi
else
  echo "Wrong arguments."
fi
notify-send " " -i notification-display-brightness-low -h int:value:`xbacklight` -h string:x-canonical-private-synchronous:brightness
