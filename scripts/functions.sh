#!/bin/bash

CPU_CORES=`grep -c ^processor /proc/cpuinfo`

MIN_SPACE=$(( 204800 * $CPU_CORES )) # 200M * 4 = 800M
MIN_SPACE_MB=$(( 200 * $CPU_CORES ))
SPACE_STATUS=0

E_NO_ERR=0
E_NO_SPACE=1
E_NO_ARGS=2
E_UNKNOWN=3

check_space() {
	if [ `df "$1" | tail -n 1 | awk '{ print $4 }'` -lt $MIN_SPACE ]; then
		SPACE_STATUS=1
		return $E_NO_SPACE
	else
		SPACE_STATUS=0
		return $E_NO_ERR
	fi
}



fn_loaded() {
    type "$1" >/dev/null 2>&1
}

