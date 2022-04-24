#!/bin/sh

: 'load args' && {
	test_code="$1"
}

: 'load functions of stl' && {
	test_functions_file=$(mktemp)
	find "$STL_FUNCTION_DIR" -type f |
	sed 's/^/. "/' |
	sed 's/$/"/' > "$test_functions_file"
	. "$test_functions_file"
}

: 'insert variables for stl in test code' && {
	inserted_test_code=$(mktemp)
	insert_var_for_stl.sh "$test_code" > "$inserted_test_code"
}

: 'load test code' && {
	. "$inserted_test_code"
}

: 'run test code' && {
	test_code_functions=$(mktemp)
	cat "$inserted_test_code" |
	grep "^[ 	]*stl_" |
	# extract only function name
	sed 's/[ 	]*\(stl_[^(]*\) *(.*/\1/' |
	# add setup and teardown functions before and after each
	sed 's/.*/setup'"$LF"'&'"$LF"'teardown/' > "$test_code_functions"
	. "$test_code_functions"
}
