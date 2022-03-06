#!/bin/sh

set -u

# TODO: Write description

: 'set arguments' && {
	return_full_path='return_full_path.sh'
	target_dir=$("$return_full_path" "${1%/}")
	original_obj=$("$return_full_path" "$2")
}

: 'Create directory for copy' && {
	mkdir -p "${target_dir}${original_obj%/*}"
}

: 'copy original_obj' && {
	printf "%s\n" "$original_obj" |
	sed "s;.*;cp '&' '${target_dir}&';" |
	sh
}

: 'print result' && {
	echo "${target_dir}${original_obj}"
}
