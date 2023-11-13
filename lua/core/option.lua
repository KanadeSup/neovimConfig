local options = {
   termguicolors = true,
   mousemoveevent = true,
   backup = false,
   writebackup = false,
   swapfile = false,
   cmdheight = 1,
   fileencoding = "utf-8",
   hlsearch = true,
   ignorecase = true,
   mouse = "a",
   pumheight = 10,
   showmode = false,
   smartcase = true,
   smartindent = false,
   splitbelow = true,
   splitright = true,
   timeoutlen = 1000,
   undofile = true,
   expandtab = true,
   shiftwidth = 3,
   tabstop = 3,
   number = true,
   relativenumber = true,
   numberwidth = 3,
   signcolumn = "yes",
   wrap = false,
   scrolloff = 20,
   sidescrolloff = 20,
   laststatus = 3,
   guicursor="n-v-sm:block,c-i-ci-ve:ver25,r-cr-o:hor20"
}

for k, v in pairs(options) do
   vim.opt[k] = v
end
