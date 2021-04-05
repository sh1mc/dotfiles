SHELL = /bin/bash
RM = rm -rf
PACKAGES := git tmux vim neovim fish python3 python-pip clang powerline
PIP_PACKAGES := pynvim neovim pyls jedi powerline-status
DOT_FILES := .bash_profile .gitconfig .vim .bash_logout .bashrc .tmux.conf .vimrc .config/nvim .config/fish .config/coc .config/powerline .latexmkrc
BACKUP := $(HOME)/.dotfiles_bak/$(shell date +%Y%m%d%H%M%S)
.PHONY: install clean submodules packages pip_packages dein init.vim force

install: packages pip_packages submodules dein init.vim tmux_powerline $(DOT_FILES)
	@for file in $(DOT_FILES); do\
		if [ -e $(HOME)/$$file ]; then\
			mkdir -p $$( dirname $(BACKUP)/$$file );\
			mv $(HOME)/$$file $(BACKUP)/$$file;\
			echo Installed $$file;\
		fi;\
		mkdir -p $$( dirname $(HOME)/$$file );\
		ln -s $(HOME)/dotfiles/$$file $(HOME)/$$file;\
	done
	vim +:PluginInstall +:q +:q
	nvim +:PluginInstall +":call dein#install()" +":call dein#update()" +:UpdateRemotePlugins +:q +:q

submodules: force
	git submodule update --init --recursive

packages: force
	yes | sudo pacman -Syu
	yes | sudo pacman -S --needed $(PACKAGES)

pip_packages: packages force
	pip3 install --user --upgrade $(PIP_PACKAGES)

dein: force
	@if [ -d $(HOME)/.cache/dein ]; then\
		mkdir -p $(BACKUP)/.cache ;\
		mv $(HOME)/.cache/dein $(BACKUP)/.cache ;\
	fi
	mkdir -p $(HOME)/.cahce/dein
	ln -s $(HOME)/dotfiles/.cache/dein $(HOME)/.cache/dein

init.vim: dein
	$(RM) $(HOME)/dotfiles/.config/nvim/init.vim
	ln -s $(HOME)/dotfiles/.vimrc $(HOME)/dotfiles/.config/nvim/init.vim

tmux_powerline: pip_packages
	$(RM) $(HOME)/.config/pip/powerline-status
	mkdir -p $(HOME)/.config/pip
	ln -s $$(pip show powerline-status | grep -e "Location" | awk '{print $$2}')/powerline $(HOME)/.config/pip/powerline-status

force:

