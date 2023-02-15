" Nathan Swann - 'minimal' VIMRC
" No Plugins just pure vim
" Still everything you want + just a little bit more
set nocompatible
filetype on

let mapleader = "\<space>"

inoremap jk <Esc>
set number
set relativenumber
set lazyredraw
set autoindent

map <leader>rn :set relativenumber!<CR>
map <leader>e :Explore!<CR>
map <leader>se :vsplit ~/.vimrc<CR>
map <leader>ss :source ~/.vimrc<CR>
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
let g:cc_options=["120","80,120",100,"50,100"]
let &cc=get(g:cc_options,0)
function Alternate_cc ()
        let g:cc_state+=1
        let g:cc_state= g:cc_state % len(g:cc_options)
        let &cc= get(g:cc_options,g:cc_state)
endfunction

autocmd FileType d setlocal shiftwidth=2 softtabstop=2 expandtab

"
" <leader>w toggle a small submode to resize windows
"
nnoremap <leader>w :call ToggleResizeMode()<CR>

let s:KeyResizeEnabled = 0

function! ToggleResizeMode()
  if s:KeyResizeEnabled
    call NormalArrowKeys()
    let s:KeyResizeEnabled = 0
  else
    call ResizeArrowKeys()
    let s:KeyResizeEnabled = 1
  endif
endfunction

function! GroupWindows(horizontal) abort
  let l:bufnr = bufnr('%')
  if a:horizontal | let l:vert = '' | else | let l:vert = 'vert ' | endif
  wincmd c
  execute l:vert . 'sbuffer ' . l:bufnr
endfunction

function! NormalArrowKeys()
  " unmap keys Reminder <CTRL-V> before inserting lkjh to get the unmaps to work :|
  nunmap j
  nunmap k
  nunmap h
  nunmap l

  nunmap J
  nunmap K
  nunmap H
  nunmap L

  unmap r
  unmap n

  unmap s
  unmap v
endfunction

function! ResizeArrowKeys()
  "Resize
  nnoremap j :resize +2<CR>
  nnoremap k :resize -2<CR>
  nnoremap h :vertical resize -2<CR>
  nnoremap l :vertical resize +2<CR>
  " Move to TOP BOTTOM etc
  nnoremap J <c-w>J
  nnoremap K <c-w>K
  nnoremap H <c-w>H
  nnoremap L <c-w>L
  nnoremap n <c-w>x
  nnoremap r <c-w>r
  nnoremap s :call GroupWindows(v:true) <CR>
  nnoremap v :call GroupWindows(v:false) <CR>
endfunction

" Status Line
function StatusResizeMode()
  return s:KeyResizeEnabled > 0? ' RESIZE ': ''
endfunction

set laststatus=2
set statusline=%#TabLineSel#%R\ %f\ %y\ %m%#ErrorMsg#%{StatusResizeMode()}%#TabLineSel#%=
set statusline+=%#DiffText#[%l\ :\ %L]
