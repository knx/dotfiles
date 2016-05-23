cd

# clone
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it

# install
~/.bash_it/install.sh --interactive

# links
mv .bashrc .bashrc.bak
mv .bash_profile .bash_profile.bak
ln -s ~/.dotfiles/.bash_profile
ln -s ~/.dotfiles/.bashrc
ln -s ~/.dotfiles/.vimrc

# vim and theme and aliases
mkdir .vim
ln -s ~/.dotfiles/colors ~/.vim/
ln -s ~/.dotfiles/mine ~/.bash_it/themes/
ln -s ~/.dotfiles/custom.bash ~/.bash_it/custom/

curl -fLo ~/.vim/autoload/plug.vim --create-dirs     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


