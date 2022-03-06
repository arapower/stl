#!/bin/sh

set -u

: 'load args' && {
	: 'check $1' && {
		error=''
		[ -r "$1" ] || error="[ERROR] $0 cannot load test code"
		[ -n "$error" ] && echo "$error" && exit 1
		test_code="$1"
		test_code_relative_path="${test_code#${STL_TEST_CODE_DIR}/}"
	}
}

: 'main process' && {
	cat "$test_code" |
	insert_var_for_stl.awk test_code="$test_code_relative_path"
}

