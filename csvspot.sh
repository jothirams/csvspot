#!/bin/bash

version="0.0.1"

color() {
	case $1 in
		purple )
			echo -en '\033[35m';;
		cyan )
			echo -en '\033[36m';;
		red )
			echo -en '\033[31m';;
		green )
			echo -en '\033[32m';;
		reset )
			echo -en '\033[39m';;
	esac

}

color purple

# Colors

echo -e '------------------------------------------------------------------------------------------------'
if [ -z "$2" ]
    then
        count=1
else
    count=$2
fi
for i in `grep -l $1 *` ; do color cyan; echo "$i :"; color green; head -n1 $i; color reset ; grep -m$count $1 $i; echo; done
color red; echo -en '------------------------------------------------------------------------------------------------'
color reset