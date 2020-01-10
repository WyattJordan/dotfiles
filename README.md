This repo allows for easy transfer of configuration files in the home directory (.bashrc, .bash_aliases, .emacs, .vimrc, etc). Simply 

## Steps:

1. Setup repo  
	git clone --bare https://gitlab.sitcore.net/arl/vtd/asd-ugv/dotfiles.git $HOME/.dotfiles
  
2. Set alias for this repo  
	alias "dotgit=/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
  
3. Only track desired files  
   	dotgit config --local status.showUntrackedFiles no
  
4. The new .files will not import, instead git will show that changes have been made and the new files we want are deleted. To fix this, add the changes to the index, checkout a new branch which will keep the original files, commit, checkout the master.  
	dotgit status  
	dotgit add *  
	dotgit checkout -b "original files" # create new branch  
	dotgit commit -m "saving original files"  
	dotgit checkout master  
  
5. Load terminal colors  
       termcolors

6. Load tmux plugins
       dotgit submodule init
       dotgit submodule update
       # then run prefix + I in tmux to install (may need to chmod 777 ~./tmux/*

The final condition of this repo is that it now has the original machines files saved on a seperate branch and the files from this repo currently checked out.  


Original tutorial here: https://medium.com/toutsbrasil/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b



