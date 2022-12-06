require("plugins")
require("setup")
require("custom.telescope")
require("custom.trouble")
require("custom.snap")
require("lsp")
require("custom.cmp")
require("nvim-treesitter")
require("mappings")
require("custom.statusline.private_init")
require("comments")
require("custom.gitsigns")
-- require("custom.hydra-git")
-- require("custom.hydra-telescope")
-- require("custom.hydra-windows")
-- require('smoothcursor').setup({
--     priority = 1,
--     intervals = 35,
--     speed = 25,
--     type = "default",
--     fancy = {
--         enable = true,
--         body = {
--             { cursor = "", texthl = "SmoothCursorRed" },
--             { cursor = "", texthl = "SmoothCursorOrange" },
--             { cursor = "●", texthl = "SmoothCursorYellow" },
--             { cursor = "●", texthl = "SmoothCursorGreen" },
--             { cursor = "•", texthl = "SmoothCursorAqua" },
--             { cursor = ".", texthl = "SmoothCursorBlue" },
--             { cursor = ".", texthl = "SmoothCursorPurple" },
--         },
--         tail = { cursor = nil, texthl = "SmoothCursor"},
--     }
-- })
--
