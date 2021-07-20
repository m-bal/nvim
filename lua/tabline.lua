local M = {}
local fn = vim.fn

M.options = {
    show_index = true,
    show_modify = true,
    no_name = 'None'
}

local function contains(list, val)
    for _, v in pairs(list) do
        if v == val then
            return true
        end
    end
    return false
end

local function tabline(options)
    local s = ''
    index = 0
    for i, buf in pairs(fn.getbufinfo({buflisted = 1})) do

        -- if contains(fn.tabpagebuflist(fn.tabpagenr()), buf.bufnr) then
            if buf.bufnr == fn.bufnr() then
                s = s .. '%#TabLineSel#'
            else
                s = s .. '%#TabLineFill#'
            end
            -- buffer index
            s = s .. ' '
            if options.show_index then
                s = s .. i .. ':'
            end
            -- buf name
            if buf.name ~= '' then
                s = s .. '[' .. fn.fnamemodify(buf.name, ":t") .. '] '
            else
                s = s .. options.no_name .. ' '
            end
            -- modification indicator
            if options.show_modify and buf.changed == 1 then
                s = s .. '[+] '
            end
            index = index + 1
        -- end
    end

    s = s .. '%#TabLineFill#'
    return s
end

function _G.nvim_tabline()
    return tabline(M.options)
end

vim.o.showtabline = 2
vim.o.tabline = "%!v:lua.nvim_tabline()"

vim.g.loaded_nvim_tabline = 1

