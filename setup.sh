pacman -Syu
pacman -S --needed git tmux vim neovim fish python3 python-pip clang

pip3 install --user --upgrade pynvim neovim pyls

DOT_FILES=(.bash_history .bash_profile .gitconfig .vim .bash_logout .bashrc .rustup .tmux.conf .vimrc .config/nvim .config/fish .config/coc)

if [ ! -d $HOME/.config ]; then
	mkdir $HOME/.config
fi

for file in ${DOT_FILES[@]};
do
	rm -rf $HOME/$file
	ln -s $HOME/dotfiles/$file $(dirname $HOME/$file)/$(basename $file)
done

if [ ! -d $HOME/.cache/dein ]; then
	mkdir -p $HOME/.cache/dein
else
	rm -rf $HOME/.cache/dein
	mkdir -p $HOME/.cache/dein
fi
ln -s $HOME/dotfiles/.cache/dein/repos $HOME/.cache/dein

git submodule update --init --recursive

vim +:PluginInstall +:q +:q
nvim +:PluginInstall +:UpdateRemotePlugins +":call dein#install()" +:q +:q
