" just testing
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
syntax on

let mapleader=" "
nnoremap <C-s> :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>p "+p
vnoremap <leader>y "+y 
nnoremap <leader>v :vimgrep /<C-r><C-w>/ **/*.
nnoremap <leader>ff :Files .<CR>
nmap <C-n> :NERDTreeToggle<CR>

call plug#begin('~/.local/share/nvim/plugged/')

Plug 'jiangmiao/auto-pairs'
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
call plug#end()


set termguicolors
colo gruvbox
