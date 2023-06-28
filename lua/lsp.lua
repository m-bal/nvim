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
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>cd', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end
vim.api.nvim_command([[command! Format execute 'lua vim.lsp.buf.formatting()']])

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Disable signs
    signs = false,
}
)

local servers = { 'dockerls' }
for _, server in ipairs(servers) do
    lsp[server].setup {
        on_attach = on_attach,
    }
end

lsp.bashls.setup{
    on_attach = on_attach,
    filetypes = {
        "sh", "bats"
    },
    settings = {
        bashIde = {
            globPattern = "*@(.sh|.inc|.bash|.command|.bats)"
        }
    },
}

-- lsp.pylsp.setup {
--     on_attach = on_attach,
--     settings= {
--         pylsp = {
--             plugins = {
--                 flake8 = {
--                     enabled = true
--                 },
--                 pylint = {
--                     enabled = true
--                 },
--                 jedi = {
--                     environemnt = "~/dev3.8/bin/python3.8",
--                     extra_paths = {
--                         "/home/manvir/dev3.8/lib/",
--                     },
--                 },
--                 jedi_completion = {
--                     enabled = true
--                 },
--             }
--         }
--     }
-- };

lsp.pyright.setup {
    on_attach = on_attach,
    settings = {
        venvPath = "/home/manvir/dev3.8",
        executionEnvironments = {
            {
                root = "~",
                venv = "~",
                extraPaths = {
                    "/home/manvir/dev3.8/lib/python3.8/site-packages"
                },
            }
        },
    }
}

lsp.gopls.setup{
    on_attach = on_attach
};

lsp.tailwindcss.setup{
    on_attach = on_attach
};

lsp.tsserver.setup{
    on_attach = on_attach
};

-- ccls works a lot better than clangd with lsp
-- lsp.ccls.setup {
--     init_options = {
--         compilationDatabaseDirectory = "/home/manvir/gitlab/linear-generator/builds/dbg-x86";
--         index = {
--             threads = 10;
--         };
--         cache = {
--             directory = "/home/manvir/.cache/ccls-cache";
--         };
--     },
--
--     on_attach = on_attach,
--     default_config = {
--         cmd = {
--             "clangd", "--background-index --pch-storage=memory",
--             "--clang-tidy", "--suggest-missing-includes",
--             "--query-driver=/usr/bin/g++", "--completion-style=detailed",
--             "--cross-file-rename", "--clang-tidy", "--clang-tidy-checks=bugprone-**",
--         },
--         root_dir = "",
--         filetypes = {"c", "cpp", "hpp"},
--     }
-- }

require('nvim-treesitter.configs').setup {
    enabled_installed = "all",
    highlight = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<CR>',
          scope_incremental = '<CR>',
          node_incremental = '<TAB>',
          node_decremental = '<S-TAB>',
        },
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
require("nvim-treesitter.configs").setup({
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "org" }, -- < This one
    },
    ensure_installed = { "org" },
})

lsp.clangd.setup {
    on_attach = on_attach,
    cmd = {
        "clangd-15", "--background-index", "--pch-storage=memory",
        "--clang-tidy", "--all-scopes-completion=true",
        "--query-driver=/usr/bin/g++", "--completion-style=detailed",
        "--compile-commands-dir=./builds/dbg-x86",
        "--enable-config", "--header-insertion=iwyu", "-j=10"
    },
    root_dir = lsp.util.root_pattern(
          'compile_commands.json',
          'compile_flags.txt',
          'configure.ac',
          '.git'
    ),
    filetypes = {"c", "cpp", "hpp"},
    compilationDatabaseDirectory = "./builds/docker-min-py/"
}

lsp.rust_analyzer.setup {
    on_attach = on_attach,
    settings = {
        ["rust_analyzer"] = {
            assist = {
                importGranularity = "module",
                importPrefix = "self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    }
}
vim.api.nvim_create_autocmd({'BufWritePost', 'FileWritePost'}, {
    pattern = '*.rs',
    command = 'silent! execute "!cargo fmt"| redraw!',
})
