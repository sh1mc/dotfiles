SHELL = /bin/bash
RM = rm -rf
PACKAGES := git tmux vim neovim fish python3 python-pip clang powerline nodejs npm inetutils
PIP_PACKAGES := pynvim neovim pyls jedi powerline-status nginx-language-server
DOT_FILES := .bash_profile .gitconfig .bash_logout .bashrc .tmux.conf .vimrc .config/yay .config/nvim .config/fish .config/powerline .latexmkrc
BACKUP := $(HOME)/.dotfiles_bak/$(shell date +%Y%m%d%H%M%S)
.PHONY: install clean submodules packages pip_packages dein init.vim force dein_update dein_install coc_install
.IGNORE: packages dein_install coc_install

install: clean app #dein_install coc_install

clean:
	@for file in $(DOT_FILES); do\
		if [ -e $(HOME)/$$file ]; then\
			mkdir -p $$( dirname $(BACKUP)/$$file );\
			mv $(HOME)/$$file $(BACKUP)/$$file;\
			echo Installed $$file;\
		fi;\
	done

app: packages pip_packages submodules dein init.vim tmux_powerline clean
	@for file in $(DOT_FILES); do\
		mkdir -p $$( dirname $(HOME)/$$file );\
		ln -s $(HOME)/dotfiles/$$file $(HOME)/$$file;\
	done

submodules: force
	git submodule update --init --recursive

packages: force
	yes | sudo pacman -S --needed $(PACKAGES)

pip_packages: packages force
	pip3 install --user --upgrade $(PIP_PACKAGES)

dein: force submodules clean
	rm -rf ~/.cache/dein
	curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
	sh ./installer.sh ~/.cache/dein
	rm ./installer.sh

init.vim: dein
	$(RM) $(HOME)/dotfiles/.config/nvim/init.vim
	ln -s $(HOME)/dotfiles/.vimrc $(HOME)/dotfiles/.config/nvim/init.vim

tmux_powerline: pip_packages
	$(RM) $(HOME)/.config/pip/powerline-status
	mkdir -p $(HOME)/.config/pip
	ln -s $$(pip show powerline-status | grep -e "Location" | awk '{print $$2}')/powerline $(HOME)/.config/pip/powerline-status

dein_update: dein_install
	yes | nvim -c "call dein#update()" -c "qa!"
	yes | vim -c "call dein#update()" -c "qa!"

dein_install:
	yes | nvim -c "call dein#install()" -c "qa!"
	yes | vim -c "call dein#install()" -c "qa!"

coc_build:
	yarn --cwd $(HOME)/.cache/dein/repos/github.com/neoclide/coc.nvim install
	yarn --cwd $(HOME)/.cache/dein/repos/github.com/neoclide/coc.nvim build

coc_install:
	yes | nvim -c "CocInstall coc-json coc-rust-analyzer coc-texlab coc-tsserver coc-html coc-css coc-pyright coc-phpls coc-git coc-go coc-explorer coc-snippets coc-glslx"

force:

