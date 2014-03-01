#!/bin/bash

version="0.0.1"

# Various colors
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

# Usage of the function
usage() {
  cat <<EOF

  Usage: csvspot [options] [term ...]

  Options:
    -V, --version           Output version
    -C, --count             Number of instances of the matches
    -h, --help              This message.
EOF
}

# Default count value
count=1

while [[ "$1" =~ ^- ]]; do
  case $1 in
  	-V | --version )
		echo $version
		exit
		;;
   	-C | --count )
	  shift; count=$1
	  ;;
    -h | --help )
      usage
      exit
      ;;
  esac
  shift
done

# Search and print
color purple
echo -e '------------------------------------------------------------------------------------------------'
for i in `grep -l $1 *` 
do 
	color cyan # File name color
	echo "$i :"
	color green # First row color
	head -n1 $i
	color reset # Reset color
	grep -m$count $1 $i
	echo # Empty line between files
done

color red; echo -en '------------------------------------------------------------------------------------------------'
color reset


