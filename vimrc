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


Plugin 'wincent/command-t'
"cd ~/.vim/bundle/command-t/ruby/command-t/ext/command-t/
"ruby extconf.rb
"make
Plugin 'scrooloose/nerdtree'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'sjl/gundo.vim'
Plugin 'scrooloose/syntastic'
Plugin 'digitaltoad/vim-pug'
Plugin 'exu/pgsql.vim'
Plugin 'mxw/vim-jsx'
Plugin 'tpope/vim-sleuth'
Plugin 'henrik/vim-indexed-search'
Plugin 'bling/vim-airline'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'pangloss/vim-javascript'
Plugin 'nvie/vim-flake8'
Plugin 'Valloric/YouCompleteMe'
" cd ~/.vim/bundle/YouCompleteMe/
" install command: ./install.py --gocode-completer --clang-completer --tern-completer
Plugin 'ap/vim-css-color'
Plugin 'wojtekmach/vim-rename'
Plugin 'easymotion/vim-easymotion'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'elzr/vim-json'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'editorconfig/editorconfig-vim'


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

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
"autocmd FileType go nmap <Leader>t <Plug>(go-test)
"
"let g:go_metalinter_autosave = 1
"let g:go_metalinter_enabled = ["vet","deadcode","gocyclo","golint","varcheck","structcheck","aligncheck","errcheck","ineffassign","interfacer","unconvert","goconst","gosimple","staticcheck","gas","goimports","gofmt","unused","misspell"]
"let g:go_metalinter_autosave_enabled = ["vet","golint","gofmt","misspell"]
"let g:go_fmt_command = "goimports"
"autocmd BufWritePre *.go :GoFmt
"autocmd BufWritePre *.go :GoImports
"
" vim-go
let g:go_fmt_options = {'gofmt': '-s', 'goimports': ''}
" gofmt + goimports on save
autocmd BufWritePre *.go :GoFmt
autocmd BufWritePre *.go :GoImports
" metalinter settings
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['golint', 'vet']
let g:go_metalinter_enabled = ['vet', 'deadcode', 'unconvert', 'gocyclo', 'golint', 'varcheck', 'structcheck', 'aligncheck', 'errcheck', 'dupl', 'ineffassign', 'interfacer', 'unconvert', 'goconst',       'gosimple', 'staticcheck', 'gas', 'goimports', 'gofmt', 'unused', 'misspell']

autocmd FileType pug setlocal noexpandtab

imap jj <Esc>
nmap tt <C-W>
set autowrite


syntax enable
set background=dark
colorscheme solarized

nnoremap <F5> :GundoToggle<CR>
nnoremap <F4> :NERDTreeToggle<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"filetype plugin indent on
"set tabstop=4
"set shiftwidth=4
"set expandtab

" let g:syntastic_cpp_compiler_options = ' -std=gnu++0x -I build -DPROJECT_DIR=\"~/Documents/research/pss-research\" '
"let g:syntastic_cpp_compiler_options = ' -std=gnu++0x -I build -I ~/Documents/research/vehicleTracking/src -DPROJECT_DIR=\"~/Documents/research/pss-research\" '

"UnBundle 'AutoClose'

