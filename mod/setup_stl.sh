#!/bin/sh

set -ue

# Clone and update stl itself

: 'Set target directory' && {
	[ $# -gt 0 ] && {
		target_directory="${1%/}"
		[ ! -d "${target_directory}" ] && echo '[ERROR] Argument 1 must be a directory path. And it is optional.' >&2 && exit 1
		cd "$target_directory"
		[ $? -ne 0 ] && echo "[ERROR] Cannot access ${target_directory} directory." >&2 && exit 1
	}
	[ $# -eq 0 ] && {
		target_directory="$(pwd)"
	}
}

: 'Get current directory path' && {
	current_directory="$(pwd)"
}

: 'Change directory for clone stl repository' && {
	setup_directory='/tmp/stl_setup'
	[ -d "${setup_directory}" ] && rm -rf "${setup_directory}" 
	[ -d "${setup_directory}" ] && echo "[ERROR] Cannot remove ${setup_directory} directory due to permissions." >&2 && exit 1
	mkdir "${setup_directory}"
	[ $? -ne 0 ] && echo "[ERROR] Cannot make ${setup_directory} directory." >&2 && exit 1
	cd "${setup_directory}"
	[ $? -ne 0 ] && echo "[ERROR] Cannot access ${setup_directory} directory." >&2 && exit 1
}

: 'Clone target repository from GitHub' && {
	repository_from='https://github.com/arapower/stl.git'
	repository_name=$(echo "${repository_from}" | sed 's;.*/\([^/]*\)\.git;\1;')
	cloned_directory="${setup_directory}/${repository_name}"

	git clone "${repository_from}"
	[ ! -d "${cloned_directory}" ] && echo "[ERROR] Cannot clone stl repository to ${cloned_directory} directory by git command." >&2 && exit 1

	: 'Remove unnecessary files' && {
		rm -rf "${cloned_directory}/.git"
		code_dir="${cloned_directory}/code"
		data_dir="${cloned_directory}/data"
		rm -rf "$code_dir"/* "$data_dir"/*
	}

	cp -r "${cloned_directory}" "${target_directory}/"
}
