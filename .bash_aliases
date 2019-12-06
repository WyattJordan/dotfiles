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
alias "gitcache_credentials=git config credential.helper 'cache --timeout=300'"


