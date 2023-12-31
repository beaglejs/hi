#!/bin/sh

function throw() {
    echo "$1";
    exit 1;
}

grep --version > /dev/null 2> /dev/null || throw "grep not working"
