local gl = require("galaxyline")
local gls = gl.section
local colors = require("galaxyline.theme").default
-- gl.short_line_list = {"LuaTree", "vista", "dbui"}
-- local i = require("plugins.statusline.icons")
-- local c = require("plugins.statusline.colors")
-- local u = require("plugins.statusline.utils")
-- local diagnostic = require("plugins.statusline.providers.diagnostic")
-- local vcs = require("plugins.statusline.providers.vcs")
local fileinfo = require("custom.statusline.providers.private_fileinfo")
-- local extension = require("plugins.statusline.providers.extension")
-- local buffer = require("plugins.statusline.providers.buffer")
-- local vimode = require("plugins.statusline.providers.vimode")
--
-- bufferIcon = buffer.get_buffer_type_icon
-- bufferNumber = buffer.get_buffer_number
-- diagnosticError = diagnostic.get_diagnostic_error
-- diagnosticWarn = diagnostic.get_diagnostic_warn
-- diagnosticInfo = diagnostic.get_diagnostic_info
-- diagnosticEndSpace = diagnostic.end_space
-- diagnosticSeperator = diagnostic.seperator
-- diffAdd = vcs.diff_add
-- diffModified = vcs.diff_modified
-- diffRemove = vcs.diff_remove
-- fileFormat = fileinfo.get_file_format
-- fileEncode = fileinfo.get_file_encode
-- fileSize = fileinfo.get_file_size
-- fileIcon = fileinfo.get_file_icon
fileName = fileinfo.get_current_file_name
gls.left[0] = {
	FileName = {
		provider = fileName,
		highlight = { colors.bg, colors.green },
	},
}

