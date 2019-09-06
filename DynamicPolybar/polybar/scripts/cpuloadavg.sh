#!/bin/sh

awk '{print $1" "$2" "$3" "$4}' < /proc/loadavg
