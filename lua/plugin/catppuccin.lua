require("catppuccin").setup{
   custom_highlights = function(colors)
      return {
         NvimTreeNormal = { bg = colors.base},
         NvimTreeWinSeparator = { fg = colors.mantle, style = {'bold'}},
      }
   end,

   flavour = "mocha", 
   transparent_background = false, 
   show_end_of_buffer = false, 
   term_colors = true, -- ???
   dim_inactive = {
      enabled = false,
      shade = "dark",
      percentage = 0.15,
   },
   no_italic = false,
   no_bold = false,
   no_underline = false,
   styles = {
      comments = { "italic" },
      conditionals = { "italic" },
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
   },
   color_overrides = {},
   integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      treesitter = true,
      notify = false,
      mini = false,
   },
}
vim.cmd.colorscheme "catppuccin-mocha"
