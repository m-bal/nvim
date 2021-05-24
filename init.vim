call plug#begin()
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'sickill/vim-monokai'
Plug 'rhysd/vim-clang-format'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/rainbow_parentheses.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'
Plug 'ntpeters/vim-better-whitespace'
Plug 'mhinz/vim-startify'
Plug 'troydm/zoomwintab.vim'
Plug 'moll/vim-bbye'
Plug 'voldikss/vim-floaterm'
call plug#end()
set clipboard=unnamed

set encoding=UTF-8

set termguicolors

" solarized8
" set background=dark
" autocmd vimenter * ++nested colorscheme solarized8
" colorscheme solarized8_flat
" colorscheme gruvbox
" let g:gruvbox_bold=1
" let g:gruvbox_contrast_dark='hard'
colorscheme monokai
let mapleader=" "
" colorscheme peachpuff
" terminal esc key to c-v c-[
tnoremap <C-[><C-[> <C-\><C-n>
set path=$PWD/**

set nocompatible
filetype indent plugin on

if executable('rg')
	let g:rg_derive_root='true'
endif
let g:airline_theme='molokai'
let g:airline#extensions#default#layout = [
      \ [ 'a', 'b', ],
      \ [ 'z' ]
      \ ]
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'


syntax on
set splitright
set splitbelow
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
set ls=2
set mouse=a
set whichwrap+=<,>,h,l
set shiftwidth=4
set tabstop=4
set fillchars+=vert:│
set expandtab
set wildmenu
set novisualbell
set relativenumber
set noswapfile
set nobackup
set nowritebackup
set colorcolumn=80
set signcolumn=no
set title
set wildignorecase
set wildignore+=*.o,*.obj,*~,*.png,*.gif,*.jpg,*.jpeg,*.zip,*.jar,*.pyc
set wildignore+=*.gem,*/coverage/*,*/log/*,tags,*.rbc,*.ttf,*.eot
set wildignore+=*/_site/*,*/tmp/*,*/vendor/*,*/public/uploads/*,*/_src/*
set wildignore+=*/.jhw-cache/*,.vagrant,*/.stuff/*,*/test/reports/*,*/*.egg-info/*
set wildignore+=*/builds/*

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
nnoremap <C-g> :GFiles<CR>
nnoremap <C-f> :Files<CR>
nnoremap <C-s> :Rg<SPACE>
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>
nnoremap <silent> <C-c> :Bwipeout<CR>
nnoremap <silent> <C-t> :FloatermNew --width=0.5 --wintype=vsplit<CR>i cd "$(git rev-parse --show-toplevel)"<CR><C-l><C-\><C-n>
" nmap <silent> nt :NERDTreeToggle<CR>
noremap <C-j> :resize +1<CR>
noremap <C-k> :resize -1<CR>
noremap <C-h> :vertical resize -1<CR>
noremap <C-l> :vertical resize +1<CR>




command! -nargs=0 Prettier :CocCommand prettier.formatFile


"COC settings from readme
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>af  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

let g:startify_fortune_use_unicode = 1
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]

let g:startify_bookmarks = [
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'b': '~/.bashrc' },
            \ ]



au VimEnter * RainbowParenthesesActivate
" Round disabled for CMakeLists.txt support...
"au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


