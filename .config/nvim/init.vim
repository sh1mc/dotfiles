set rtp+=~/.vim/bundle/Vundle.vim
set number
call vundle#begin()
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab



Plugin 'VundleVim/Vundle.vim'
Plugin 'cohama/lexima.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'preservim/nerdtree'
"Plugin 'Shougo/neocomplete.vim'

if has('nvim')
    set rtp^=/usr/share/vim/vimfiles/
	"Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
endif


call vundle#end()
filetype plugin indent on


let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
	\ '0': '0 ',
	\ '1': '1 ',
	\ '2': '2 ',
	\ '3': '3 ',
	\ '4': '4 ',
	\ '5': '5 ',
	\ '6': '6 ',
	\ '7': '7 ',
	\ '8': '8 ',
	\ '9': '9 '
	\}
set ambiwidth=double

set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline_theme = 'luna'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" old vim-powerline symbols
" let g:airline_left_sep = '⮀'
" let g:airline_left_alt_sep = '⮁'
" let g:airline_right_sep = '⮂'
" let g:airline_right_sep = ''
let g:airline_right_alt_sep = '⮃'
" let g:airline_symbols.branch = '⭠'
" let g:airline_symbols.readonly = '⭤'
" let g:airline_symbols.linenr = '⭡'

command Tree NERDTreeToggle
highlight LineNr ctermbg=16 
highlight LineNr ctermfg=8


if &compatible
	set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
	call dein#begin('~/.cache/dein')
	call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
	call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
	call dein#end()
	call dein#save_state()
endif
let g:deoplete#enable_at_startup = 1
filetype plugin indent on
syntax enable

let g:LanguageClient_serverCommands = {}

if executable('clangd')
	let g:LanguageClient_serverCommands['c'] = ['clangd']
	let g:LanguageClient_serverCommands['cpp'] = ['clangd']
endif

if executable('pyls')
	let g:LanguageClient_serverCommands['python'] = ['pyls']
endif

"let g:LanguageClient_useVirtualText = 0
