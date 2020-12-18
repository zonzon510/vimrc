#!/bin/bash
echo downloading $1
until snap download $1; do
	echo download disrupted, resuming in 5 sedonds...
	sleep 5
done
