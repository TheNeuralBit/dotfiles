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
"set rnu

set foldmethod=syntax
set foldnestmax=3

filetype off
call pathogen#infect()
filetype plugin indent on

syntax enable
set background=dark

let g:hybrid_use_Xresources = 1
colorscheme hybrid

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
"set colorcolumn=85

" ;wq is valid damnit!
nnoremap ; :

" save when I lose focus
au FocusLost * :wa

" Turn on code folding for JavaScript
au FileType javascript call JavaScriptFold()
au FileType javascript set softtabstop=2
au FileType javascript set tabstop=2
au FileType javascript set shiftwidth=2
au FileType html set softtabstop=2
au FileType html set tabstop=2
au FileType html set shiftwidth=2

" Make j and k move within a word-wrapped line
nnoremap j gj
vnoremap j gj
nnoremap k gk
vnoremap k gk

" Make slime use tmux
let g:slime_target = "tmux"

" NERDTree config
map <C-n> :NERDTreeTabsToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Syntastic newbie settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Syntastic checkers
let g:syntastic_html_checkers = ['validator']

" airline - turn on powerline fonts
let g:airline_powerline_fonts = 1
set laststatus=2
