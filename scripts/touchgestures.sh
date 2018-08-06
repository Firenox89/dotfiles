kill `ps aux | grep libinput | grep -v grep | awk '{print $2}'`
killall -q touchegg

# Wait until the processes have been shut down
while pgrep -x touchegg >/dev/null; do sleep 1; done

touchegg &
libinput-gestures &
