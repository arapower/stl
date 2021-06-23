# function definitions used in stl

# Use: The output result (standard + error output) must be an exact match
# Arg1: Execution command string to be tested
# Arg2: Expected output result
assert_both_equal () {
	(
	: 'define' && {
		# Execution command string to be tested
		target_command="$1"
		# Expected output result
		expected="$2"
	}

	: 'execute' && {
		# Actual output result
		actual=$(
			printf "%s" "$target_command" |
			sh 2>&1
		)
	}
	: 'compare' && {
		[ "_$expected" = "_$actual" ] && print_OK || print_NG "$expected" "$actual" 
	}
	)
}

# Use: The output result (standard + error output) must not be an exact match
# Arg1: Execution command string to be tested
# Arg2: Expected output result
assert_both_not_equal () {
	(
	: 'define' && {
		# Execution command string to be tested
		target_command="$1"
		# Expected output result
		expected="$2"
	}

	: 'execute' && {
		# Actual output result
		actual=$(
			printf "%s" "$target_command" |
			sh 2>&1
		)
	}
	: 'compare' && {
		[ "_$expected" != "_$actual" ] && print_OK || print_NG "$expected" "$actual" 
	}
	)
}

# Use: The output result (standard output) must be an exact match
# Arg1: Execution command string to be tested
# Arg2: Expected output result
assert_equal () {
	(
	: 'define' && {
		# Execution command string to be tested
		target_command="$1"
		# Expected output result
		expected="$2"
	}

	: 'execute' && {
		# Actual output result
		actual=$(
			printf "%s" "$target_command" |
			sh 2> /dev/null
		)
	}
	: 'compare' && {
		[ "_$expected" = "_$actual" ] && print_OK || print_NG "$expected" "$actual" 
	}
	)
}

# Use: The output result (standard output) must not be an exact match
# Arg1: Execution command string to be tested
# Arg2: Expected output result
assert_not_equal () {
	(
	: 'define' && {
		# Execution command string to be tested
		target_command="$1"
		# Expected output result
		expected="$2"
	}

	: 'execute' && {
		# Actual output result
		actual=$(
			printf "%s" "$target_command" |
			sh 2> /dev/null
		)
	}
	: 'compare' && {
		[ "_$expected" != "_$actual" ] && print_OK || print_NG "$expected" "$actual" 
	}
	)
}

# Use: The output result (error output) must be an exact match
# Arg1: Execution command string to be tested
# Arg2: Expected output result
assert_error_equal () {
	(
	: 'define' && {
		# Execution command string to be tested
		target_command="$1"
		# Expected output result
		expected="$2"
	}

	: 'execute' && {
		# Actual output result
		actual=$(
			printf "%s" "$target_command" |
			sh 2>&1 1> /dev/null
		)
	}
	: 'compare' && {
		[ "_$expected" = "_$actual" ] && print_OK || print_NG "$expected" "$actual" 
	}
	)
}

# Use: The output result (error output) must not be an exact match
# Arg1: Execution command string to be tested
# Arg2: Expected output result
assert_error_not_equal () {
	(
	: 'define' && {
		# Execution command string to be tested
		target_command="$1"
		# Expected output result
		expected="$2"
	}

	: 'execute' && {
		# Actual output result
		actual=$(
			printf "%s" "$target_command" |
			sh 2>&1 1> /dev/null
		)
	}
	: 'compare' && {
		[ "_$expected" != "_$actual" ] && print_OK || print_NG "$expected" "$actual" 
	}
	)
}

# Use: The output result (standard output) is a partial match
# Arg1: Execution command string to be tested
# Arg2: Expected output result
assert_match () {
	(
	: 'define' && {
		# Execution command string to be tested
		target_command="$1"
		# Expected output result
		expected="$2"
	}

	: 'execute' && {
		# Actual output result
		actual=$(
			printf "%s" "$target_command" |
			sh 2> /dev/null
		)
	}
	: 'compare' && {
		compare_result=$(
			printf "%s" "$actual" |
			grep -- "$expected" 
		)
		[ "_$compare_result" != "_" ] && print_OK || print_NG "$expected" "$actual" 
	}
	)
}

# Use: The output result (standard output) is not a partial match
# Arg1: Execution command string to be tested
# Arg2: Expected output result
assert_not_match () {
	(
	: 'define' && {
		# Execution command string to be tested
		target_command="$1"
		# Expected output result
		expected="$2"
	}

	: 'execute' && {
		# Actual output result
		actual=$(
			printf "%s" "$target_command" |
			sh 2> /dev/null
		)
	}
	: 'compare' && {
		compare_result=$(
			printf "%s" "$actual" |
			grep -- "$expected" 
		)
		[ "_$compare_result" = "_" ] && print_OK || print_NG "$expected" "$actual" 
	}
	)
}

# Use: The output result (error output) is a partial match
# Arg1: Execution command string to be tested
# Arg2: Expected output result
assert_error_match () {
	(
	: 'define' && {
		# Execution command string to be tested
		target_command="$1"
		# Expected output result
		expected="$2"
	}

	: 'execute' && {
		# Actual output result
		actual=$(
			printf "%s" "$target_command" |
			sh 2>&1 1> /dev/null
		)
	}
	: 'compare' && {
		compare_result=$(
			printf "%s" "$actual" |
			grep -- "$expected" 
		)
		[ "_$compare_result" != "_" ] && print_OK || print_NG "$expected" "$actual" 
	}
	)
}

