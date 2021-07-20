
function extendMap(mode, prefix, suffixCmd, opt)
    opt = opt or {silent=false}
    for suffix, cmd in pairs(suffixCmd) do
        vim.api.nvim_set_keymap(mode, prefix .. suffix, cmd, opt)
    end
end

vim.api.nvim_set_keymap('n', '<C-f>', ':lua require(\'telescope.builtin\').file_browser({cwd=\'~\'})<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '<leader>tf', ':lua require(\'custom.telescope\').search_file()<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '<leader>hf', ':lua require(\'telescope.builtin\').file_browser({hidden=true})<CR>', {silent=true})
-- vim.api.nvim_set_keymap('n', '<C-s>', ':lua require(\'custom.telescope\').searchin_projects()<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '<C-s>', ':lua require(\'telescope.builtin\').live_grep()<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '<leader>nc', ':lua require(\'telescope.builtin\').git_files({cwd=\'~/.config/nvim/\'})<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '<leader>rc', ':luafile %<CR>', {silent=false})
vim.api.nvim_set_keymap('n', '<C-p>', ':bp<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '<C-n>', ':bn<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '<leader>bd', ':bd!<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '<C-t>', ':vsplit|terminal<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '<leader>zm', ':lua toggleZoom()<CR>', {silent=false})
vim.api.nvim_set_keymap('n', '<leader>dh', ':DiffHistory<CR>', {silent=false})
vim.api.nvim_set_keymap('n', '<leader>mp', ':Telescope man_pages<CR>', {silent=false})
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

vim.api.nvim_command("tmap ; <C-\\><C-n>")
vim.api.nvim_command("tmap <C-b> ;<C-b>")

vim.api.nvim_command("inoremap <expr> <Tab> pumvisible() ? \"\\<C-n>\" : \"\\<Tab>\"")
vim.api.nvim_command("inoremap <expr> <S-Tab> pumvisible() ? \"\\<C-p>\" : \"\\<S-Tab>\"")
vim.cmd [[
    augroup rc
    au!
    au TermOpen * setlocal nobuflisted
    augroup end
]]

-- .make files aren't detected as make files
vim.cmd [[
    au BufRead,BufNewFile *.make set filetype=make
]]

vim.cmd[[
    highlight Normal guibg=black
    highlight NonText guibg=black
]]
vim.cmd[[
    highlight Normal ctermbg=black
    highlight NonText ctermbg=black
]]
vim.cmd[[
    autocmd VimEnter * hi Normal ctermbg=black guibg=black
]]
vim.cmd[[
    highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=Green guibg=None
    highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=Red guibg=None
    highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=Black guibg=White
    highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=Orange guibg=White
]]
