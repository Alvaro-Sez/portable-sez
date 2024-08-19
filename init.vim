set number 
set relativenumber
set hidden
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
set incsearch
set nohlsearch
set showcmd
set ignorecase
set smartcase
syntax on

let mapleader=" "

" allows to replace lines pasting from register, without yaking on deletion
vnoremap p "_dP
nnoremap <C-s> :w<CR>
nnoremap <leader>q :bd<CR>
nnoremap <leader>p "+p
vnoremap <leader>y "+y 
nnoremap <leader>v :vimgrep /<C-r><C-w>/ **/*
nnoremap <leader>ff :Files .<CR>
nnoremap <leader>j <Plug>(easymotion-s2)
nnoremap <leader>n :NERDTreeToggle<CR>
nmap <C-n> :bn<CR>
nmap <C-p> :bp<CR>


call plug#begin('~/.local/share/nvim/plugged/')
Plug 'neoclide/coc.nvim', {'branch': 'release'} " To manage lsps
Plug 'romgrk/barbar.nvim' " Show Buffers as Tabs
Plug 'nvim-tree/nvim-web-devicons' " OPTIONAL: for showing file icons in the barbar tabs
Plug 'lewis6991/gitsigns.nvim' " OPTIONAL: for git status in the barbar tabs
Plug 'jiangmiao/auto-pairs'
Plug 'gruvbox-community/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'easymotion/vim-easymotion' " Nice way to move to far places
call plug#end()

" Go to mappings
nnoremap gi <Plug>(coc-implementation)
nnoremap gu <Plug>(coc-references)

set termguicolors
colo gruvbox
