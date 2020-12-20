#!/bin/sh

set -u

: 'load args' && {
	: 'check $1' && {
		error=''
		[ -r "$1" ] || error="[ERROR] $0 cannot load test code"
		[ -n "$error" ] && echo "$error" && exit 1
		test_code="$1"
		test_code_name="${1##*/}"
	}
#	: 'destination_directory' && {
#		destination_directory="$2"
#	}
}

: 'main process' && {
	cat "$test_code" |
	#insert_var_for_stl.awk test_code_name="$test_code_name" > "$destination_directory/$test_code_name"
	insert_var_for_stl.awk test_code_name="$test_code_name"
}

