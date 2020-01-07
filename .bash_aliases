## ROS connections to robots and setting up environments
alias "husky9_am1=ssh -X rcta@husky9-am1"
alias "husky9_am3=ssh -X rcta@husky9-am3"
alias "husky9_am1_idvrn=ssh -X rcta@husky9-am1-idvrn"
alias "husky9_am3_idvrn=ssh -X rcta@husky9-am3-idvrn"

## ROS
export ROSCONSOLE_FORMAT='[${severity}] [${node}]: ${message}'
alias "me_ROS=export ROS_MASTER_URI=http://localhost:11311 && export ROS_HOSTNAME=localhost"
alias "husky9_env=export ROS_MASTER_URI=http://172.16.109.11:11311 && export ROS_HOSTNAME=gru && . /home/asd/phoenix-r1/install/rcta_setup.bash husky9"

## Managing dotfiles
alias "dotgit=/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias "sdotgit=sudo /usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

## Linux shortcuts
alias "e=sudo emacs -nw"
# list directories, either in present dir or specified by argument
lsd(){
	if [ $# -gt 0 ]
	then
	   cd $1 && ls */ -d && cd - >/dev/null
	else
	   ls */ -d
	fi	
}
alias "gitcache_credentials=git config credential.helper 'cache --timeout=300'"
alias "ssh-key-add=eval $(ssh-agent -s) && ssh-add $1"

alias "label_images_robot=python ~/rcta_ml_scripts/labeling_scripts/label_images.py --image_path ~/data/rcta/robot/$1/rgb --label robot_manual"
alias "label_keypts_robot=python ~/rcta_ml_scripts/labeling_scripts/label_keypoints.py ~/data/rcta/robot/$1/rgb robot_manual 11"

## General notes
# Adding another computer as a remote repo:
# dotgit remote add am1_idvrn ssh://rcta@husky9-am1-idvrn/home/rcta/.dotfiles
#
# WRITING LINUX BASH
# 	  $# - number of args
#	  $1 - first arg (arg 0 is the command itself)
#         $@ - all args (used to pass args to other functions)
#	  
#	  Logical statements:
#	  	  Use the -gt -lt for > or <, note the spacing in the lsd example
#

