require'nvim-treesitter.configs'.setup {
   auto_install = true,

   -- Build-in module
   highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
   },
   incremental_selection = {
      enable = true,
      keymaps = {
         init_selection = "gnn",
         node_incremental = "grw",
         scope_incremental = "grc",
         node_decremental = "grm",
      },
   },
   indent = {
      enable = true
   },
   -- External modules
   autotag = {
      enable = true,
      enable_rename = true,
      enable_close = true,
      enable_close_on_slash = true,
   },
   endwise = {
      enable = true,
   }
}
