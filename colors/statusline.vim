" ====================================================================
" 
" Make sure to:
" 1. source this file somewhere at the bottom of your config.
" 2. disable any statusline plugins, as they will override this.
" ====================================================================
"

" Do not show mode under the statusline since the statusline itself changes
" color depending on mode
set noshowmode

set laststatus=2
" ~~~~ Statusline configuration ~~~~
" ':help statusline' is your friend!
function! RedrawModeColors(mode) " {{{
  " Normal mode
  if a:mode == 'c'
    hi MyStatuslineAccent  guifg=#3c3836 gui=bold
    hi MyStatuslineFilename guifg=#928374 guibg=#3c3836    
    hi MyStatuslineAccentBody guifg=#928374  guibg=#3c3836     
    hi MyStatuslineLineColBody guifg=#928374  guibg=#3c3836     
    hi MyStatuslinePercentageBody guifg=#928374  guibg=#3c3836     
  " Insert mode
  elseif a:mode == 'i'
    hi MyStatuslineAccent  guifg=#3c3836 
    hi MyStatuslineFilename guifg=#83a598 guibg=#3c3836    
    hi MyStatuslineAccentBody guifg=#83a598  guibg=#3c3836    
    hi MyStatuslineLineColBody guifg=#83a598  guibg=#3c3836    
    hi MyStatuslinePercentageBody guifg=#83a598  guibg=#3c3836    
  " Replace mode
  elseif a:mode == 'R'
    hi MyStatuslineAccent guifg=#3c3836 
    hi MyStatuslineFilename guifg=#689d6a guibg=#3c3836    
    hi MyStatuslineAccentBody guifg=#689d6a  guibg=#3c3836    
    hi MyStatuslineLineColBody guifg=#689d6a  guibg=#3c3836    
    hi MyStatuslinePercentageBody guifg=#689d6a  guibg=#3c3836    
  " Visual mode
  elseif a:mode == 'v' || a:mode == 'V' || a:mode == '^V'
    hi MyStatuslineAccent guifg=#3c3836 
    hi MyStatuslineFilename guifg=#d65d0e guibg=#3c3836    
    hi MyStatuslineAccentBody guifg=#d65d0e  guibg=#3c3836    
    hi MyStatuslineLineColBody guifg=#d65d0e  guibg=#3c3836    
    hi MyStatuslinePercentageBody guifg=#d65d0e  guibg=#3c3836    
  " Command mode
  elseif a:mode == 'n'
    hi MyStatuslineAccent guifg=#3c3836 
    hi MyStatuslineFilename guifg=#d79921 guibg=#3c3836    
    hi MyStatuslineAccentBody guifg=#d79921  guibg=#3c3836    
    hi MyStatuslineLineColBody guifg=#d79921  guibg=#3c3836    
    hi MyStatuslinePercentageBody guifg=#d79921  guibg=#3c3836    
  " Terminal mode
  elseif a:mode == 't'
    hi MyStatuslineAccent guifg=#3c3836 
    hi MyStatuslineFilename guifg=#98971a guibg=#3c3836    
    hi MyStatuslineAccentBody guifg=#98971a  guibg=#3c3836    
    hi MyStatuslineLineColBody guifg=#98971a  guibg=#3c3836    
    hi MyStatuslinePercentageBody guifg=#98971a  guibg=#3c3836    
  endif
  " Return empty string so as not to display anything in the statusline
  return ''
endfunction
" }}}
function! SetModifiedSymbol(modified) " {{{
    if a:modified == 1
        hi MyStatuslineModifiedBody guifg=#d79921 guibg=#3c3836
    else
        hi MyStatuslineModifiedBody guifg=#928374 guibg=#3c3836
    endif
    return '●'
endfunction
" }}}
function! SetFiletype(filetype) " {{{
  if a:filetype == ''
  	  hi MyStatuslineFiletypeBody guifg=#d79921 guibg=#3c3836
      return '-'
  else
  	  hi MyStatuslineFiletypeBody guifg=#928374 guibg=#3c3836
      return a:filetype
  endif
endfunction

function! MyFiletype(filetype)
  if a:filetype == ''
  	  hi MyStatuslineFiletypeBody guifg=#928374 guibg=#3c3836
      return '-'
  else
  	  hi MyStatuslineFiletypeBody guifg=#d79921 guibg=#3c3836
  return winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction
" }}}

" Statusbar items
" ====================================================================

" This will not be displayed, but the function RedrawModeColors will be
" called every time the mode changes, thus updating the colors used for the
" components.
set statusline=%{RedrawModeColors(mode())}
" Left side items
" =======================
set statusline+=%#MyStatuslineAccent#\ 
"set statusline+=%#MyStatuslineAccentBody#\ 
set statusline+=%#MyStatuslineAccentBody#%{MyFiletype(&filetype)} 
set statusline+=%#MyStatuslineAccentBody#\  
" Filename
set statusline+=%#MyStatuslineFilename#%f
set statusline+=%#MyStatuslineAccent#\
set statusline+=%#MyStatuslineSeparator#\ 
" Modified status
 set statusline+=%#MyStatuslineAccent#\ 
 set statusline+=%#MyStatuslineModifiedBody#%{SetModifiedSymbol(&modified)}
 set statusline+=%#MyStatuslineAccent#\
 set statusline+=%#MyStatuslineSeparator#\ 
" Right side items
" =======================
set statusline+=%=
" Line and Column
set statusline+=%#MyStatuslineAccent#\ 
set statusline+=%#MyStatuslineLineColBody#%2l
set statusline+=\/%#MyStatuslineLineColBody#%2c
set statusline+=%#MyStatuslineAccent#\ 
" Padding
set statusline+=\ 
" Current scroll percentage and total lines of the file
set statusline+=%#MyStatuslineAccent#\ 
set statusline+=%#MyStatuslinePercentageBody#%p%%
set statusline+=%#MyStatuslineAccent#\ 
" Padding
set statusline+=\ 
" Filetype
set statusline+=%#MyStatuslineAccent#\ 
set statusline+=%#MyStatuslineFiletypeBody#%{MyFiletype(&filetype)}
set statusline+=%#MyStatuslineAccent#\ 

" Setup the colors
hi StatusLine          guifg=#282828 guibg=#98971a 
hi StatusLineNC        guifg=#282828 guibg=#98971a

hi mystatuslineseparator guifg=#3c3836 guibg=#3c3838

hi MyStatuslineModified guifg=#928374 guibg=#3c3836

hi MyStatuslineFiletype guifg=#928374 guibg=None    
hi MyStatuslineFiletypeBody ctermfg=5 cterm=italic ctermbg=0  guifg=#928374 guibg=#3c3836 gui=italic

hi MyStatuslinePercentageBody guifg=#928374 guibg=#3c3836
hi MyStatuslinePercentage guifg=#928374  guibg=#3c3836     

hi MyStatuslineLineCol ctermfg=0 cterm=NONE ctermbg=NONE guifg=#928374 guibg=None    
hi MyStatuslineLineColBody guifg=#928374 guibg=#3c3836   
