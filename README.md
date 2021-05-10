This repo allows for easy transfer of configuration files in the home directory (.bashrc, .bash_aliases, .emacs, .vimrc, etc). Simply 

## Steps:

1. Basic setup (overwrites corresponding .files in home)
```bash
cd ~  
git clone --bare https://github.com/WyattJordan/dotfiles.git $HOME/.dotfiles  
alias "dgit=/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

# sets repo properties (username, email, cache etc and installs pkgs)  
dgit checkout HEAD -- .setup  
./.setup

# If the old files should be preserved see the Save Old Files section (don't reset everything)
dgit reset --hard HEAD  
. .bashrc
```
  
2. Load tmux plugins
    ```bash
       dgit submodule init  
       dgit submodule update  
       # then run prefix + I in tmux to install (may need to chmod 777 ~./tmux/*
    ```
The emacs plugins are stored in this repo (no extra steps to use, just clone this repo and you're good). The tmux plugins must be installed on their own. The tmux plugin manager (TPM) is a submodule that must also be pulled and then run the installation of the plugins in tmux.  


### Save Old Files
The new .files will not import , instead git will show that changes have been made and the new files we want are deleted. To fix this, add the changes to the index, checkout a new branch which will keep the original files, commit, checkout the master.  
    ```bash
    
	dgit status  
	dgit add *  
	dgit checkout -b "original files" # create new branch  
	dgit commit -m "saving original files"  
	dgit checkout master
	dgit reset --hard HEAD  
	. .bashrc

Original tutorial here: https://medium.com/toutsbrasil/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b


