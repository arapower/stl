#!/bin/sh

set -u

: 'load args' && {
	: 'check $1' && {
		error=''
		[ -r "$1" ] || error="[ERROR] $0 cannot load test code"
		[ -n "$error" ] && echo "$error" && exit 1
		test_code="$1"
		test_code_relative_path="${test_code#${STL_TEST_CODE_DIR}/}"
		insert_var_for_stl_awk_base="$STL_MODULE_DIR/insert_var_for_stl.awk"
		generate_awk_insert="$STL_MODULE_DIR/generate_awk_insert.sed"
		insert_awk_conditional_print_sed=$(mktemp)
	}
}

: 'Generate sed insert script' && {
	find "$STL_FUNCTION_DIR" -type f |
	xargs cat |
	sed -n -f "$generate_awk_insert" > "$insert_awk_conditional_print_sed"
}

: 'Generate awk script' && {
	insert_var_for_stl_awk=$(mktemp)
	cat "$insert_var_for_stl_awk_base" |
	sed -f "$insert_awk_conditional_print_sed" > "$insert_var_for_stl_awk"
}

: 'main process' && {
	cat "$test_code" |
	awk -f "$insert_var_for_stl_awk" test_code="$test_code_relative_path"
}

