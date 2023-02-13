set nocompatible
filetype on

let mapleader = "\<space>"

inoremap jk <Esc>
set number
set relativenumber
set lazyredraw

set tabstop=4
set autoindent

map <leader>rn :set relativenumber!<CR>
map <leader>e :Explore!<CR>
map <leader>se :vsplit ~/.vimrc<CR>
map <leader>ss :source ~/.vimrc<CR>
map <leader>rr :!%:p
map <leader>rx :!chmod u+x %:p
map <leader>rc :!clear;%:p
map <leader>cd :cd %:p:h<CR>
map <leader>vv :vsplit
map <leader>cc :call Alternate_cc()<CR>

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

nnoremap <c-n><c-n> :norm i
vnoremap <c-n><c-n> :norm i

nnoremap <c-n><c-m> :norm ^x
vnoremap <c-n><c-m> :norm ^x

let g:cc_state=0
let g:cc_options=["80,120",100,"50,100"]
let &cc=get(g:cc_options,0)
function Alternate_cc ()
        let g:cc_state+=1
        let g:cc_state= g:cc_state % len(g:cc_options)
        let &cc= get(g:cc_options,g:cc_state)
endfunction
