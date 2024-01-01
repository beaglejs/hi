#!/bin/bash

function throw {
    echo "$1";
    exit 1;
}

function check {
    v=$($1 --version 2>&1 | grep -E -o '[0-9]+\.[0-9\.]+' | head -n1)
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
mkdir tmp
sudo NEEDRESTART_SUSPEND=y TMPDIR=$PWD/tmp apt -o Dir::Cache=$PWD -o Dir::Cache::archives=$PWD/archives -o APT::Sandbox::User=root install build-essential --assume-yes
check sort
check bash
check ld
check bison "sudo NEEDRESTART_SUSPEND=y apt install bison --assume-yes"
check diff
check find
check gawk "sudo NEEDRESTART_SUSPEND=y apt install gawk --assume-yes"
check gcc "sudo NEEDRESTART_SUSPEND=y apt install gcc --assume-yes"
check g++
check grep
check m4
check make
check patch
check perl
check python3
check sed
check tar
check texi2any "sudo NEEDRESTART_SUSPEND=y apt install texinfo --assume-yes"
check xz

# kernel version
uname -r | grep -E -o '^[0-9\.]+'

if mount | grep -q "devpts on /dev/pts" && [ -e /dev/ptmx ]
then
    echo "linux kernel supports unix 98 pty"
fi

if printf "int main(){}" | g++ -x c++ -
then
    echo "compiler is working"
fi
