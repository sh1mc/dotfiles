pacman -Syu
pacman -S --needed git tmux vim neovim fish python3 python-pip clang
git submodule update --init --recursive

pip3 install --user --upgrade pynvim neovim pyls

DOT_FILES=(.bash_history .bash_profile .gitconfig .vim .bash_logout .bashrc .rustup .tmux.conf .vimrc .config/nvim .config/fish .config/coc)

if [ ! -d $HOME/.config ]; then
	mkdir $HOME/.config
fi

for file in ${DOT_FILES[@]};
do
	rm -rf $HOME/$file
	ln -s $HOME/dotfiles/$file $HOME/$file
done

if [ ! -d $HOME/.cache/dein ]; then
	mkdir -p $HOME/.cache/dein/repos
else
	rm -rf $HOME/.cache/dein
	mkdir -p $HOME/.cache/dein/repos
fi
ln -s $HOME/dotfiles/.cache/dein/repos $HOME/.cache/dein/repos

vim +:PluginInstall +:q +:q
nvim +:PluginInstall +:UpdateRemotePlugins +:q +:q
