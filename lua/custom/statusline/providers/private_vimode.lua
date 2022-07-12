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
        c      = {i.mode.c, 'blue'},
        ce     = {i.mode.c, 'blue'},
        cv     = {i.mode.c, 'blue'},
        i      = {i.mode.i, 'blue'},
        ic     = {i.mode.i, 'blue'},
        n      = {i.mode.n, 'blue'},
        no     = {i.mode.n, 'blue'},
        r      = {i.mode.r, 'blue'},
        rm     = {i.mode.r, 'blue'},
        R      = {i.mode.r, 'blue'},
        Rv     = {i.mode.r, 'blue'},
        s      = {i.mode.s, 'blue'},
        S      = {i.mode.s, 'blue'},
        t      = {i.mode.t, 'blue'},
        V      = {i.mode.v, 'blue'},
        v      = {i.mode.v, 'blue'},
        ["r?"] = {i.mode.r, 'blue'},
        [""]  = {"🅢 ", 'blue'},
        [""]  = {" ", 'blue'},
        ["!"]  = {"! ", 'blue'}
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
        c      = 'blue',
        ce     = 'blue',
        cv     = 'blue',
        i      = 'blue',
        ic     = 'blue',
        n      = 'blue',
        no     = 'blue',
        r      = 'blue',
        rm     = 'blue',
        R      = 'blue',
        Rv     = 'blue',
        s      = 'blue',
        S      = 'blue',
        t      = 'blue',
        V      = 'blue',
        v      = 'blue',
        ["r?"] = 'blue',
        [""]  = 'blue',
        [""]  = 'blue',
        ["!"]  = 'blue'
    }

    local m_color = 'error'
    if mode_color[vim.fn.mode()] ~= nil then
        m_color = mode_color[vim.fn.mode()]
    end

    if not u.buffer_not_empty() or vim.bo.filetype == 'dashboard' then
        u.GalaxyHi("ViModeSeperator", m_color, 'blue')
    else
        u.GalaxyHi("ViModeSeperator", m_color, 'blue')
    end

    return i.slant.tri
end
return M
