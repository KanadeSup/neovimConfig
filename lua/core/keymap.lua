local map = function(mode, key, action, opts)
   if opts == nil then
      opts = { noremap = true, silent = true }
   end
   vim.keymap.set(mode,key,action,opts)
end

-- Remap Leaderkey
vim.g.mapleader=' '
vim.g.maplocalleader=' '

---------------------------------
--         Insert mode         --
---------------------------------
map("i", "jj", "<ESC>")
map("i", "<C-s>", "<ESC>:w!<CR>")

-- Word deletion
map("i", "<C-H>", "<C-w>")

-- Movement
map("i", "<A-h>", "<Left>")
map("i", "<A-l>", "<Right>")
map("i", "<A-j>", "<Down>")
map("i", "<A-k>", "<Up>")
map("i", "<C-A>", "<ESC>_i")

-- Window movement
map("i", "<C-j>", "<ESC><C-w>j")

--------------------------------
--        Normal mode         --
--------------------------------
-- Save and close
map("n", "<C-s>", ":w!<CR>")
map("n", "qw", ":wq<CR>")
map("n", "qq", ":q<CR>")

-- Index style change
map("n", "<leader>n", 
   function()
      vim.opt["relativenumber"] = ( vim.opt["relativenumber"]["_value"] == false)
   end
)

-- Search
map("n", "<ESC>", ":nohl<CR>")
map("n", "#", "*")
map("n", "@", "#")

-- Identing 
map("n", "<Tab>", ">>")
map("n", "<S-Tab>", "<<")

-- Formatting
map("n", "<A-j>", ":m .+1<CR>==")
map("n", "<A-k>", ":m .-2<CR>==")

-- Better Copy and paste
map("n", "p", "pv`]=<ESC>")

-- New line
map("n", "O", "0i<CR><ESC>ki")

-- Clear prompt
map("n", "<A-l>", ":<BS>", { silent = false })

-- Buffer
map("n", "<S-h>", ":bprev<CR>")
map("n", "<S-l>", ":bnext<CR>")
map("n", "<C-w>", ":bdelete<CR>", {  silent = true })

-- Window Resize
map("n", "<C-Up>", ":resize +2<CR>")
map("n", "<C-Down>", ":resize -2<CR>")
map("n", "<C-Right>", ":vertical-resize -2<CR>")
map("n", "<C-Left>", ":vertical-resize +2<CR>")

-- Window movement
local function win_move(key)
   local opposite_key = { j = "k", k = "j", h = "l", l = "h", }
   return function()
      local current  = vim.fn.win_getid()
      vim.api.nvim_command("wincmd " .. key)
      local next = vim.fn.win_getid()

      if(current == next) then
         vim.api.nvim_command("wincmd 99" .. opposite_key[key])
      end
   end
end
vim.keymap.set("n", "<C-h>", win_move('h'))
vim.keymap.set("n", "<C-l>", win_move('l'))
vim.keymap.set("n", "<C-j>", win_move('j'))
vim.keymap.set("n", "<C-k>", win_move('k'))

--------------------------------
--         Visual mode        -- 
--------------------------------
map("v", "<Tab>",">gv")
map("v", "<S-Tab>","<gv")
map("v", "=","=gv")
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")

--------------------------------
--         Command mode       -- 
--------------------------------
-- history
map("c", "<C-j>", "<C-p>", {silent = false})
map("c", "<C-k>", "<C-n>", {silent = false})

-- Movement
map("c", "<A-h>", "<Left>" , {silent = false})
map("c", "<A-l>", "<Right>", {silent = false})
map("c", "<A-j>", "<Down>" , {silent = false})
map("c", "<A-k>", "<Up>"   , {silent = false})
map("c", "<C-a>", "<C-b>"  , {silent = false})