# Use: The output result (error output) is not a partial match
# Arg1: Execution command string to be tested
# Arg2: Expected output result
assert_error_not_match () {
	(
	: 'define' && {
		# Execution command string to be tested
		target_command="$1"
		# Expected output result
		expected="$2"
	}

	: 'execute' && {
		# Actual output result
		actual=$(
			printf "%s" "$target_command" |
			sh 2>&1 1> /dev/null
		)
	}
	: 'compare' && {
		compare_result=$(
			printf "%s" "$actual" |
			grep -- "$expected" 
		)
		[ "_$compare_result" = "_" ] && print_OK || print_NG "$expected" "$actual" 
	}
	)
}

# Use: The output result (standard + error output) exactly matches the contents of the file
# Arg1: Execution command string to be tested
# Arg2: File path of expected output result
assert_both_equal_file () {
	(
	: 'define' && {
		# Execution command string to be tested
		target_command="$1"
		# Expected output result
		[ -r "$2" ] || error_and_exit "File: \"$2\" is not readable."
		expected=$(cat "$2")
	}

	: 'execute' && {
		# Actual output result
		actual=$(
			printf "%s" "$target_command" |
			sh 2>&1
		)
	}
	: 'compare' && {
		[ "_$expected" = "_$actual" ] && print_OK || print_NG "$expected" "$actual" 
	}
	)
}

# Use: The output result (standard + error output) does not exactly match the contents of the file
# Arg1: Execution command string to be tested
# Arg2: File path of expected output result
assert_both_not_equal_file () {
	(
	: 'define' && {
		# Execution command string to be tested
		target_command="$1"
		# Expected output result
		[ -r "$2" ] || error_and_exit "File: \"$2\" is not readable."
		expected=$(cat "$2")
	}

	: 'execute' && {
		# Actual output result
		actual=$(
			printf "%s" "$target_command" |
			sh 2>&1
		)
	}
	: 'compare' && {
		[ "_$expected" != "_$actual" ] && print_OK || print_NG "$expected" "$actual" 
	}
	)
}

# Use: The output result (standard output) exactly matches the contents of the file
# Arg1: Execution command string to be tested
# Arg2: File path of expected output result
assert_equal_file () {
	(
	: 'define' && {
		# Execution command string to be tested
		target_command="$1"
		# Expected output result
		[ -r "$2" ] || error_and_exit "File: \"$2\" is not readable."
		expected=$(cat "$2")
	}

	: 'execute' && {
		# Actual output result
		actual=$(
			printf "%s" "$target_command" |
			sh 2> /dev/null
		)
	}
	: 'compare' && {
		[ "_$expected" = "_$actual" ] && print_OK || print_NG "$expected" "$actual" 
	}
	)
}

# Use: The output result (standard output) does not exactly match the contents of the file
# Arg1: Execution command string to be tested
# Arg2: File path of expected output result
assert_not_equal_file () {
	(
	: 'define' && {
		# Execution command string to be tested
		target_command="$1"
		# Expected output result
		[ -r "$2" ] || error_and_exit "File: \"$2\" is not readable."
		expected=$(cat "$2")
	}

	: 'execute' && {
		# Actual output result
		actual=$(
			printf "%s" "$target_command" |
			sh 2> /dev/null
		)
	}
	: 'compare' && {
		[ "_$expected" != "_$actual" ] && print_OK || print_NG "$expected" "$actual" 
	}
	)
}

# Use: The output result (error output) exactly matches the contents of the file
# Arg1: Execution command string to be tested
# Arg2: File path of expected output result
assert_error_equal_file () {
	(
	: 'define' && {
		# Execution command string to be tested
		target_command="$1"
		# Expected output result
		[ -r "$2" ] || error_and_exit "File: \"$2\" is not readable."
		expected=$(cat "$2")
	}

	: 'execute' && {
		# Actual output result
		actual=$(
			printf "%s" "$target_command" |
			sh 2>&1 1> /dev/null
		)
	}
	: 'compare' && {
		[ "_$expected" = "_$actual" ] && print_OK || print_NG "$expected" "$actual" 
	}
	)
}

# Use: The output result (error output) does not exactly match the contents of the file
# Arg1: Execution command string to be tested
# Arg2: File path of expected output result
assert_error_not_equal_file () {
	(
	: 'define' && {
		# Execution command string to be tested
		target_command="$1"
		# Expected output result
		[ -r "$2" ] || error_and_exit "File: \"$2\" is not readable."
		expected=$(cat "$2")
	}

	: 'execute' && {
		# Actual output result
		actual=$(
			printf "%s" "$target_command" |
			sh 2>&1 1> /dev/null
		)
	}
	: 'compare' && {
		[ "_$expected" != "_$actual" ] && print_OK || print_NG "$expected" "$actual" 
	}
	)
}

print_OK () {
	(
	echo "[OK] $test_case (${current_test_code_file}:${current_line})"
	)
}

print_NG () {
	(
	# Change the output according to the number of arguments
	if [ $# = 2 ]; then
		expected="$1"
		actual="$2"
		cat <<-EOF
			[NG] $test_case (${current_test_code_file}:${current_line})
			 [EXPECTED]
			${expected}
			 [ACTUAL]
			${actual}
		EOF
	else
		echo "[NG] $test_case (${current_test_code_file}:${current_line})"
	fi |
	tee -a "$NG_logs"
	)
}

error_and_exit () {
	print_NG
	# print error message and exit
	printf "[ERROR] %s\n" "$@" |
	tee -a "$NG_logs"
	exit 1
}

