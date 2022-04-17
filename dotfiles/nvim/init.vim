" Fundamentals "{{{
" ---------------------------------------------------------------------

" init autocmd
autocmd!
scriptencoding utf-8
set nocompatible
set number
syntax enable
set fileencodings=utf-8,latin
set encoding=utf-8
set autoindent
set nobackup
set nohlsearch
set showcmd
" set cmdheight=1
" set laststatus=2
set scrolloff=5
set expandtab

set inccommand=split

" Don't redraw while executing macros
set lazyredraw


set smarttab
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set ai
set si
set nowrap
set backspace=start,eol,indent
" Finding files - Search down into subfolders
set path+=**
set wildignore+=*/node_modules/*

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste
" Toggle paste mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" Add asterisks in block comments
set formatoptions+=r

let mapleader=" "

"}}}

" Highlights "{{{
" ---------------------------------------------------------------------
set cursorline

"}}}

" File types "{{{
" ---------------------------------------------------------------------
" Restore last cursor position on re-opening a file & scroll to middle of screen
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ |   exe "normal! zz"
  \ | endif

" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.mdx set filetype=markdown

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.py,.md

autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

"}}}

" Plugins "{{{
" ---------------------------------------------------------------------
" install vim-plugged then :PlugInstall

call plug#begin('~/.vim/plugged')
Plug 'mcchrish/nnn.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'tami5/lspsaga.nvim'
Plug 'folke/lsp-colors.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'windwp/nvim-ts-autotag'
Plug 'onsails/lspkind-nvim'
call plug#end()

if has("unix")
  let s:uname = system("uname -s")
  if s:uname == "Darwin\n"
    " Use OSX clipboard to copy and to paste
    set clipboard+=unnamedplus
  endif
endif
if has('win32')
  " Use Windows clipboard to copy and to paste
  set clipboard^=unnamed,unnamedplus
endif

"}}} 

" Mappings "{{{
" ---------------------------------------------------------------------

" Splits, used with C-w H/K to rearrange them
set splitright
set splitbelow
nnoremap <leader>- :new<CR>
nnoremap <leader>\| :vnew<CR>

" Navigate windows
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l
map sd <C-w>q

" Resize windows
nmap <C-S-left> <C-w><
nmap <C-S-right> <C-w>>
nmap <C-S-up> <C-w>+
nmap <C-S-down> <C-w>-

" Buffer management
nnoremap <leader>bl :ls<CR>:buffer<Space>
nnoremap <leader>bj :bj<CR>
nnoremap <leader>bk :bk<CR>
nnoremap <leader>bd :bd<CR>

nmap te :tabedit 
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>
 
" Shortcut to edit this config
nnoremap <leader>ec :e $MYVIMRC<CR>
nnoremap <leader>sc :source $MYVIMRC<CR>
 
inoremap jk <Esc>

" Map Y like D, C etc. behave (to end of line)
nnoremap Y  y$

" Delete without yank, e.g. <leader>dw or <leader>dd
nnoremap <leader>d "_d
xnoremap <leader>d "_d
nnoremap x "_x

" Delete a word backwards
nnoremap dw vb"_d

" Select all
nmap <C-a> gg<S-v>G

" Since C-a is mapped, move incr (& decr)
nnoremap + <C-a>
nnoremap - <C-x>

" Save with root permission
command! W w !sudo tee > /dev/null %" Move lines up or down

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

"}}}
 
" Theme "{{{

set background=light
colorscheme solarized

"}}}

" za|zR|zM - toggle|open all|close all folds
" vim: set foldmethod=marker foldlevel=20:
