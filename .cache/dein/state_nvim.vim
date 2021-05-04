if g:dein#_cache_version !=# 150 || g:dein#_init_runtimepath !=# '/home/sh1mc/.config/nvim,/etc/xdg/nvim,/home/sh1mc/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/usr/share/nvim/runtime,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/home/sh1mc/.local/share/nvim/site/after,/etc/xdg/nvim/after,/home/sh1mc/.config/nvim/after,/usr/share/vim/vimfiles,/home/sh1mc/.cache/dein/repos/github.com/Shougo/dein.vim' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/home/sh1mc/dotfiles/.config/nvim/init.vim', '/home/sh1mc/.config/nvim/dein.toml', '/home/sh1mc/.config/nvim/dein_nvim.toml', '/home/sh1mc/.config/nvim/dein_lazy.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/sh1mc/.cache/dein'
let g:dein#_runtime_path = '/home/sh1mc/.cache/dein/.cache/init.vim/.dein'
let g:dein#_cache_path = '/home/sh1mc/.cache/dein/.cache/init.vim'
let &runtimepath = '/home/sh1mc/.config/nvim,/etc/xdg/nvim,/home/sh1mc/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/home/sh1mc/.cache/dein/.cache/init.vim/.dein,/usr/share/nvim/runtime,/home/sh1mc/.cache/dein/.cache/init.vim/.dein/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/home/sh1mc/.local/share/nvim/site/after,/etc/xdg/nvim/after,/home/sh1mc/.config/nvim/after,/usr/share/vim/vimfiles,/home/sh1mc/.cache/dein/repos/github.com/Shougo/dein.vim'
filetype off
