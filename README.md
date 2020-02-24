This repo allows for easy transfer of configuration files in the home directory (.bashrc, .bash_aliases, .emacs, .vimrc, etc). Simply 

## Steps:

1. Setup repo  
	git clone --bare https://github.com/WyattJordan/dotfiles.git $HOME/.dotfiles
  
2. Set alias for this repo, setup profile, don't track everything in $home  
	alias "dotgit=/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"  
	dotgit config --global user.name "Wyatt Jordan"  
	dotgit config --global user.email "wyattsjordan@gmail.com"  
   	dotgit config --local status.showUntrackedFiles no  
  
3. The new .files will not import, instead git will show that changes have been made and the new files we want are deleted. To fix this, add the changes to the index, checkout a new branch which will keep the original files, commit, checkout the master.  
	dotgit status  
	dotgit add *  
	dotgit checkout -b "original files" # create new branch  
	dotgit commit -m "saving original files"  
	dotgit checkout master
	dotgit reset --hard HEAD # this may be needed
  
4. Load terminal colors
       Option1:
             Use a pre-defined profile. Type termcolors TAB TAB to see the options stored in .bash_aliases
       Option2:
             Use solarized. Run dotgit submodule init && dotgit submodule update. Then run ./.custom/gnome-terminal-colors-solarized/.install and use dark_alternative  
  
5. Load tmux plugins  
       dotgit submodule init  
       dotgit submodule update  
       # then run prefix + I in tmux to install (may need to chmod 777 ~./tmux/*  
  
The final condition of this repo is that it now has the original machines files saved on a seperate branch and the files from this repo currently checked out.  

The emacs plugins are stored in this repo (no extra steps to use, just clone this repo and you're good). The tmux plugins must be installed on their own. The tmux plugin manager (TPM) is a submodule that must also be pulled and then run the installation of the plugins in tmux.  

Original tutorial here: https://medium.com/toutsbrasil/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b


