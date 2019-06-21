#!/usr/bin/env sh

primaryWithd=$(xrandr | grep ' connected primary' | awk '{print $4}' | awk -F 'x' '{print $1}')
primaryScreen=$(xrandr | grep ' connected primary' | awk '{print $1}')
secondScreen=$(xrandr | grep ' connected' | grep -v "primary" | head -1 | awk '{print $1}')

echo $HOME
hostname=$(hostname)

echo primaryScreen $primaryScreen
echo secondScreen $secondScreen
# Terminate already running bar instances
killall -q polybar
# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

echo $primaryScreen
# Launch polybar
if [ "$hostname" == "SirMixALot" ];then
  if [ -z $primaryScreen];then
    SCREEN=$secondScreen DPI=96 HEIGHT=30 NETWORK=enp6s0 polybar sir &
  else
    SCREEN=$primaryScreen DPI=96 HEIGHT=30 NETWORK=enp6s0 polybar sir &
  fi
else if [ "$hostname" == "snotra" ];then
  SCREEN=$primaryScreen DPI=96 HEIGHT=30 NETWORK=wlp4s0 polybar snotra &
  SCREEN=DP1 DPI=96 HEIGHT=30 NETWORK=enp0s31f6 polybar snotra &
  SCREEN=HDMI2 DPI=96 HEIGHT=30 NETWORK=enp0s31f6 polybar snotra &
elif [ -z $secondScreen];then
  if [ "$primaryWithd" -eq "3840" ];then
    SCREEN=eDP1 DPI=192 HEIGHT=50 NETWORK=wlp2s0 polybar bottom &
  else
    SCREEN=eDP1 DPI=192 HEIGHT=50 NETWORK=wlp2s0 systemd-inhibit --what=handle-lid-switch polybar touch &
  fi
else
  SCREEN=eDP1 DPI=192 HEIGHT=50 NETWORK=wlp2s0 polybar bottom &
  SCREEN=$secondScreen DPI=96 HEIGHT=25 NETWORK=wlp2s0 polybar bottom &
fi
fi
