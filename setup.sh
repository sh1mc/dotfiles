DOT_FILES=(.bash_history .bash_profile .config .gitconfig .vim .bash_logout .bashrc .git .rustup .tmux.conf .vimrc)

for file in ${DOT_FILES[@]};
do
	rm -rf $HOME/$file
	ln -s $HOME/dotfiles/$file $HOME/$file
done
