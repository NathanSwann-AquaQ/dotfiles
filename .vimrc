set nocompatible
filetype on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

let mapleader = "\<space>"

inoremap jk <Esc>
set number
set relativenumber
set lazyredraw

set cc=50,100

map <leader>rn :set relativenumber!<CR>
map <leader>e :Explore!<CR>
map <leader>se :vsplit ~/.vimrc<CR>
map <leader>ss :source ~/.vimrc<CR>
map <leader>rr :!%:p
map <leader>rx :!chmod u+x %:p
map <leader>rc :!clear;%:p
map <leader>cd :cd %:p:h<CR>

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

nnoremap <c-n><c-n> :norm i
vnoremap <c-n><c-n> :norm i

nnoremap <c-n><c-m> :norm ^x
vnoremap <c-n><c-m> :norm ^x

