if g:dein#_cache_version !=# 150 || g:dein#_init_runtimepath !=# '/home/sh1mc/.vim,/usr/share/vim/vimfiles,/usr/share/vim/vim82,/usr/share/vim/vimfiles/after,/home/sh1mc/.vim/after,/home/sh1mc/.cache/dein/repos/github.com/Shougo/dein.vim' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/home/sh1mc/.vimrc', '/home/sh1mc/.config/nvim/dein.toml', '/home/sh1mc/.config/nvim/dein_lazy.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/sh1mc/.cache/dein'
let g:dein#_runtime_path = '/home/sh1mc/.cache/dein/.cache/.vimrc/.dein'
let g:dein#_cache_path = '/home/sh1mc/.cache/dein/.cache/.vimrc'
let &runtimepath = '/home/sh1mc/.vim,/usr/share/vim/vimfiles,/home/sh1mc/.cache/dein/.cache/.vimrc/.dein,/usr/share/vim/vim82,/home/sh1mc/.cache/dein/.cache/.vimrc/.dein/after,/usr/share/vim/vimfiles/after,/home/sh1mc/.vim/after,/home/sh1mc/.cache/dein/repos/github.com/Shougo/dein.vim'
