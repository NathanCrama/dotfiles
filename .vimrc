" ===========================================================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Core
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'w0rp/ale'
Plugin 'jiangmiao/auto-pairs'

Plugin 'natebosch/vim-lsc'

" Rust
Plugin 'rust-lang/rust.vim'
Plugin 'phildawes/racer'
Plugin 'racer-rust/vim-racer'

" Python
Plugin 'vim-scripts/indentpython.vim'

" Lua
Plugin 'WolfgangMehner/lua-support'

" HTML - CSS - JS
Plugin 'mattn/emmet-vim'
Plugin 'pangloss/vim-javascript'

" Dart
Plugin 'dart-lang/dart-vim-plugin'

" Markdown
Plugin 'gabrielelana/vim-markdown'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" ==========================================================================================
" Dart lang completion? 
let g:lsc_server_commands = {'dart': 'dart_language_server'}
let g:loaded_syntastic_dart_dartanalyzer_checker = 0

" Color scheme
colorscheme darcula

" Sets line numbers
set number

" To use bash aliases in vim
" set shellcmdflag=-ic

" Fixes tab length
" 12341234123412341234
"q  q   q   q   q
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" Set auto-indent
set autoindent
filetype indent on
set smartindent
set hlsearch

" syntax highlighting
syntax on

" C++ 
set exrc
set secure

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


set completeopt-=preview


" Plugin shortcuts
"
nmap <F6> :NERDTreeToggle<CR>
    " NERDTree customization
        " Start NERDTree
" autocmd VimEnter * NERDTree
        " Go to previous (last accessed) window.
" autocmd VimEnter * wincmd p
        " Focusses main window when opening a new tab
" autocmd BufNew * wincmd l

" Changes cursor in insert/normal mode
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" #################################################################
"
" REFACTORING
" For local replace
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>

" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

" Aliasses :w with :W
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> X ((getcmdtype() is# ':' && getcmdline() is# 'X')?('x'):('X'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
cnoreabbrev <expr> WQ ((getcmdtype() is# ':' && getcmdline() is# 'WQ')?('wq'):('WQ'))

set hidden
