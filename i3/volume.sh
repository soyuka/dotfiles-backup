#!/bin/bash
sink=$(pacmd list-sinks | grep -i -E '\* index' | sed -r "s/^.*\* index: //")
if [[ $1 == "mute" ]]; then
        pactl set-sink-mute $sink toggle
else
        pactl set-sink-volume $sink $1
fi
