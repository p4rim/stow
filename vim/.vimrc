
" General
set nocompatible
set encoding=utf-8
set hidden
set autoread
set backspace=indent,eol,start
set confirm

" Appearance
syntax on
set background&
set notermguicolors
set number
set relativenumber
set showcmd
set ruler
set laststatus=2
set wildmenu
set nowrap
set fillchars=eob:\ 

" Scrolling
set scrolloff=8
set sidescrolloff=8
set smoothscroll

" Indentation
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set smartindent

" Search
set ignorecase
set smartcase
set incsearch
set hlsearch

" Editing
set mouse=a
set undofile
set splitbelow
set splitright
set updatetime=300
set timeoutlen=500

if has('clipboard')
    set clipboard=unnamedplus
endif

filetype plugin indent on

packadd comment

autocmd FileType c,cpp setlocal commentstring=//\ %s

" Commands
command! W write

" Keybindings
let mapleader = " "

" Save / Quit
nnoremap <leader>w :write<CR>
nnoremap <leader>q :quit<CR>

" Search
nnoremap <silent> <leader>h :nohlsearch<CR>
nnoremap n nzzzv
nnoremap N Nzzzv

" Scrolling
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap G Gzz

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Buffer navigation
nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprevious<CR>

" Indentation
nnoremap > >>
nnoremap < <<
xnoremap > >gv
xnoremap < <gv

" Move lines
nnoremap J :move .+1<CR>==
nnoremap K :move .-2<CR>==
xnoremap J :move '>+1<CR>gv=gv
xnoremap K :move '<-2<CR>gv=gv
