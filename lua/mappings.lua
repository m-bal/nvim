
function extendMap(mode, prefix, suffixCmd, opt)
    opt = opt or {silent=false}
    for suffix, cmd in pairs(suffixCmd) do
        vim.api.nvim_set_keymap(mode, prefix .. suffix, cmd, opt)
    end
end

vim.api.nvim_set_keymap('n', '<C-f>', ':lua require(\'telescope\').extensions.file_browser.file_browser({cwd=\'~\'})<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '<leader>tf', ':lua require(\'telescope\').extensions.file_browser.file_browser({prompt_title="Search ",cwd=vim.fn.expand("%:p:h")})<CR>', {silent=true})
-- vim.api.nvim_set_keymap('n', '<leader>tf', ':lua require(\'telescope.builtin\').file_browser({prompt_title="Search "})<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '<leader>hf', ':lua require(\'telescope\').extensions.file_browser.file_browser({hidden=true})<CR>', {silent=true})
-- vim.api.nvim_set_keymap('n', '<leader>gf', ':lua require(\'custom.telescope\').git_files()<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '<C-s>', ':lua require(\'telescope.builtin\').live_grep()<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '<leader>nc', ':lua require(\'telescope.builtin\').git_files({cwd=\'~/.config/nvim/\'})<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '<leader>bf', ':lua require(\'telescope.builtin\').buffers(require(\'telescope.themes\').get_dropdown({previewer=false, layout_config={width=.9}}))<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '<leader>rc', ':luafile %<CR>', {silent=false})
vim.api.nvim_set_keymap('n', '<C-p>', ':BufferPrev<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '<C-n>', ':BufferNext<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '<leader>bd', ':BufferClose<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '<C-t>', ':vsplit|terminal<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '<leader>zm', ':lua toggleZoom()<CR>', {silent=false})
vim.api.nvim_set_keymap('n', '<leader>dh', ':DiffHistory<CR>', {silent=false})
vim.api.nvim_set_keymap('n', '<leader>mp', ':Telescope man_pages<CR>', {silent=false})
vim.api.nvim_set_keymap('n', '-', ':Explore<CR>', {silent=false})
vim.api.nvim_set_keymap('n', '<leader>cp', 'iclear<CR>pwd<CR>;ggjyy:cd <C-r>"<CR>', {silent=false})

extendMap(
    'n',
    '<leader>g',
    {
        ['s']=':Telescope git_status<CR>',
        ['c']=':Telescope git_commits<CR>',
        ['b']=':Telescope git_branches<CR>',
        ['f']=':Telescope git_files<CR>',
    })

vim.g.windowZoom = 1
function toggleZoom()
    if vim.g.windowZoom ~= 0 then
        vim.fn.execute(":tab split")
        vim.g.windowZoom = 0
    else
        vim.fn.execute(":tab close")
        vim.g.windowZoom = 1
    end
end

function diffMode()
    vim.cmd[[
        hi DiffAdd          ctermbg=72   ctermfg=238  cterm=NONE        guibg=#5bb899 guifg=#3c4855 gui=NONE
        hi DiffDelete       ctermbg=167  ctermfg=238  cterm=NONE        guibg=#db6c6c guifg=#3c4855 gui=NONE
        hi DiffChange       ctermbg=238  ctermfg=178  cterm=UNDERLINE   guibg=#3c4855 guifg=#d5bc02 gui=UNDERLINE
        hi DiffText         ctermbg=178  ctermfg=238  cterm=NONE        guibg=#d5bc02 guifg=#3c4855 gui=NONE
    ]]
end

vim.api.nvim_command("tmap ; <C-\\><C-n>")
vim.api.nvim_command("tmap <C-b> ;<C-b>")

-- vim.api.nvim_command("inoremap <expr> <Tab> pumvisible() ? \"\\<C-n>\" : \"\\<Tab>\"")
-- vim.api.nvim_command("inoremap <expr> <S-Tab> pumvisible() ? \"\\<C-p>\" : \"\\<S-Tab>\"")
vim.cmd [[
    augroup rc
    au!
    au TermOpen * BufferMove -1
    augroup end
]]

-- .make files aren't detected as make files
vim.cmd [[
    au BufRead,BufNewFile *.make set filetype=make
]]

vim.cmd[[
    highlight Normal ctermbg=NONE
    highlight NonText ctermbg=NONE
]]
vim.cmd[[
    highlight Normal guibg=#000000
    highlight NonText guibg=#000000
]]

vim.cmd[[
    autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE
]]
-- vim.cmd[[
--     hi DiffAdd          ctermbg=72   ctermfg=238  cterm=NONE        guibg=#5bb899 guifg=#3c4855 gui=NONE
--     hi DiffDelete       ctermbg=167  ctermfg=238  cterm=NONE        guibg=#db6c6c guifg=#3c4855 gui=NONE
--     hi DiffChange       ctermbg=238  ctermfg=178  cterm=UNDERLINE   guibg=#3c4855 guifg=#d5bc02 gui=UNDERLINE
--     hi DiffText         ctermbg=178  ctermfg=238  cterm=NONE        guibg=#d5bc02 guifg=#3c4855 gui=NONE
-- ]]

