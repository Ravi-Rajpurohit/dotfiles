git init --bare $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

echo ".dotfiles" >> .gitignore

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

git clone --bare <git-repo-url> $HOME/.dotfiles

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

mkdir -p .dotfiles-backup && \
dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .dotfiles-backup/{}

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

dotfiles checkout

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

dotfiles config --local status.showUntrackedFiles no

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

git clone --bare git@github.com:Ravi-Rajpurohit/dotfiles.git $HOME/.dotfiles
function dotfiles {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}
mkdir -p .dotfiles-backup
dotfiles checkout
if [ $? = 0 ]; then
  echo "Checked out dotfiles.";
  else
    echo "Backing up pre-existing dot files.";
    dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{}
fi;
dotfiles checkout
dotfiles config status.showUntrackedFiles no

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 