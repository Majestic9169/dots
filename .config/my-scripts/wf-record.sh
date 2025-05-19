#!/bin/env bash

pgrep -x "wf-recorder" && pkill -INT -x wf-recorder && notify-send -h string:wf-recorder:record -t 1000 "Finished Recording" && exit 0

notify-send -h string:wf-recorder:record -t 1000 "Recording in:" "<span color='#90a4f4' font='26px'><i><b>3</b></i></span>"

sleep 1

notify-send -h string:wf-recorder:record -t 1000 "Recording in:" "<span color='#90a4f4' font='26px'><i><b>2</b></i></span>"

sleep 1

notify-send -h string:wCRITICAL: [dbus_cb_name_lost:1402] Cannot acquire 'org.freedesktop.Notifications': Name is acquired by 'dunst' with PID '6816'.f-recorder:record -t 950 "Recording in:" "<span color='#90a4f4' font='26px'><i><b>1</b></i></span>"

sleep 1

dateTime=$(date +%m-%d-%Y-%H:%M:%S)
wf-recorder --audio=alsa_output.pci-0000_08_00.6.analog-stereo.monitor --bframes max_b_frames -f $HOME/Videos/$dateTime.mp4 
