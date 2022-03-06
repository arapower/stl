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

# TODO: Write test description
stl_copy_one_object () {
	(
	copy_one_object='copy_one_object.sh'

	target_dir=$(mktemp -d)
	original_obj="$target_dir/target_obj"
	: > "$original_obj"
	result=$("$copy_one_object" "$target_dir" "$original_obj")
	assert_equal "find \"$result\"" "$target_dir$original_obj"
	)
}

# TODO: wirte test description
stl_return_full_path_file () {
	(
	return_full_path='return_full_path.sh'
	tmp_dir=$(mktemp -d)
	sub_dir="$tmp_dir/sub_dir/../sub_dir"
	mkdir -p "$sub_dir"
	relative_path="$sub_dir/sample_file"
	absolute_path="$tmp_dir/sub_dir/sample_file"
	expected_result="$absolute_path"
	assert_both_equal "\"$return_full_path\" \"$relative_path\"" "$expected_result"
	)
}

stl_return_full_path_directory () {
	(
	return_full_path='return_full_path.sh'
	tmp_dir=$(mktemp -d)
	relative_path="$tmp_dir/sub_dir/../sub_dir/sample_dir"
	mkdir -p "$relative_path"
	absolute_path="$tmp_dir/sub_dir/sample_dir"
	expected_result="$absolute_path"
	assert_both_equal "\"$return_full_path\" \"$relative_path\"" "$expected_result"
	)
}

# TODO: Write test description
stl_create_packed_directory () {
	(
	create_packed_directory='create_packed_directory.sh'

	original_obj=$(mktemp)
	tmp_dir=$(mktemp -d)
	expected_result="$tmp_dir$original_obj"
	assert_both_equal "\"$create_packed_directory\" \"$tmp_dir\" \"$original_obj\"" "$expected_result"
	)
}
