function extendMap(mode, prefix, suffixCmd, opt)
	opt = opt or { silent = false }
	for suffix, cmd in pairs(suffixCmd) do
		vim.api.nvim_set_keymap(mode, prefix .. suffix, cmd, opt)
	end
end

vim.api.nvim_set_keymap("n", "<leader>os", ":OverseerToggle<CR>", { silent = true })

vim.api.nvim_set_keymap("n", "<leader>ol", ":OverseerLoadBundle<CR>", { silent = true })

vim.api.nvim_set_keymap("n", "<leader>or", ":OverseerRun<CR>", { silent = true })

vim.api.nvim_set_keymap(
	"n",
	"<leader>tf",
	':lua require(\'telescope\').extensions.file_browser.file_browser({prompt_title="Search ",cwd=vim.fn.expand("%:p:h")})<CR>',
	{ silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>hf",
	":lua require('telescope').extensions.file_browser.file_browser({hidden=true, respect_gitignore=false})<CR>",
	{ silent = true }
)
vim.api.nvim_set_keymap("n", "<leader>ts", ":lua require('custom.telescope').files_grep()<CR>", { silent = false })
vim.api.nvim_set_keymap(
	"n",
	"<C-s>",
	":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
	{ silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>nc",
	":lua require('telescope.builtin').git_files({cwd='~/.config/nvim/'})<CR>",
	{ silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<C-b>",
	":lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({previewer=false, layout_config={width=.9}, ignore_current_buffer=true, sort_lastused=true, sort_mru=true, show_all_buffers=true}))<CR>",
	{ silent = true }
)
vim.api.nvim_set_keymap("n", "<leader>rc", ":luafile %<CR>", { silent = false })
vim.api.nvim_set_keymap("n", "<C-p>", ":bp<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-n>", ":bn<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>bd", ":bn|bd #<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>te", ":terminal<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>the", ":split|terminal<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-t>", ":vsplit|terminal<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>zm", ":lua toggleZoom()<CR>", { silent = false })
vim.api.nvim_set_keymap("n", "<leader>dh", ":DiffHistory<CR>", { silent = false })
vim.api.nvim_set_keymap("n", "<leader>mp", ":Telescope man_pages<CR>", { silent = false })
vim.api.nvim_set_keymap("n", "-", ":Dirbuf %<CR>", { silent = false })
vim.api.nvim_set_keymap("n", "<leader>sym", ":Telescope lsp_document_symbols<CR>", { silent = true })
-- Set neovim pwd to terminal path
vim.api.nvim_set_keymap("n", "<leader>cp", 'iclear<CR>pwd<CR>;ggjyy:cd <C-r>"<CR>', { silent = false })
-- disable numberline
vim.api.nvim_set_keymap("n", "<leader>nl", ":lua toggleNumberlineAndList()<CR>", { silent = true })
vim.api.nvim_set_keymap(
	"n",
	"<leader>pg",
	":lua require('telescope').extensions.file_browser.file_browser({prompt_title=\"Projects\", cwd='~/gitlab/'})<CR>",
	{ silent = true }
)
vim.api.nvim_set_keymap("n", "<C-h>", ":split|terminal<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>tn", ":tabn<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>tp", ":tabp<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>tc", ":tabc<CR>", { silent = true })
vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
vim.keymap.set("n", "[c", function()
	require("treesitter-context").go_to_context()
end, { silent = true })

extendMap("n", "<leader>g", {
	["ss"] = ":Telescope git_status<CR>",
	["c"] = ":Telescope git_commits<CR>",
	["b"] = ":Telescope git_branches<CR>",
	["f"] = ":Telescope git_files<CR>",
	["st"] = ":Telescope git_stash<CR>",
	["sm"] = ":Git submodule update --init --recursive<CR>",
	["lo"] = ":Git log --oneline<CR>",
	["ie"] = ":GoIfErr<CR>",
})

function toggleNumberlineAndList()
	if vim.o.nu then
		vim.o.nu = false
		vim.o.rnu = false
		vim.opt.list = false
	else
		vim.o.nu = true
		vim.o.rnu = true
		vim.opt.list = true
	end
end

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

-- function diffMode()
--     vim.cmd[[
--         hi DiffAdd          ctermbg=72   ctermfg=238  cterm=NONE        guibg=#5bb899 guifg=#3c4855 gui=NONE
--         hi DiffDelete       ctermbg=167  ctermfg=238  cterm=NONE        guibg=#db6c6c guifg=#3c4855 gui=NONE
--         hi DiffChange       ctermbg=238  ctermfg=178  cterm=UNDERLINE   guibg=#3c4855 guifg=#d5bc02 gui=UNDERLINE
--         hi DiffText         ctermbg=178  ctermfg=238  cterm=NONE        guibg=#d5bc02 guifg=#3c4855 gui=NONE
--     ]]
-- end

vim.api.nvim_command("tmap ; <C-\\><C-n>")
vim.api.nvim_command("tmap <C-b> ;<C-b>")
vim.api.nvim_command("map mb %")

-- vim.api.nvim_command("inoremap <expr> <Tab> pumvisible() ? \"\\<C-n>\" : \"\\<Tab>\"")
-- vim.api.nvim_command("inoremap <expr> <S-Tab> pumvisible() ? \"\\<C-p>\" : \"\\<S-Tab>\"")
-- vim.cmd [[
--     augroup rc
--     au!
--     au TermOpen * BufferMove -1
--     augroup end
-- ]]
-- vim.cmd[[
--     autocmd TermOpen * SmoothCursorStop
--     autocmd TermLeave * SmoothCursorStart
--     autocmd VimResume * SmoothCursorStart
-- ]]

-- .make files aren't detected as make files
vim.cmd([[
    au BufRead,BufNewFile *.make set filetype=make
]])

-- vim.cmd[[
--     highlight Normal ctermbg=NONE
--     highlight NonText ctermbg=NONE
-- ]]
-- vim.cmd[[
--     " highlight Normal guibg=#00000
--     " highlight NonText guibg=#00000
--     " highlight LineNr  guifg=#acafb0 guibg=#1e222b
-- ]]
-- vim.cmd[[
--     highlight Normal guibg=#1e222b
--     highlight NonText guibg=#1e222b
--     highlight LineNr  guifg=#acafb0 guibg=#1e222b
-- ]]
--
-- vim.cmd[[
--     autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE
-- ]]
-- vim.cmd[[
--     hi DiffAdd          ctermbg=72   ctermfg=238  cterm=NONE        guibg=#5bb899 guifg=#3c4855 gui=NONE
--     hi DiffDelete       ctermbg=167  ctermfg=238  cterm=NONE        guibg=#db6c6c guifg=#3c4855 gui=NONE
--     hi DiffChange       ctermbg=238  ctermfg=178  cterm=UNDERLINE   guibg=#3c4855 guifg=#d5bc02 gui=UNDERLINE
--     hi DiffText         ctermbg=178  ctermfg=238  cterm=NONE        guibg=#d5bc02 guifg=#3c4855 gui=NONE
-- ]]
