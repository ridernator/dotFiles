set rtp+=$HOME/.local/lib/python3.8/site-packages/powerline/bindings/vim/

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

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'https://github.com/lyuts/vim-rtags.git'
Plug 'https://github.com/ycm-core/YouCompleteMe.git'
Plug 'https://github.com/kien/ctrlp.vim.git'
Plug 'mbbill/undotree'

call plug#end()

colorscheme gruvbox
set background=dark

let mapleader = " "

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = [',git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard'] 
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25

let g:ctrlp_use_caching=0

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>\| :wincmd v<CR>
nnoremap <leader>- :split<CR>
nnoremap <leader>t :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

nnoremap <leader>u :UndotreeShow<CR>

" RipGrep
nnoremap <leader>rg :Rg<SPACE>

" YCM
nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>gf :YcmCompleter FixIt<CR>
