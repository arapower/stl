#! /usr/bin/awk -f

{
	# variable for line number
	print "current_line=" NR;
	print $0;
	if($0 ~/^[ 	]*stl_[^(][^(]* *\(.*/) {
		# variable for test code file name
		print "current_test_code_file=" test_code;
		# variable for test case name
		test_case = $0;
		sub(/^[ 	]*stl_/, "stl_", test_case);
		sub(/ *\(.*$/, "", test_case);
		print "test_case=" test_case;
	}
}
