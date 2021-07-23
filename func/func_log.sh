# function definitions used in stl

# Use: Output date time to log file
# Arg1: (optional) Path of log file
# If Arg1 is not exist, log file path is STL_ROOT_DIR.
output_log () {
	(
	: 'define' && {
		# log file path
		if [ -z "$1" ]; then
			log_file="$STL_ROOT_DIR/stl.log"
		else
			log_file="$1"
		fi
		# format date time string
		datetime=$(
			utconv -r $(date +%s) |
			sed 's;\(..*\)\([0-9]\{2\}\)\([0-9]\{2\}\)\([0-9]\{2\}\)\([0-9]\{2\}\)\([0-9]\{2\}\);\1/\2/\3/ \4:\5:\6;'
		)
	}
	: 'execute' && {
		printf "[LOG] ${datetime}\t${PRJ_ROOT_DIR}\n" >> "$log_file"
	}
	)
}
