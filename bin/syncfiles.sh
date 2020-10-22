#!/bin/bash

directory="hekaj:~/diffraction_net2/"
while :
do
	# sync files
	echo "sync files"
	rsync -rav -e ssh --include '/' \
	--include='*.txt' \
	--include='testim.png' \
	--exclude='*' $directory ./

	sleep 1.5
done

