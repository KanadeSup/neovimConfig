local mapping = require("plugin/nvim_tree/mapping")

-- Dynamic configuration
local exclude_filter = {}
local special_files = {
   "Cargo.toml", "Makefile", "README.md", "readme.md", 
   ".gitignore", "package.json",
}

-- Configuration
require("nvim-tree").setup({
   filters = {
      dotfiles = true,
      git_ignored = false,
      exclude = exclude_filter
   },
   renderer = {
      icons = {
         glyphs = {
            folder = {
               default = "",
               open = "",
               empty = "",
               empty_open = ""
            }
         },
      },
      special_files = special_files,
      root_folder_label = ":t",
   },
   actions = {
      open_file = {
         quit_on_open = true,
      }
   },
   hijack_cursor = false,
   diagnostics = {
      enable = true,
      debounce_delay = 1000,
      show_on_dirs = true,
      severity = {
         min = vim.diagnostic.severity.WARN,
      }
   },
   update_focused_file = {
      enable = true,
   },
   sort = {
      sorter = "filetype"
   },
   view = {
      width = 30,
   },
   on_attach = mapping,
})
