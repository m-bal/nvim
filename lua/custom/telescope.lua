local M = {}
local actions = require('telescope.actions')
local action_utils = require('telescope.actions.utils')
local lga_actions = require("telescope-live-grep-args.actions")
local builtin = require("telescope.builtin")
local transform_mod = require('telescope.actions.mt').transform_mod

local custom_actions = {}

custom_actions.files_to_grep_action = function(prompt_bufnr)
    local action_state = require("telescope.actions.state")
    local current_picker = action_state.get_current_picker(prompt_bufnr)
    local selections = {}
    local from_entry = require("telescope.from_entry")
    for entry in current_picker.manager:iter() do
        if string.len(entry.path) > 0 and entry.path ~= "nil" then
            table.insert(selections, entry)
        end
    end
    local paths = vim.tbl_map(function(e)
        return e.path
    end, selections)
    actions.close(prompt_bufnr)
    builtin.live_grep({
        search_dirs = paths,
    })
end

custom_actions.grep_to_files_action = function(prompt_bufnr)
    local action_state = require("telescope.actions.state")
    local current_picker = action_state.get_current_picker(prompt_bufnr)
    local selections = {}
    local from_entry = require("telescope.from_entry")
    for entry in current_picker.manager:iter() do
        if string.len(entry.path) > 0 and entry.path ~= "nil" then
            selections[entry.path] = true
        end
    end
    local paths = vim.tbl_map(function(e)
        return e
    end, vim.tbl_keys(selections))
    actions.close(prompt_bufnr)
    builtin.find_files({
        search_dirs = paths,
    })
end

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
        mappings = {
            i = {
                  ["<C-Up>"] = actions.cycle_history_prev,
                  ["<C-Down>"] = actions.cycle_history_next,
                  ["<C-s>"] = custom_actions.files_to_grep_action,
                  ["<C-f>"] = custom_actions.grep_to_files_action,
                  ["?"] = actions.which_key,
            },
            n = {
                  ["n"] = custom_actions.files_grep,
                  ["<C-s>"] = custom_actions.files_to_grep_action,
                  ["<C-f>"] = custom_actions.grep_to_files_action,
            },
        },
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
        file_browser = {
            -- theme = "dropdown",
        },
        live_grep_args = {
            auto_quoting = true,
            mappings = {
                i = {
                  ["<C-k>"] = lga_actions.quote_prompt(),
                }
            }
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



function M.files_grep()
    builtin.find_files({
      attach_mappings = function(prompt_bufnr)
        local actions = require("telescope.actions")
        local action_state = require("telescope.actions.state")
        actions.select_default:replace(function()
          local current_picker = action_state.get_current_picker(prompt_bufnr)
          local selections = current_picker:get_multi_selection()
          -- if no multi-selection, leverage current selection
          if vim.tbl_isempty(selections) then
            table.insert(selections, action_state.get_selected_entry())
          end
          local paths = vim.tbl_map(function(e)
            return e.path
          end, selections)
          actions.close(prompt_bufnr)
          builtin.live_grep({
            search_dirs = paths,
          })
        end)
        -- true: attach default mappings; false: don't attach default mappings
        return true
      end,
    })
end


return M
