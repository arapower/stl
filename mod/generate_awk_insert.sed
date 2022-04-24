# Insert variable definition: current_line before each test function for stl
s:^[ 	]*\(function\)*[ 	]*\([^( $-][^( $-]*\)[ 	]*([^)]*).*:/#__Conditional_output_current_line__/a	if($0 ~ /^[({]*[ 	]*\2[ 	]/){print "current_line=" NR;}:p
