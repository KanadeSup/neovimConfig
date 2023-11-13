-- Keymap
vim.keymap.set("n", "<leader>s", function() vim.cmd(":lua require('tsht').nodes()") end, {silent = true})
-- hint key
require("tsht").config.hint_keys = { "h", "j", "f", "d", "n", "v", "s", "l", "a" }
