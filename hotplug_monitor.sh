#!/bin/bash

status=$(cat /sys/class/drm/card0-DP-2/status);

CURRENT_DIR=$( dirname $0 )

logfile="$CURRENT_DIR/hotplug_monitor.txt"

function connect {
  echo "run connect" >> $logfile
  /usr/bin/gsettings set org.gnome.desktop.interface text-scaling-factor 1 >> $logfile 2>&1
}
 
function disconnect {
  echo "run disconnect" >> $logfile
  /usr/bin/gsettings set org.gnome.desktop.interface text-scaling-factor 1.15 >> $logfile 2>&1
}


touch "$logfile"
chmod 664 "$logfile"
echo $(date +"%Y-%m-%d_%H-%M-%S") | tee "$logfile" 
echo "DISPLAY: $DISPLAY" >> $logfile
echo "XAUTHORITY: $XAUTHORITY" >> $logfile
echo "status of /sys/class/drm/card0-DP-2/status: $status" >> $logfile

if [ "connected" == "$status" ]
then
  connect
else
  disconnect
fi

