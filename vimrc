set t_Co=256
set autoindent
set smartindent

set ic
set ts=4

set showmatch

set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab

set nocompatible
set modelines=0

set noeb vb t_vb=

set ruler

set nu
set rnu

set foldmethod=syntax
set foldnestmax=1

syntax enable
set background=dark
colorscheme solarized

filetype off
call pathogen#infect()
filetype plugin indent on


" Remove all trailing white space from python files on save.
autocmd BufWritePre *.py :%s/\s\+$//e

" MATLAB
source $VIMRUNTIME/macros/matchit.vim
filetype indent on

autocmd BufEnter *.m    compiler mlint

let mapleader = ","

" exit insert mode with jj
inoremap jj <ESC>

" fix search
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>

" Make tab match bracket pairs
nnoremap <tab> %
vnoremap <tab> %

" some text wrapping stuff
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

" ;wq is valid damnit!
nnoremap ; :

" save when I lose focus
au FocusLost * :wa

" Make j and k move within a word-wrapped line
nnoremap j gj
vnoremap j gj
nnoremap k gk
vnoremap k gk

" Make slime use tmux
let g:slime_target = "tmux"

" NERDTree config
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
