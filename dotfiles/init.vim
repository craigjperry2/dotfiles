let mapleader=" "
 
" Install vim-plugged then :PlugInstall
call plug#begin('~/.vim/plugged')
Plug 'mcchrish/nnn.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()
 
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }
let g:nnn#action = {
      \ '<c-x>': 'split',
      \ '<c-v>': 'vsplit' }
 
let g:EasyMotion_startofline = 0
let g:EasyMotion_smartcase = 1
 
set hlsearch
set number
set ruler
 
filetype on
filetype plugin on
filetype indent on
syntax on
 
set splitright
set splitbelow
nnoremap <silent> <leader>- :new<CR>
nnoremap <silent> <leader>\| :vnew<CR>
nnoremap <silent> <leader>bl :ls<CR>:buffer<Space>
nnoremap <silent> <leader>bd :bd<CR>
nnoremap <silent> <leader>bn :bn<CR>
nnoremap <silent> <leader>bp :bp<CR>
 
" Shortcut to edit this config
nnoremap <silent> <leader>ec :e $MYVIMRC<CR>
nnoremap <silent> <leader>sc :source $MYVIMRC<CR>
 
nnoremap <silent> <leader>/ :nohl<CR><C-L>
 
inoremap jk <Esc>

" Map Y like D, C etc. behave (to end of line)
nnoremap Y  y$

" Toggle paste mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" fzf.vim common tasks
nnoremap <leader>fr :Rg 
nnoremap <leader>fl :Lines<CR>
nnoremap <leader>fm :Marks<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fg :GFiles<CR>
nnoremap <leader>ft :Tags<CR>
nnoremap <leader>fh :History:<CR>
nnoremap <leader>f/ :History/<CR>

