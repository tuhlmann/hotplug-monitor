# Hotplug Monitor Handling

This repository captures my fiddling to create a udev rule and a small script that changes the text scaling factor depending on the plug in state of an external monitor.

The script is pretty much configured to my specific needs. To make use of it you will need to adapt the username this runs at, the path where the files are located and the external monitor port (DP-2 in my case).

Credits for the solution that I found for me go to:

- http://unix.stackexchange.com/questions/4489/a-tool-for-automatically-applying-randr-configuration-when-external-display-is-p
- https://github.com/codingtony/udev-monitor-hotplug
- https://unix.stackexchange.com/questions/281872/udev-monitor-hotplug-rule-not-running

# Installation

```bash
sudo cp etc/udev/rules.d/95-hotplug-monitor.rules /etc/udev/rules.d/95-hotplug-monitor.rules

# Edit rules file
sudo vim /etc/udev/rules.d/95-hotplug-monitor.rules

# Edit script file to do what you need
vim hotplug_monitor.sh
```

## Create a Gnome hotkey

If you want to create a hotkey in Gnome to run the script manually, follow these steps:

- Open Settings -> Keyboard -> Customize Shortcuts -> Own Shortcuts
- Click "Add Shortcut"
    - Give it a name: "Hotplug Monitor"
    - Add the complete path to `hotplug_monitor.sh` including the script name into the command line
    - Choose a shortcut - I use `CTRL + SUPER + ALT + h`

### Notes:

The 2 files `?mon_scale.sh` are not really used in this scenario. I created them and added hotkeys in Gnome to manually switch text-scaling when I didn't have the rule working. They are here for historical and sentimental reasons.

