#!/bin/sh

: 'Get argument' && {
	file="${1%/}"
}

: 'Get full path' && {
	full_dir_path=$(d=${file%/*}/; [ "_${d}" = "_$file/" ] && d='./'; cd "${d}"; pwd)
	full_path="$full_dir_path/${file##*/}"
}

echo "$full_path"
