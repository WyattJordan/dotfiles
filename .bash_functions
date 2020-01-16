# WRITING LINUX BASH
# 	  SPACES MATTER WAYYYY TOO MUCH, everything must be separated by at least one space
# 	  $# - number of args
#	  $1 - first arg (arg 0 is the command itself)
#         $@ - all args (used to pass args to other functions)
#	  
#	  Logical statements:
#	  	  Use the -gt -lt for > or <, note the spacing in the lsd example

function mntdgx(){
	 sshfs asd@172.16.18.10$1:/ ~/dev/dgx/$1/
}

function dgx(){
	 echo "ssh-ing into dgx$1"
	 if [ -z "$2" ]; then
	    ssh -X asd@172.16.18.10$1
	 else
	    ssh -X $2@172.16.18.10$1
	 fi
}

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

	 levels=$1
	 # more spaces aren't bad, but need at least 1
	 while [      $levels -gt 0 ]; do
	  cd ..
	  levels=$(($levels - 1))
	 done
}