-- fileType = fileinfo.get_file_type
-- fileTypeName = buffer.get_buffer_filetype
-- filetTypeSeperator = fileinfo.filetype_seperator
-- gitBranch = vcs.get_git_branch_formatted
-- gitSeperator = vcs.seperator
-- lineColumn = fileinfo.line_column
-- linePercent = fileinfo.current_line_percent
-- scrollBar = extension.scrollbar_instance
-- space = u.space
-- viMode = vimode.get_mode
-- viModeSeperator = vimode.seperator
--
-- gls.left[1] = {
--     ViMode = {
--         provider = viMode,
--         highlight = {c.Color('act1'), c.Color('DarkGoldenrod2')}
--     }
-- }
--
-- gls.left[2] = {
--     ViModeSeperator = {
--         provider = viModeSeperator,
--         highlight = {c.Color('act1'), c.Color('DarkGoldenrod2')}
--     }
-- }
--
-- gls.left[3] = {
--     FileSize = {
--         provider = fileSize,
--         condition = u.buffer_not_empty,
--         highlight = {c.Color('base'), c.Color('act1')}
--     }
-- }
--
-- gls.left[4] = {
--     FileName = {
--         provider = fileName,
--         condition = u.buffer_not_empty,
--         separator = i.slant.Left,
--         separator_highlight = {c.Color('purple'), c.Color('act1')},
--         highlight = {c.Color('func'), c.Color('act1'), "bold"}
--     }
-- }
--
-- gls.left[5] = {
--     FileType = {
--         provider = fileType,
--         condition = u.buffer_not_empty,
--         highlight = {c.Color('base'), c.Color('purple')}
--     }
-- }
--
-- gls.left[6] = {
--     FiletTypeSeperator = {
--         provider = filetTypeSeperator
--     }
-- }
--
-- gls.left[7] = {
--     DiagnosticError = {
--         provider = diagnosticError,
--         icon = " " .. i.bullet,
--         highlight = {c.Color('error'), c.Color('act1')}
--     }
-- }
--
-- gls.left[8] = {
--     DiagnosticWarn = {
--         provider = diagnosticWarn,
--         icon = " " .. i.bullet,
--         highlight = {c.Color('warning'), c.Color('act1')}
--     }
-- }
--
-- gls.left[9] = {
--     DiagnosticInfo = {
--         provider = diagnosticInfo,
--         icon = " " .. i.bullet,
--         highlight = {c.Color('info'), c.Color('act1')}
--     }
-- }
--
-- gls.left[10] = {
--     DiagnosticEndSpace = {
--         provider = diagnosticEndSpace,
--         highlight = {c.Color('act1'), c.Color('act1')}
--     }
-- }
--
-- gls.left[11] = {
--     DiagnosticSeperator = {
--         provider = diagnosticSeperator,
--         highlight = {c.Color('purple'), c.Color('act1')}
--     }
-- }
--
--
-- gls.left[12] = {
--     GitBranch = {
--         provider = gitBranch,
--         icon = "Git-", --" " .. i.git .. " ",
--         condition = u.buffer_not_empty,
--     }
-- }
--[[
gls.left[13] = {
    DiffAdd = {
        provider = diffAdd,
        condition = u.checkwidth,
        icon = i.diff.Add,
        highlight = {c.Color('green'), c.Color('purple')}
    }
}
gls.left[14] = {
    DiffModified = {
        provider = diffModified,
        condition = u.checkwidth,
        icon = i.diff.Modified,
        highlight = {c.Color('orange'), c.Color('purple')}
    }
}
gls.left[15] = {
    DiffRemove = {
        provider = diffRemove,
        condition = u.checkwidth,
        icon = i.diff.Remove,
        highlight = {c.Color('red'), c.Color('purple')}
    }
}
--]]
-- gls.left[13] = {
-- 	GitSeperator = {
-- 		provider = gitSeperator,
-- 		condition = u.buffer_not_empty,
-- 	},
-- }
--
-- gls.left[14] = {
-- 	Space = {
-- 		provider = space,
-- 		highlight = { c.Color("blue"), c.Color("purple") },
-- 	},
-- }
--
-- gls.right[1] = {
-- 	FileFormat = {
-- 		provider = fileFormat,
-- 		highlight = { c.Color("base"), c.Color("purple") },
-- 	},
-- }
-- gls.right[2] = {
-- 	LineInfo = {
-- 		provider = lineColumn,
-- 		separator = " | ",
-- 		separator_highlight = { c.Color("base"), c.Color("purple") },
-- 		highlight = { c.Color("base"), c.Color("purple") },
-- 	},
-- }
-- gls.right[3] = {
-- 	PerCent = {
-- 		provider = linePercent,
-- 		separator = i.slant.Left,
-- 		separator_highlight = { c.Color("act1"), c.Color("purple") },
-- 		highlight = { c.Color("base"), c.Color("act1") },
-- 	},
-- }
-- gls.right[4] = {
-- 	ScrollBar = {
-- 		provider = scrollBar,
-- 		highlight = { c.Color("yellow"), c.Color("purple") },
-- 	},
-- }
--
-- gls.short_line_left[1] = {
-- 	BufferType = {
-- 		provider = fileTypeName,
-- 		separator = i.slant.Right,
-- 		separator_highlight = { c.Color("purple"), c.Color("bg") },
-- 		highlight = { c.Color("base"), c.Color("purple") },
-- 	},
-- }
--
-- gls.short_line_right[1] = {
-- 	BufferIcon = {
-- 		provider = bufferIcon,
-- 		separator = i.slant.Left,
-- 		separator_highlight = { c.Color("purple"), c.Color("bg") },
-- 		highlight = { c.Color("base"), c.Color("purple") },
-- 	},
-- }
-- local gl = require('galaxyline')
-- local condition = require('galaxyline.condition')
-- local gls = gl.section
-- gl.short_line_list = {'vista','dbui','packer'}

-- gls.left[1] = {
--   RainbowRed = {
--     provider = function() return '  ' end,
--     highlight = {colors.blue,colors.bg}
--   },
-- }
-- gls.left[2] = {
--   ViMode = {
--     provider = function()
--       -- auto change color according the vim mode
--       local mode_color = {n = { colors.red,'  ' }, i = {colors.green,'  '} ,v={colors.blue, '  '},
--                           [''] = {colors.blue, '  '},V={colors.blue, '  '},
--                           c = {colors.magenta, '豈 '},no = {colors.red, '  '},s = {colors.orange, '  '},
--                           S={colors.orange, '  '},[''] = {colors.orange, '  '},
--                           ic = {colors.yellow, '  '},R = {colors.violet, '  '},Rv = {colors.violet, '  '},
--                           cv = {colors.red, '  '},ce={colors.red, ' '}, r = {colors.cyan, '  '},
--                           rm = {colors.cyan, '  '}, ['r?'] = {colors.cyan, '  '},
--                           ['!']  = {colors.red, '  '},t = {colors.orange, '  '}}
--       vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()][1] ..' guibg='..colors.bg)
--       return mode_color[vim.fn.mode()][2]
--     end,
--   },
-- }

