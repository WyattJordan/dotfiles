# WRITING LINUX BASH
# 	  SPACES MATTER WAYYYY TOO MUCH, everything must be separated by at least one space
# 	  $# - number of args
#	  $1 - first arg (arg 0 is the command itself)
#         $@ - all args (used to pass args to other functions)
#	  
#	  Logical statements:
#	  	  Use the -gt -lt for > or <, note the spacing in the lsd example

# list directories, either in present dir or specified by argument
function lsd(){
	if [ $# -gt 0 ]
	then
	   cd $1 && ls */ -d && cd - >/dev/null
	else
	   ls */ -d
	fi	
}

# go up $1 directories
function up(){
	 if [ $# -eq 0 ]
	 then
	   cd ..
	 else	   
	   levels=$1
	   dir=""
  	   # more spaces aren't bad, but need at least 1
	   while [      $levels -gt 0 ]; do
	    dir="$dir../"
	    levels=$(($levels - 1))
	   done
	   cd ${dir}
	 fi
}

function cpdownload(){
	 cp ~/Downloads/$(ls -rt ~/Downloads/ | tail -1)
}