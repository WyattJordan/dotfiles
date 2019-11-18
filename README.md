This repo allows for easy transfer of configuration files in the home directory (.bashrc, .bash_aliases, .emacs, .vimrc, etc). Simply 

##Steps:

1. Setup repo  
	git clone --bare https://gitlab.sitcore.net/arl/vtd/asd-ugv/dotfiles.git $HOME/.dotfiles
  
2. Set alias for this repo  
	alias "dotgit=/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
  
3. Only track desired files  
   	dotgit config --local status.showUntrackedFiles no
  
4. Find files that will be deleted and reset them
	dotgit checkout
	dotgit reset HEAD <each file listed by checkout>

5. Now those files will be listed as "modified" and can be saved on a new branch  
       dotgit add <each file to save, same ones as before>  
       dotgit checkout -b _computername_  
       dotgit commit -m "saving original files"  
  
8. Now load the files in this repo by deleting the commit just made for the original files
       dotgit checkout master
       dotgit reset --soft HEAD~1

The final condition of this repo is that it now has the original machines files saved on a seperate branch and the files from this repo currently checked out.  


Original tutorial here: https://medium.com/toutsbrasil/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b



