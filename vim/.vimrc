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

" Show previews when tab-completing :Commands
set wildmenu

filetype off

syntax enable
set background=dark

let g:hybrid_use_Xresources = 1
colorscheme solarized

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

"Plug 'vim-syntastic/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

""" LSP Plugins
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'
"Plug 'mattn/vim-lsp-settings'

 " dependency of tsuquyomi
Plug 'Shougo/vimproc.vim', {'do': 'make'}

""" Typescript plugins
" TSServer client (go-to-definition, rename, etc..)
Plug 'Quramy/tsuquyomi',           {'for': 'typescript'}
" TS Syntax highlight
Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
" TS/JS indenting
Plug 'jason0x43/vim-js-indent',    {'for': ['javascript', 'typescript']}

"Plug 'natebosch/vim-lsc'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
"Plug 'artur-shaik/vim-javacomplete2'
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

" vim-lsp
au User lsp_setup call lsp#register_server({
    \ 'name': 'clangd',
    \ 'cmd': {server_info->['clangd']},
    \ 'whitelist': ['cpp'],
    \})

au User lsp_setup call lsp#register_server({
    \ 'name': 'IntelliJLanguageServer',
    \ 'cmd': {server_info->['nc', 'localhost', '5800']},
    \ 'whitelist': ['java'],
    \})


" auto-close preview window after completion
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Enable logging
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/vim-lsp.log')

nnoremap gd :<C-u>LspDefinition<CR>
nnoremap fu :<C-u>LspReferences<CR>

" Airline
set encoding=utf-8
let g:airline_powerline_fonts = 1

set laststatus=2
let g:airline#extensions#tabline#enabled = 1

" YouCompleteMe "
let g:ycm_extra_conf_globlist = ['~/working_dir/*']

" deoplete
let g:deoplete#enable_at_startup = 0

"autocmd FileType java setlocal omnifunc=javacomplete#Complete

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
