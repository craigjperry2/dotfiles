let mapleader=" "
 
" vim-plugged plugins **********************************************************
"   Install vim-plugged then :PlugInstall

call plug#begin('~/.vim/plugged')
Plug 'mcchrish/nnn.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
call plug#end()
 

" nnn plugin *******************************************************************

let g:nnn#layout = {'window': {'width':0.9, 'height':0.6, 'highlight':'Debug'}}
let g:nnn#action = {'<c-x>': 'split', '<c-v>': 'vsplit'}


" easymotion plugin ************************************************************

let g:EasyMotion_smartcase = 1
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
map  / <Plug>(easymotion-sn)
map  ? <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
omap ? <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
 

" fzf.vim plugin ***************************************************************
nnoremap <leader>zr :Rg 
nnoremap <leader>zl :Lines<CR>
nnoremap <leader>zm :Marks<CR>
nnoremap <leader>zf :Files<CR>
nnoremap <leader>zb :Buffers<CR>
nnoremap <leader>zg :GFiles<CR>
nnoremap <leader>zt :Tags<CR>
nnoremap <leader>zh :History:<CR>
nnoremap <leader>z/ :History/<CR>


" lualine plugin **********************************************************

lua require('lualine').setup({options={theme='solarized_dark'}})


" theme **********************************************************

set background=dark
colorscheme solarized


" nvim customisations **********************************************************

" Restore last cursor position on re-opening a file & scroll to middle of screen
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ |   exe "normal! zz"
  \ | endif

syntax on
set number
set nohlsearch
filetype plugin indent on
 
" Splits, used with C-w H/K to rearrange them
set splitright
set splitbelow
nnoremap <leader>- :new<CR>
nnoremap <leader>\| :vnew<CR>

" Buffer management
nnoremap <leader>bl :ls<CR>:buffer<Space>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
 
" Shortcut to edit this config
nnoremap <leader>ec :e $MYVIMRC<CR>
nnoremap <leader>sc :source $MYVIMRC<CR>
 
inoremap jk <Esc>

" Map Y like D, C etc. behave (to end of line)
nnoremap Y  y$

" Move lines up or down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Toggle paste mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

