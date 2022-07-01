" Always show statusline
set laststatus=2

syntax on
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set number relativenumber
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
call plug#end()

colorscheme gruvbox
set background=dark
