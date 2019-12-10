call plug#begin('~/.vim/plugged')

" Core
Plug 'scrooloose/nerdtree'
Plug 'ycm-core/YouCompleteMe'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'natebosch/vim-lsc'
Plug 'christoomey/vim-tmux-navigator'

""" Language support
" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'racer-rust/vim-racer', { 'for': 'rust' }

" Python
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }

" Dart
Plug 'natebosch/vim-lsc-dart', { 'for': 'dart' }

" Misc
Plug 'shmup/vim-sql-syntax'
Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'vim-scripts/bash-support.vim', { 'for': 'bash' }

" Pretty
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

call plug#end()   

set encoding=utf8

""" COMPLETION SETTINGS
let g:lsc_server_commands = {'dart': 'dart_language_server'}

" Universal completion settings for C++
let g:ycm_global_ycm_extra_conf = '~/dotfiles/misc/.ycm_extra_conf.py'
set completeopt-=preview
set noshowmode
let g:racer_experimental_completer = 1

""" LINTING
" Show ALE warnings in Airline
let g:airline#extensions#ale#enabled = 1

""" PRETTY SETTINGS
syntax on
set number relativenumber
set colorcolumn=80
set hlsearch

colorscheme jellybeans

 let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1

set autoindent
set tabstop=4
set shiftwidth=4
set expandtab

"" Fixes tab length
" set softtabstop=0
" set smarttab
" filetype indent on

"" Changes cursor in insert mode
let &t_SI = "\e[3 q"
let &t_EI = "\e[1 q"
"" Highlights current line
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey60

""" NERDTree stuff
"" Allows to switch panes with NerdTree
set hidden
augroup myCmds
    au!
    autocmd VimEnter * :normal :startinsert :stopinsert 
    "" Changes cursor in insert/normal mode
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    "" Start NERDTree
    autocmd VimEnter * NERDTree
    "" Go to previous (last accessed) window.
    autocmd VimEnter * wincmd p
    "" Focusses main window when opening a new tab
    autocmd BufNew * wincmd l
augroup END

""" KEYBINDINGS
" basically allows to do :WQ!
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> X ((getcmdtype() is# ':' && getcmdline() is# 'X')?('x'):('X'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
cnoreabbrev <expr> WQ ((getcmdtype() is# ':' && getcmdline() is# 'WQ')?('wq'):('WQ'))
cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))

"" Cargo shortcut
nmap <F8> :update <CR> :!clear; cargo run <CR>
"" Map NERDTree to F6
nmap <F6> :NERDTreeToggle<CR>
