DOT_FILES=(.bash_history .bash_profile .config .gitconfig .vim .bash_logout .bashrc .rustup .tmux.conf .vimrc)

for file in ${DOT_FILES[@]};
do
	rm -rf $HOME/$file
	ln -s $HOME/dotfiles/$file $HOME/$file
done

if [ ! -d $HOME/.cache ]; then
	mkdir $HOME/.cache
else
	rm -rf $HOME/.cache/dein
fi
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein_installer.sh
# For example, we just use `~/.cache/dein` as installation directory
sh ./dein_installer.sh ~/.cache/dein
