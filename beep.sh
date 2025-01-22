#!/bin/bash
export DISPLAY=:0
export XDG_RUNTIME_DIR=/run/user/$(id -u)
audio_file="/home/saurabh/Downloads/jai-shree-ram-notification-ringtone-tone-60275.wav"
player="/usr/bin/aplay"
$player $audio_file


