
require('telescope').setup {
    defaults = {
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case'
        },
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        color_devicons = true,
        prompt_prefix = '🔍 ',
        file_ignore_patterns = {"builds", "opt", "node_modules", "%.o", "%.pyc", "__pycache__" , "%.git"},

        file_previewer = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}

require('telescope').load_extension('fzy_native')


local M = {}
M.search_file = function()
    require("telescope.builtin").file_browser({
        prompt_title = "Search ",
        cwd = vim.fn.expand("%:p:h"),
    })
end

M.search_nvim = function()
    require("telescope.builtin").git_files({
        prompt_title = "Search Nvim Config",
        cwd = '~/.config/nvim/'
    })
end

return M
