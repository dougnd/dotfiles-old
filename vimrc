set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


" Plugins go here:


Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'sjl/gundo.vim'
Plugin 'scrooloose/syntastic'


call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line




imap jj <Esc>
nmap tt <C-W>

syntax enable
set background=dark
colorscheme solarized

nnoremap <F5> :GundoToggle<CR>

" let g:syntastic_cpp_compiler_options = ' -std=gnu++0x -I build -DPROJECT_DIR=\"~/Documents/research/pss-research\" '
"let g:syntastic_cpp_compiler_options = ' -std=gnu++0x -I build -I ~/Documents/research/vehicleTracking/src -DPROJECT_DIR=\"~/Documents/research/pss-research\" '

"UnBundle 'AutoClose'

