. ~/.bash_functions

## GENERAL NOTES FOR ALIASING THINGS
# Adding another computer as a remote repo:
# dotgit remote add am1_idvrn ssh://rcta@husky9-am1-idvrn/home/rcta/.dotfiles
# ' >/dev/null' suppresses output and ' >&/dev/null' suppresses output and errors

## Managing dotfiles
alias "dgit=/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias "sdgit=sudo /usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

## Linux shortcuts
alias "e=emacs -nw"
alias "se=sudo emacs -nw"
alias "cdl= cd - >&/dev/null"
alias "gitcache_credentials=git config credential.helper 'cache --timeout=300'"
alias "ssh-key-add=eval $(ssh-agent -s) && ssh-add $1"
alias 'lsh=ls \.* -d #list hidden files only'
alias json='python -m json.tool $1'

#export PATH="$HOME/.pyenv/bin:$PATH"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
