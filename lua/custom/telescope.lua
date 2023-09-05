local M = {}
local actions = require("telescope.actions")
local action_utils = require("telescope.actions.utils")
local lga_actions = require("telescope-live-grep-args.actions")
local builtin = require("telescope.builtin")
local transform_mod = require("telescope.actions.mt").transform_mod

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

require("telescope").setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		color_devicons = true,
		prompt_prefix = "🔍 ",
		file_ignore_patterns = { "contrib", "opt/**/*", "node_modules", "%.o", "%.pyc", "__pycache__", "%.git" },

		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		mappings = {
			i = {
				["<C-Up>"] = actions.cycle_history_prev,
				["<C-Down>"] = actions.cycle_history_next,
				["<C-s>"] = custom_actions.files_to_grep_action,
				["<C-f>"] = custom_actions.grep_to_files_action,
				["?"] = actions.which_key,
				-- IMPORTANT
				-- either hot-reloaded or `function(prompt_bufnr) telescope.extensions.hop.hop end`
				["<C-x>"] = require("telescope").extensions.hop.hop, -- hop.hop_toggle_selection
				-- custom hop loop to multi selects and sending selected entries to quickfix list
				-- ["<C-space>"] = function(prompt_bufnr)
				-- 	local opts = {
				-- 		callback = actions.toggle_selection,
				-- 		loop_callback = actions.send_selected_to_qflist,
				-- 	}
				-- 	require("telescope").extensions.hop._hop_loop(prompt_bufnr, opts)
				-- end,
				["<C-H>"] = actions.select_horizontal,
				["<C-h>"] = actions.select_horizontal,
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
				},
			},
		},
		hop = {
			-- the shown `keys` are the defaults, no need to set `keys` if defaults work for you ;)
            --stylua: ignore
              keys = {"a", "s", "d", "f", "g", "h", "j", "k", "l", ";",
                      "q", "w", "e", "r", "t", "y", "u", "i", "o", "p",
                      "A", "S", "D", "F", "G", "H", "J", "K", "L", ":",
                      "Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", },
			-- Highlight groups to link to signs and lines; the below configuration refers to demo
			-- sign_hl typically only defines foreground to possibly be combined with line_hl
			sign_hl = { "WarningMsg", "Title" },
			-- optional, typically a table of two highlight groups that are alternated between
			line_hl = { "CursorLine", "Normal" },
			-- options specific to `hop_loop`
			-- true temporarily disables Telescope selection highlighting
			clear_selection_hl = false,
			-- highlight hopped to entry with telescope selection highlight
			-- note: mutually exclusive with `clear_selection_hl`
			trace_entry = true,
			-- jump to entry where hoop loop was started from
			reset_selection = true,
		},
	},
	pickers = {
		buffers = {
			mappings = {
				i = {
					["<c-d>"] = actions.delete_buffer,
				},
			},
		},
	},
})

require("telescope").load_extension("fzy_native")
require("telescope").load_extension("hop")

local themes = require("telescope.themes")

function M.git_dots()
	local opts = themes.get_dropdown({
		winblend = 20,
		border = true,
		shorten_path = false,
	})
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
