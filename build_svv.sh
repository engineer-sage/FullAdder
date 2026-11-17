#!/bin/bash

if [[ $# -lt 1 ]]; then
	echo "No file to build"
	echo "1.For single file -> Usage : ./build_svv <filename>"
	echo "2.For multiple files -> Usage : ./build_svv <top_name> <filenames>"
	exit 1
fi

if [[ $# -gt 1 ]]; then
	top="$1"
	file=("${@:2}")
	M_FILES=0
else
	file=("$@")
	M_FILES=1
fi

execute_multiple_files(){
	verilator --prefix bin \
			  --binary \
			  --build-jobs 0 \
			 '--build' '--trace-vcd' '--quiet' '--quiet-build' '-Wno-fatal' \
		 	 '--timescale' '1ns/1ns' \
			 '-hierarchical' \
			 --top ${top} \
		 	 ${file[@]} && obj_dir/bin
}

execute_single_file(){
	verilator --prefix bin \
			  --binary \
			  --build-jobs 2 \
			 '--build' '--trace-vcd' '--quiet' '--quiet-build' '-Wno-fatal' \
		 	 '--timescale' '1ns/1ns' \
			 ${file[@]} && obj_dir/bin
}

check_files(){
	for file in "${file[@]}"; do
		if [[ ! -f $file ]]; then
			echo "Error: File Not Found"
			return 1
		fi
	done
	return 0
}


if check_files ; then
	if [[ $M_FILES -eq 0 ]]; then
		execute_multiple_files
	else
		execute_single_file
	fi
else
	exit 1
fi
