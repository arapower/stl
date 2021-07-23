setup (){
	:
	sample_file='/tmp/stl_sample_file'
	echo "abcd" > "$sample_file"
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
	assert_both_equal_file "echo abcd" "$sample_file"
	assert_both_not_equal_file "echo abc" "$sample_file"
	assert_equal_file "echo abcd" "$sample_file"
	assert_not_equal_file "echo abc" "$sample_file"
	assert_error_equal_file "echo abcd >&2" "$sample_file"
	assert_error_not_equal_file "echo abc >&2" "$sample_file"
	)
}
