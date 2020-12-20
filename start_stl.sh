#!/bin/sh

set -u

: 'required directory' && {
	# root directory of stl
	STL_ROOT_DIR="$(d=${0%/*}/; [ "_$d" = "_$0/" ] && d='./'; cd "$d"; pwd)"
	export STL_ROOT_DIR
	# directory for functions of stl
	STL_FUNCTION_DIR="$STL_ROOT_DIR/func"
	export STL_FUNCTION_DIR
	# directory for test codes
	STL_TEST_CODE_DIR="$STL_ROOT_DIR/code"
	export STL_TEST_CODE_DIR
	# directory for test data
	STL_TEST_DATA_DIR="$STL_ROOT_DIR/data"
	export STL_TEST_DATA_DIR
	# directory for scripts of stl
	STL_MODULE_DIR="$STL_ROOT_DIR/mod"
	export STL_MODULE_DIR

	PATH="$STL_MODULE_DIR:$PATH"
	export PATH
}

: 'run test codes' && {
	find "$STL_TEST_CODE_DIR" -type f -name '*.sh' |
	xargs -i run_test_code.sh "{}"
}

