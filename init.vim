set number 
set relativenumber
set hidden
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
set nohlsearch
set showcmd
set ignorecase
set smartcase
syntax on

let mapleader=" "
nnoremap <C-s> :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>p "+p
vnoremap <leader>y "+y 
nnoremap <leader>v :vimgrep /<C-r><C-w>/ **/*
nnoremap <leader>ff :Files .<CR>
nmap <C-n> :NERDTreeToggle<CR>

call plug#begin('~/.local/share/nvim/plugged/')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'gruvbox-community/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
call plug#end()

" Go to mappings
"nmap <silent> Cd <Plug>(coc-definition)
"nmap <silent> Ct <Plug>(coc-type-definition)
"nmap <silent> Cp <Plug>(coc-implementation)
"nmap <silent> Cr <Plug>(coc-references)

set termguicolors
colo gruvbox
