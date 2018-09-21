" Don't bother with vi compatibility
set nocompatible

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

set modelines=0

set noeb vb t_vb=

set ruler

set nu
set rnu

set foldmethod=syntax
set foldnestmax=3

filetype off

syntax enable
set background=dark

let g:hybrid_use_Xresources = 1
colorscheme molokai

"""""""""""""""""
" Miscellaneous "
"""""""""""""""""
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

" visual cues
set colorcolumn=80
set cursorline

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

" Trim trailing whitespace before saving
fun! TrimWhitespace()
    let l:save_cursor = getpos('.')
    %s/\s\+$//e
    call setpos('.', l:save_cursor)
endfun

autocmd BufWritePre * :call TrimWhitespace()

""""""""""""""""""""""""""""""
" Load plugins with vim-plug "
""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'vim-syntastic/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'

call plug#end()


"""""""""""""""""
" Plugin config "
"""""""""""""""""
" NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_html_checkers = ['validator']
let g:syntastic_javascript_checkers = ['eslint']
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']

" Airline
set encoding=utf-8
let g:airline_powerline_fonts = 1

set laststatus=2
let g:airline#extensions#tabline#enabled = 1

" Ctrl+P
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" YouCompleteMe "
let g:ycm_extra_conf_globlist = ['~/working_dir/*']


"""""""""""""""""""""""
" Source local config "
"""""""""""""""""""""""
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction

call SourceIfExists('~/.vimrc.local')

" Always do this last
filetype plugin indent on
