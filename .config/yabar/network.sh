#!/bin/bash

interfaces=$(ifconfig | grep BROADCAST | awk '{print substr($1,0,length($1)-1)}')

status="Not connected."

for i in $interfaces; do
        info=$(iw dev $i link);

        if [ "$info" = "Not connected." ]; then
                continue;
        fi

        # ips[0] ipv4, ips[1] ipv6
        readarray -t ips <<< $(ifconfig | grep $i -A2 | grep inet | awk '{print $2}')

        if [ "${i:0:1}" = "w" ]; then
                ssid=$(echo "$info" | grep SSID | awk '{print $2}')

                signal=$((2 * ($(echo "$info" | grep signal | awk '{print $2}') + 100)))
                signal=$(($signal>100?100:$signal))

                status=$(printf " %s (%s %s%%)" ${ips[0]} $ssid $signal)
        else
                status=$("⌬ %s" ${ips[0]})
        fi

        break;
done

echo $status
