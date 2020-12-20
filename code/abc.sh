setup (){
	:
}

teardown (){
	:
}

stl_abcde () {
	(
	assert_both_equal "echo abc" "abc"
	assert_both_not_equal "echo abc" "abcd"
	assert_equal "echo abc" "abc"
	assert_not_equal "echo abc" "abcd"
	assert_error_equal "echo abc >&2" "abc"
	assert_error_not_equal "echo abc >&2" "abcd"
	assert_match "echo abcde" "abc.*e"
	assert_not_match "echo abcde" "abc.*E"
	assert_error_match "echo abcde >&2" "ab.*e"
	assert_error_not_match "echo abc >&2" "ac"
	assert_both_equal_file "echo abcd" "/tmp/abcd"
	assert_both_not_equal_file "echo abc" "/tmp/abcd"
	assert_equal_file "echo abcd" "/tmp/abcd"
	assert_not_equal_file "echo abc" "/tmp/abcd"
	assert_error_equal_file "echo abcd >&2" "/tmp/abcd"
	assert_error_not_equal_file "echo abc >&2" "/tmp/abcd"
	)
}
