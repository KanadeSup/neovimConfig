local api = require("nvim-tree.api")
local Event = api.events.Event

-- Remove cursor
api.events.subscribe(Event.TreeOpen, function()
   vim.api.nvim_command("hi Cursor guifg=black guibg=black")
   vim.opt.guicursor = "n:ver25-Cursor/lCursor,c-i-ci-ve:ver25,r-cr-o:hor20"
end)

api.events.subscribe(Event.TreeClose, function()
   vim.opt.guicursor = "n-v-sm:block,c-i-ci-ve:ver25,r-cr-o:hor20"
end)
