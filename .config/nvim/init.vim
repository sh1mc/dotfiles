set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'cohama/lexima.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'preservim/nerdtree'

call vundle#end()
filetype plugin indent on

" vim-airline settings

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
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline_theme = 'luna'

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols

" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
 let g:airline_symbols.crypt = '🔒'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
" let g:airline_symbols.maxlinenr = ''
" let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
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
" let g:airline_right_alt_sep = '⮃'
" let g:airline_symbols.branch = '⭠'
" let g:airline_symbols.readonly = '⭤'
" let g:airline_symbols.linenr = '⭡'

" NERDTree settings

command Tree NERDTreeToggle
highlight LineNr ctermbg=16 
highlight LineNr ctermfg=8

if has('nvim')

    " neovim only

	set rtp^=/usr/share/vim/vimfiles/
	set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
	if dein#load_state('~/.cache/dein')
		call dein#begin('~/.cache/dein')
		call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
		call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
		call dein#end()
		call dein#save_state()
	endif
	
	" language servers
	let g:LanguageClient_serverCommands = {}

	if executable('clangd')
		let g:LanguageClient_serverCommands['c'] = ['clangd']
		let g:LanguageClient_serverCommands['cpp'] = ['clangd']
	endif

	if executable('pyls')
		let g:LanguageClient_serverCommands['python'] = ['pyls']
	endif

	if executable('rust-analyzer')
		let g:LanguageClient_serverCommands['rust'] = ['rust-analyzer']
	endif

	"let g:LanguageClient_useVirtualText = 0
else
	" vim only
endif

set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set ambiwidth=double
set laststatus=2
filetype plugin indent on
syntax enable
