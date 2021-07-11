#!/bin/sh

set -u

: 'command options' && {
	# xargs: -i or -I
	xargs_opt_i=''
	xargs_opt_i_check=$(echo OK | xargs -I@ echo @ 2>/dev/null)
	if [ "_$xargs_opt_i_check" = '_OK' ]; then
		xargs_opt_i='-I'
	else
		xargs_opt_i='-i'
	fi
}

: 'required directory' && {
	# NG flag
	NG_logs=$(mktemp)
	export NG_logs
	# root directory of project
	PRJ_ROOT_DIR="$(d=${0%/*}/; [ "_$d" = "_$0/" ] && d='./'; cd "$d.."; pwd)"
	export PRJ_ROOT_DIR
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

	# sed置換用にLFを定義
	LF=$(printf '\\\n_')
	LF=${LF%_}
	export LF
}

: 'run test codes' && {
	find "$STL_TEST_CODE_DIR" -type f -name '*.sh' |
	xargs "$xargs_opt_i" @ run_test_code.sh "@"
}

: 'exit' && {
	error_exit=$(cat "$NG_logs")
	# NGがあった場合はエラー終了する
	[ "_$error_exit" = "_" ] && exit 0
	exit 1
}
