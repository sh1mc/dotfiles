pacman -Syu
pacman -S --needed git tmux vim neovim fish python3 python-pip clang
git submodule update --init --recursive

pip3 install --user --upgrade pynvim neovim pyls

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
ln -s $HOME/dotfiles/.cache/dein $HOME/.cache/dein

vim +:PluginInstall +:q +:q
nvim +:PluginInstall +":call dein#install()" +:q +:q
