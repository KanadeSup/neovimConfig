local keymap = require("plugin/nvim_cmp/keymap")
local cmp = require("cmp")
local cmp_kinds = {
   Text = '  ',
   Method = '  ',
   Function = ' 󰊕 ',
   Constructor = " ",
   Field = '  ',
   Variable = '  ',
   Class = '  ',
   Interface = '  ',
   Module = ' 󰏗 ',
   Property = '  ',
   Unit = ' 󰑭 ',
   Value = ' 󰎠 ',
   Enum = '  ',
   Keyword = '  ',
   Snippet = '  ',
   Color = '  ',
   File = '  ',
   Reference = '  ',
   Folder = '  ',
   EnumMember = ' 󱖫 ',
   Constant = ' 󰏿 ',
   Struct = " 󰙅",
   Event = '  ',
   Operator = ' 󰆕 ',
   TypeParameter = '  ',
}

cmp.setup({
   sources = cmp.config.sources(
      {
         { name = 'nvim_lsp_signature_help' }
      },
      {
         { name = 'luasnip' },
         { name = 'nvim_lsp' },
         { name = 'path',    option = { trailing_slash = true } },
      }
   ),
   enabled = function()
      local context = require 'cmp.config.context'
      if vim.api.nvim_get_mode().mode == 'c' then
         return true
      else
         return not context.in_treesitter_capture("comment")
             and not context.in_syntax_group("Comment")
      end
   end,
   formatting = {
      expandable_indicator = false,
      fields = { "abbr", "kind" },
      format = function(entry, vim_item)
         vim_item.abbr = vim_item.abbr:sub(1, 20)
         vim_item.kind = cmp_kinds[vim_item.kind]
         return vim_item
      end
   },
   mapping = keymap,
   snippet = {
      expand = function(args)
         require('luasnip').lsp_expand(args.body)
      end,
   },
   view = { entries = "custom", },
   window = {
      completion = {
         border = "rounded",
         scrolloff = 3,
         col_offset = -1,
         side_padding = 1,
         scrollbar = false,
      },
      documentation = {
         border = "rounded",
         scrolloff = 3,
         col_offset = -1,
         side_padding = 1,
         scrollbar = false,
      }
   },
   experimental = { ghost_text = true, }
})

cmp.setup.cmdline(':', {
   mapping = cmp.mapping.preset.cmdline(),
   sources = cmp.config.sources(
      {
         { name = 'cmdline' }
      }
   )
})
