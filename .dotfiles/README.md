This repo allows for easy transfer of configuration files in the home directory (.bashrc, .bash_aliases, .emacs, .vimrc, etc). Simply 

##Steps:

1. Setup repo  
	git clone --bare https://gitlab.sitcore.net/arl/vtd/asd-ugv/dotfiles.git $HOME/.dotfiles
  
2. Set alias for this repo  
	alias "dotgit=/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
  
3. Only track desired files  
   	dotgit config --local status.showUntrackedFiles no
  
4. Find files that will be replaced  
	dotgit checkout
  
5. Make a new branch to backup this computer's original files, add and commit  
   	dotgit checkout -t _computername_  
	dotgit add _all files that would be overwritten_  
	dotgit commit -m "saving original files"
  
8. Now load the files in this repo  
   dotgit checkout master
  


Original tutorial here: https://medium.com/toutsbrasil/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b



