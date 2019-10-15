" ===========================================================================================
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'powerline/powerline'

" Core
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'w0rp/ale'

Plugin 'jiangmiao/auto-pairs'

" Dart
Plugin 'dart-lang/dart-vim-plugin'

" Rust
" Plugin 'rust-lang/rust.vim'

"" All of your Plugins must be added before the following line
call vundle#end()   

let g:ycm_global_ycm_extra_conf = '~/dotfiles/.ycm_extra_conf.py'

" Sets line numbers
set number relativenumber

"" Fixes tab length
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=0
set smarttab

set autoindent
filetype indent on
filetype plugin indent on    " required
set hlsearch

" syntax highlighting
syntax on

" Changes cursor in insert mode
let &t_SI = "\e[3 q"
let &t_EI = "\e[1 q"

" optional reset cursor on start:
augroup myCmds
au!

autocmd VimEnter * silent !echo -ne "\e[1 q"

" Changes cursor in insert/normal mode
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"" Start NERDTree
" autocmd VimEnter * NERDTree
"" Go to previous (last accessed) window.
" autocmd VimEnter * wincmd p
"" Focusses main window when opening a new tab
" autocmd BufNew * wincmd l

augroup END

" Completion stuff
set completeopt-=preview

"" Plugin shortcuts
nmap <F6> :NERDTreeToggle<CR>
"" Allows to switch panes with NerdTree
set hidden

" Aliasses :w with :W
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> X ((getcmdtype() is# ':' && getcmdline() is# 'X')?('x'):('X'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
cnoreabbrev <expr> WQ ((getcmdtype() is# ':' && getcmdline() is# 'WQ')?('wq'):('WQ'))
cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))

set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey60
