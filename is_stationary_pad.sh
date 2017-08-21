#!/bin/bash
flags=$(mdls $1 -name kMDItemFSFinderFlags | cut -d'=' -f2 | cut -c 2-)
if (($flags > 2047)); then
	echo $1;
fi