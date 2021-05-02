set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
	call dein#begin('~/.cache/dein')
	call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
	if has('nvim')
		call dein#load_toml('~/.config/nvim/dein_nvim.toml', {'lazy': 0})
	endif
	call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
	call dein#end()
	call dein#save_state()
endif

set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set ambiwidth=double
set laststatus=2
set clipboard=unnamedplus
filetype plugin indent on
syntax enable