-- gls.left[5] = {
--   DiagnosticError = {
--     provider = 'DiagnosticError',
--     icon = '  ',
--     highlight = {colors.red,colors.bg}
--   }
-- }
-- gls.left[6] = {
--   DiagnosticWarn = {
--     provider = 'DiagnosticWarn',
--     icon = '  ',
--     highlight = {colors.yellow,colors.bg},
--   }
-- }

-- gls.left[7] = {
--   DiagnosticHint = {
--     provider = 'DiagnosticHint',
--     icon = '  ',
--     highlight = {colors.cyan,colors.bg},
--   }
-- }

-- gls.left[8] = {
--   DiagnosticInfo = {
--     provider = 'DiagnosticInfo',
--     icon = '  ',
--     highlight = {colors.blue,colors.bg},
--   }
-- }

-- -- gls.mid[1] = {
-- --   ShowLspClient = {
-- --     provider = 'GetLspClient',
-- --     condition = function ()
-- --       local tbl = {['dashboard'] = true,['']=true}
-- --       if tbl[vim.bo.filetype] then
-- --         return false
-- --       end
-- --       return true
-- --     end,
-- --     icon = ' LSP:',
-- --     separator_highlight = {'NONE',colors.black},
-- --     highlight = {colors.yellow,colors.black,'bold'}
-- --   }
-- -- }

-- -- gls.right[1] = {
-- --   GitIcon = {
-- --     provider = function() return '  ' end,
-- --     condition = condition.check_git_workspace,
-- --     separator = ' ',
-- --     separator_highlight = {'NONE',colors.bg},
-- --     highlight = {colors.violet,colors.bg,'bold'},
-- --   }
-- -- }

-- -- gls.right[2] = {
-- --   GitBranch = {
-- --     provider = 'GitBranch',
-- --     condition = condition.check_git_workspace,
-- --     highlight = {colors.violet,colors.bg,'bold'},
-- --   }
-- -- }

-- -- gls.right[3] = {
-- --   DiffAdd = {
-- --     provider = 'DiffAdd',
-- --     condition = condition.hide_in_width,
-- --     icon = '  ',
-- --     highlight = {colors.green,colors.bg},
-- --   }
-- -- }
-- -- gls.right[4] = {
-- --   DiffModified = {
-- --     provider = 'DiffModified',
-- --     condition = condition.hide_in_width,
-- --     icon = ' 柳',
-- --     highlight = {colors.orange,colors.bg},
-- --   }
-- -- }
-- -- gls.right[5] = {
-- --   DiffRemove = {
-- --     provider = 'DiffRemove',
-- --     condition = condition.hide_in_width,
-- --     icon = '  ',
-- --     highlight = {colors.red,colors.bg},
-- --   }
-- -- }

-- -- gls.right[6] = {
-- --   RainbowBlue = {
-- --     provider = function() return '  ' end,
-- --     highlight = {colors.blue,colors.bg}
-- --   },
-- -- }

-- -- gls.short_line_left[1] = {
-- --   BufferType = {
-- --     provider = 'FileTypeName',
-- --     separator = ' ',
-- --     separator_highlight = {'NONE',colors.bg},
-- --     highlight = {colors.blue,colors.bg,'bold'}
-- --   }
-- -- }
-- gls.right[1] = {
--   ShowLspClient = {
--     provider = 'GetLspClient',
--     condition = function ()
--       local tbl = {['dashboard'] = true,['']=true}
--       if tbl[vim.bo.filetype] then
--         return false
--       end
--       return true
--     end,
--     icon = ' :',
--     highlight = {colors.yellow,colors.bg}
--   }
-- }

-- -- gls.short_line_left[2] = {
-- --   SFileName = {
-- --     provider =  'SFileName',
-- --     condition = condition.buffer_not_empty,
-- --     highlight = {colors.fg,colors.bg,'bold'}
-- --   }
-- -- }

-- -- gls.short_line_right[1] = {
-- --   BufferIcon = {
-- --     provider= 'BufferIcon',
-- --     highlight = {colors.fg,colors.bg}
-- --   }
-- -- }
