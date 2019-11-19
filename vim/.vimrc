call plug#begin('~/.vim/plugged')

" Core
Plug 'scrooloose/nerdtree'
Plug 'ycm-core/YouCompleteMe'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'
Plug 'jiangmiao/auto-pairs'

""" Language support
" Rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

" Python
Plug 'vim-scripts/indentpython.vim'

" Misc
Plug 'dag/vim-fish'

" Pretty
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()   

""" COMPLETION SETTINGS
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
set background=dark
colorscheme hybrid_material

let g:airline_powerline_fonts = 1
let g:airline_theme='minimalist'
" let g:airline_theme='hybrid'
" let g:airline_theme='deus'
" let g:airline_theme='bubblegum'

"" Fixes tab length
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=0
set smarttab
" Draws a line at columt 80. Don't write longer lines than that you dummy
set colorcolumn=80

set autoindent
filetype indent on
set hlsearch

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
    " au!
    " autocmd VimEnter * :normal :startinsert :stopinsert 
    " "" Changes cursor in insert/normal mode
    " autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    " "" Start NERDTree
    " autocmd VimEnter * NERDTree
    " "" Go to previous (last accessed) window.
    " autocmd VimEnter * wincmd p
    " "" Focusses main window when opening a new tab
    " autocmd BufNew * wincmd l
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
