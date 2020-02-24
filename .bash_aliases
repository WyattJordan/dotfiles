. ~/.bash_functions

## GENERAL NOTES FOR ALIASING THINGS
# Adding another computer as a remote repo:
# dotgit remote add am1_idvrn ssh://rcta@husky9-am1-idvrn/home/rcta/.dotfiles
# ' >/dev/null' suppresses output and ' >&/dev/null' suppresses output and errors

## Managing dotfiles
alias "dotgit=/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias "sdotgit=sudo /usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

## Linux shortcuts
alias "e=sudo emacs -nw"
alias "cdl= cd - >&/dev/null"
alias "gitcache_credentials=git config credential.helper 'cache --timeout=300'"
alias "termcolors_green_on_purple=dconf load /org/gnome/terminal/legacy/profiles:/ < .term_colors_green_on_purple"
alias "ssh-key-add=eval $(ssh-agent -s) && ssh-add $1"
alias 'lsh=ls \.* -d #list hidden files only'

## ROS
alias "husky9_am1=ssh -X asd@husky9-am1"
alias "husky9_am2=ssh -X asd@husky9-am2"
alias "husky9_am1_idvrn=ssh -X asd@husky9-am1-idvrn"
alias "husky9_am2_idvrn=ssh -X asd@husky9-am2-idvrn"
export ROSCONSOLE_FORMAT='[${severity}] [${node}]: ${message}'
alias "me_ROS=export ROS_MASTER_URI=http://localhost:11311 && export ROS_HOSTNAME=localhost"
alias "husky9_env=export ROS_MASTER_URI=http://172.16.109.12:11311 && export ROS_HOSTNAME=gru && . /home/asd/dev/phoenix-r1/install/rcta_setup.bash husky9"
alias "husky9_env_idvrn=export ROS_MASTER_URI=http://172.16.18.60:11311 && export ROS_HOSTNAME=gru && . /home/asd/dev/phoenix-r1/install/rcta_setup.bash husky9"

# Labeling images 
alias "label_images_robot=python ~/rcta_ml_scripts/labeling_scripts/label_images.py --image_path ~/data/rcta/robot/$1/rgb --label robot_manual"
alias "label_keypts_robot=python ~/rcta_ml_scripts/labeling_scripts/label_keypoints.py ~/data/rcta/robot/$1/rgb robot_manual 11"



alias json='python -m json.tool $1'
