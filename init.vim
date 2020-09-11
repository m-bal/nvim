call plug#begin()
Plug 'gruvbox-community/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
call plug#end()

colorscheme gruvbox
set background=dark

set nocompatible
filetype indent plugin on

if executable('rg')
	let g:rg_derive_root='true'
endif

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
set autochdir
set inccommand=nosplit
set t_vb=
set mouse=a
set whichwrap+=<,>,h,l
set shiftwidth=4
set tabstop=4
set wildmenu
set novisualbell
set relativenumber
set noswapfile
set nobackup


set cmdheight=2

set shortmess+=c

set colorcolumn=80

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }



" --- vim go (polyglot) settings.
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1

nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader>ps :Rg<SPACE>

  




inoremap { {}<left>

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart
