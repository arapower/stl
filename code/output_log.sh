setup (){
	:
}

teardown (){
	:
}

stl_output_log () {
	(
		output_log # logfile -> "$STL_ROOT_DIR/stl.log"
		output_log "$STL_ROOT_DIR/stl.log" # specify path of log file
	)
}
