#!/bin/sh
oflag="no"

while getopts ":oif" name;
do
	case "$name" in 
	o) oflag="yes";;
	i) ./alan "$oflag" || exit 1
	   exit 1;;
	f) ./alan "$oflag" || exit 1
	   /usr/lib/llvm-6.0/bin/llc output.ll -o output.s
    	   clang output.s lib.a -o exe
	   exit 1;;
	?) printf "Usage: alan.sh [-o] [-i|-f] \nExample: alan.sh -i < test.alan\n"
	   exit 2;;
	esac
done

