"===========================================================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'phildawes/racer'
Plugin 'racer-rust/vim-racer'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'jnurmine/Zenburn'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'w0rp/ale'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'



" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" ==========================================================================================

" Color scheme
colorscheme darcula

" Sets line numbers
set number

" Auto-closes brackets 
"inoremap " ""<left>
"inoremap ' ''<left>
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>
"inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>O


" Fixes tab length
set tabstop=4
set shiftwidth=4
set expandtab

" Set auto-indent
set autoindent
filetype indent on
set smartindent
set hlsearch

" syntax highlighting
syntax on

" Changes cursor in insert mode
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul
let &t_SI = "\e[3 q"
let &t_EI = "\e[1 q"

" optional reset cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[1 q"
augroup END

" Leader = \
    " shows that the leader key has been pressed 
set showcmd
" run and build shortcuts for Rust
nmap <leader>r :! clear && cargo run<CR>
nmap <leader>b :! clear && cargo build<CR>



" Plugin shortcuts
"
nmap <F6> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
    " NERDTree customization
        " Start NERDTree
autocmd VimEnter * NERDTree
        " Go to previous (last accessed) window.
autocmd VimEnter * wincmd p
        " Focusses main window when opening a new tab
autocmd BufNew * wincmd l

" Changes cursor in insert/normal mode
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

