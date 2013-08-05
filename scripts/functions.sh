#!/bin/bash

MIN_SPACE=204800  # 200M

E_NO_SPACE=1
E_NO_ARGS=2

check_space() {
	if [ `df "$1" | tail -n 1 | awk '{ print $4 }'` -lt $2 ]; then
		echo 1;
	else
		echo 0;
	fi
}

fn_loaded() {
    type "$1" >/dev/null 2>&1
}

