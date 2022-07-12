local M = {}
local actions = require('telescope.actions')
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
        },
        file_browser = {
            -- theme = "dropdown",
        },
    },
    pickers = {
        buffers = {
            mappings = {
                i = {
                    ["<c-d>"] = actions.delete_buffer
                }
            }
        }
    }
}

require('telescope').load_extension('fzy_native')

local themes = require('telescope.themes')


function M.git_dots()
    local opts = themes.get_dropdown {
        winblend = 20,
        border = true,
        shorten_path = false,
    }
    require("telescope.builtin").git_files(opts)
end


return M
