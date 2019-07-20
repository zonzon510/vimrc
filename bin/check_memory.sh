#!/bin/bash
threshold=1000
while :
do
	avail=$(free -m|awk '/^Mem:/{print $7}')
	message="Available Memory: $avail"
	echo $message

	if [ $avail -lt $threshold ]
	then
		notify-send "exceeded memory limit"
		killall firefox
	fi

	sleep 30
done
