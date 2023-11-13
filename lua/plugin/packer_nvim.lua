-- Auto Sync ---
vim.cmd [[packadd packer.nvim]]
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_nvim.lua source <afile> | PackerSync
  augroup end
]])
--- Configuration ---
local packer = require("packer")
packer.init {
   display = {
      open_fn = function()
         return require("packer.util").float { border = "rounded" }
      end,
   },
}

-- All packages --
return packer.startup(function(use)
   -- Packer itself
   use 'wbthomason/packer.nvim'

   -- ColorScheme
   use { "catppuccin/nvim", as = "catppuccin" }

   -- Nvim-tree
   use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' } }

   -- Treesitter
   use { 'nvim-treesitter/nvim-treesitter' }
   use { 'mfussenegger/nvim-treehopper' }
   use { 'windwp/nvim-ts-autotag' }
   use { 'RRethy/nvim-treesitter-endwise' }

   -- LSP
   use { "williamboman/mason.nvim" }
   use { "neovim/nvim-lspconfig" }

   -- Auto-Completion
   use { 'hrsh7th/nvim-cmp' }
   use { 'hrsh7th/cmp-path' }
   use { 'saadparwaiz1/cmp_luasnip' }
   use { 'hrsh7th/cmp-cmdline' }
   use { 'hrsh7th/cmp-nvim-lsp' }

   -- Snippet
   use({
      "L3MON4D3/LuaSnip",
      tag = "v2.*",
      run = "make install_jsregexp"
   })

   -- Utils
   use { 'numToStr/Comment.nvim' }
   use { 'windwp/nvim-autopairs' }
   use { 'mg979/vim-visual-multi' }
   use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }
   use { 'famiu/bufdelete.nvim' }
   use { 'norcalli/nvim-colorizer.lua' }
end)
