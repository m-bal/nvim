local vim = vim
local i = require("custom.statusline.private_icons")
local u = require("custom.statusline.private_utils")

local M = {}

local num = {
    "❶",
    "❷",
    "❸",
    "❹",
    "❺",
    "❻",
    "❼",
    "❽",
    "❾",
    "❿",
    "⓫",
    "⓬",
    "⓭",
    "⓮",
    "⓯",
    "⓰",
    "⓱",
    "⓲",
    "⓳",
    "⓴"
}

function M.get_mode()
    local mode = {
        c      = {i.mode.c, 'purple'},
        ce     = {i.mode.c, 'purple'},
        cv     = {i.mode.c, 'purple'},
        i      = {i.mode.i, 'purple'},
        ic     = {i.mode.i, 'purple'},
        n      = {i.mode.n, 'purple'},
        no     = {i.mode.n, 'purple'},
        r      = {i.mode.r, 'purple'},
        rm     = {i.mode.r, 'purple'},
        R      = {i.mode.r, 'purple'},
        Rv     = {i.mode.r, 'purple'},
        s      = {i.mode.s, 'purple'},
        S      = {i.mode.s, 'purple'},
        t      = {i.mode.t, 'purple'},
        V      = {i.mode.v, 'purple'},
        v      = {i.mode.v, 'purple'},
        ["r?"] = {i.mode.r, 'purple'},
        [""]  = {"🅢 ", 'purple'},
        [""]  = {" ", 'purple'},
        ["!"]  = {"! ", 'purple'}
    }

    local n = (function()
        if num[vim.fn.bufnr("%")] ~= nil then
            return num[vim.fn.bufnr("%")]
        else
            return vim.fn.bufnr("%")
        end
    end)()

    local vimMode = mode[vim.fn.mode()]
    if mode[vim.fn.mode()] ~= nil then
        u.GalaxyBGB("ViMode", vimMode[2])
        return u.space() .. vimMode[1] .. " "
    else
        u.GalaxyBGB("ViMode", 'error')
        return " ? "
    end

end

function M.seperator()
    local mode_color = {
        c      = 'plum3',
        ce     = 'plum3',
        cv     = 'plum3',
        i      = 'chartreuse3',
        ic     = 'chartreuse3',
        n      = 'DarkGoldenrod2',
        no     = 'DarkGoldenrod2',
        r      = 'chocolate',
        rm     = 'chocolate',
        R      = 'purple',
        Rv     = 'purple',
        s      = 'SkyBlue2',
        S      = 'SkyBlue2',
        t      = 'gray',
        V      = 'gray',
        v      = 'gray',
        ["r?"] = 'chocolate',
        [""]  = 'SkyBlue2',
        [""]  = 'gray',
        ["!"]  = 'plum3'
    }

    local m_color = 'error'
    if mode_color[vim.fn.mode()] ~= nil then
        m_color = mode_color[vim.fn.mode()]
    end

    if not u.buffer_not_empty() or vim.bo.filetype == 'dashboard' then
        u.GalaxyHi("ViModeSeperator", m_color, 'purple')
    else
        u.GalaxyHi("ViModeSeperator", m_color, 'act1')
    end

    return i.slant.Right
end
return M
