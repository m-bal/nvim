
vim.api.nvim_set_keymap('n', '<C-g>', ':lua require(\'telescope.builtin\').git_files()<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '<C-f>', ':lua require(\'telescope.builtin\').file_browser()<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '<leader>hf', ':lua require(\'telescope.builtin\').file_browser({hidden=true})<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '<C-s>', ':lua require(\'custom.telescope\').searchin_projects()<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '<leader>nc', ':lua require(\'telescope.builtin\').git_files({cwd=\'~/.config/nvim/\'})<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '<leader>rc', ':luafile %<CR>', {silent=false})
vim.api.nvim_set_keymap('n', '<C-p>', ':BufferPrevious<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '<C-n>', ':BufferNext<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '<C-b>', ':bd!<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '<C-t>', ':vsplit|terminal<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '<C-w>o', ':lua toggleZoom()<CR>', {silent=false})

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

-- vim.api.nvim_set_keymap('t'
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
