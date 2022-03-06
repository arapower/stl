#!/bin/sh

# TODO: Add test case: Number of arguments is lesser than 2 -> Error
# TODO: Write description

: 'set arguments' && {
	copy_one_object='copy_one_object.sh'
	target_dir="${1%/}"
}

: 'copy' && {
	shift
	while [ $# -gt 0 ]
	do
		printf "%s\n" "$1"
		shift
	done |
	xargs -L1 "$copy_one_object" "$target_dir" |
	awk 'NR==1'
}
