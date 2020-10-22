#!/bin/bash

directory="hekaj:~/diffraction_net2/"
while :
do
	# sync files
	echo "sync files"
	rsync -rav -e ssh --include '/' \
	--include='*.txt' \
	--include='wfstest_0test*.gif' \
	--include='wfstest_2test*.gif' \
	--include='/nn_pictures/' \
	--include='/nn_pictures/wfstest_2_pictures/' \
	--include='/nn_pictures/wfstest_2_pictures/46/' \
	--include='/nn_pictures/wfstest_2_pictures/46/training/' \
	--include='/nn_pictures/wfstest_2_pictures/46/training/*.png' \
	--exclude='*' $directory ./

	sleep 1.5
done

