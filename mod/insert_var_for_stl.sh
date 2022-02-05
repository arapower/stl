#!/bin/sh

set -u

: 'load args' && {
	: 'check $1' && {
		error=''
		[ -r "$1" ] || error="[ERROR] $0 cannot load test code"
		[ -n "$error" ] && echo "$error" && exit 1
		test_code="$1"
	}
}

: 'main process' && {
	cat "$test_code" |
	insert_var_for_stl.awk test_code="$test_code"
}

