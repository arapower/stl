setup (){
	:
}

teardown (){
	:
}

stl_output_log () {
	(
		log_date # logfile -> "$STL_ROOT_DIR/stl.log"
		# log_date "$STL_ROOT_DIR/stl.log" # specify path of log file
	)
}
