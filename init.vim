call plug#begin()
Plug 'ianding1/leetcode.vim'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
call plug#end()

set termguicolors
colorscheme custom

set nocompatible
filetype indent plugin on

syntax on
set number
set noswapfile 
set ignorecase
set smartcase
set incsearch
set nohlsearch
set linebreak
set smartindent
set showmatch
"set noshowmode
set autochdir
set inccommand=nosplit
set mat=2
set t_vb=
set mouse=a
set whichwrap+=<,>,h,l
set shiftwidth=4
set tabstop=4
set completeopt=longest,menuone,noinsert
set completeopt-=preview
set wildmenu
set novisualbell
set relativenumber



inoremap { {}<left>



let g:leetcode_browser='firefox'
nnoremap <leader>ll :LeetCodeList<cr>
nnoremap <leader>lt :LeetCodeTest<cr>
nnoremap <leader>ls :LeetCodeSubmit<cr>
nnoremap <leader>li :LeetCodeSignIn<cr>
