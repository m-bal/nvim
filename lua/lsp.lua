lsp = require("lspconfig")

local on_attach = function(client, bufnr)
    -- require('cmp_nvim_lsp').on_attach()
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    -- Mappings.
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>CodeActionMenu<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end
vim.api.nvim_command([[command! Format execute 'lua vim.lsp.buf.formatting()']])


local servers = { 'dockerls' }
for _, server in ipairs(servers) do
  lsp[server].setup {
    on_attach = on_attach,
  }
end


lsp.jedi_language_server.setup {
  on_attach = on_attach,
};

-- lsp.clangd.setup {
--     on_attach = on_attach,
--     default_config = {
--         cmd = {
--             "clangd-11", "--background-index --pch-storage=memory",
--             "--clang-tidy", "--suggest-missing-includes",
--             "--query-driver=/usr/bin/g++", "--completion-style=detailed",
--             "--cross-file-rename", "--clang-tidy", "--clang-tidy-checks=bugprone-**",
--         },
--         -- root_dir = "compile_commands.json",
--         filetypes = {"c", "cpp", "objc", "objcpp"},
--     }
-- }

-- ccls works a lot better than clangd with lsp
lsp.ccls.setup {
    init_options = {
        compilationDatabaseDirectory = "";
        index = {
          threads = 5;
        };
        cache = {
            directory = "/home/manvir/.cache/ccls-cache";
        };
    },

    on_attach = on_attach,
    default_config = {
        cmd = {
            "clangd", "--background-index --pch-storage=memory",
            "--clang-tidy", "--suggest-missing-includes",
            "--query-driver=/usr/bin/g++", "--completion-style=detailed",
            "--cross-file-rename", "--clang-tidy", "--clang-tidy-checks=bugprone-**",
        },
        root_dir = "",
        filetypes = {"c", "cpp", "hpp", "objc", "objcpp"},
    }
}

require('nvim-treesitter.configs').setup {
 enabled_installed = "all",
 highlight = {
   enable = true,
 },
 textobjects = {
   select = {
     enable = true,
     keymaps = {
       ["af"] = "@function.outer",
       ["if"] = "@function.inner",
       ["ac"] = "@class.outer",
       ["ic"] = "@class.inner",
     },
   },
 },
}
