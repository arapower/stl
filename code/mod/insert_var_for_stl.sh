setup (){
	target="$STL_MODULE_DIR/insert_var_for_stl.sh"
}

teardown (){
	:
}

stl_insert_var_for_stl_tdd () {
	(
	test_code_input="$STL_TEST_DATA_DIR/mod/insert_var_for_stl_test_code_input.txt"
	: 'Create expected output' && {
		test_code_output=$(mktemp)
		cat "$STL_TEST_DATA_DIR/mod/insert_var_for_stl_test_code_output.txt" |
		sed "s;<current_dir>;${STL_ROOT_DIR};g" > "${test_code_output}"
	}

	assert_equal_file "\"${target}\" \"$test_code_input\"" "$test_code_output"
	)
}

stl_define_here_document_in_test_code() {
	(
	input="$STL_TEST_DATA_DIR/multiple_input.txt"
	output=$(mktemp)
	cat <<-EOF > "$output"
		abc
		def
	EOF

	assert_both_equal_file "cat \"$input\"" "$output"
	)
}

