#!/bin/bash

function throw {
    echo "$1";
    exit 1;
}

function check {
    v=$($1 --version 2>&1 | head -n1 | grep -E -o '[0-9]+\.[0-9\.]+' | head -n1)
    if [ "$v" != "" ]; then
        echo "$1 version $v"
    else
	if [ "$2" != "" ]; then
	    $2
	else
	    echo $1 need
	fi
    fi
}

grep --version > /dev/null 2> /dev/null || throw "grep not working"
sed '' /dev/null || throw "sed not working"
sort /dev/null || throw "sort not working"

sudo apt update
sudo NEEDRESTART_SUSPEND=y apt -o Dir::Cache=$PWD -o Dir::Cache::archives=$PWD/archives -o APT::Sandbox::User=root install build-essential 
check sort
check bash
check ld
check bison "sudo apt install bison --assume-yes"
check diff
check find
check gawk "sudo apt install gawk --assume-yes"
# sudo apt clean
check gcc
# check gcc "sudo NEEDRESTART_SUSPEND=y apt -o Dir::Cache=$PWD -o Dir::Cache::archives=$PWD/archives install gcc --assume-yes"

