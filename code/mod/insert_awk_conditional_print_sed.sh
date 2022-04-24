setup (){
	generate_awk_insert="$STL_MODULE_DIR/generate_awk_insert.sed"
}

teardown (){
	:
}

# For TDD
stl_insert_awk_conditional_print_sed_tdd() {
	(
	base_func="$STL_TEST_DATA_DIR/mod/base_func.txt"
	result="$STL_TEST_DATA_DIR/mod/insert_awk_conditional_print_sed_result.txt"

	assert_both_equal_file "cat \"$base_func\" | sed -n -f \"${generate_awk_insert}\"" "$result"
	)
}

# Multiple difinitions
stl_multiple_difinitions() {
	(
	base_func="$STL_TEST_DATA_DIR/mod/multiple_difinitions.txt"
	result="$STL_TEST_DATA_DIR/mod/multiple_difinitions_result.txt"

	assert_both_equal_file "cat \"$base_func\" | sed -n -f \"${generate_awk_insert}\"" "$result"
	)
}

