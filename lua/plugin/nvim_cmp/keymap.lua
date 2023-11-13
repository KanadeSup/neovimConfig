local cmp = require("cmp")
local luasnip = require('luasnip')
return {
   -- Docs movement
   ['<C-k>'] = cmp.mapping.scroll_docs(-2),
   ['<C-j>'] = cmp.mapping.scroll_docs(2),

   -- Super tab
   ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
         cmp.select_prev_item({behavior = cmp.SelectBehavior.Select, count = 1})
      elseif luasnip.jumpable(-1) then
         luasnip.jump(-1)
      else
         fallback()
      end
   end,
   ['<Tab>'] = function(fallback) 
      if not cmp.visible() then
         if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
         else
            fallback()
         end
         return
      end
      if #cmp.get_entries() == 1 then
         cmp.confirm({ select = true })
         return
      end
      cmp.select_next_item({behavior = cmp.SelectBehavior.Select, count = 1})
   end,

   -- Completion action
   ['<C-c>'] = cmp.mapping.abort(),
   ['<CR>'] = cmp.mapping.confirm({ select = true }),
   ['jj'] = function(fallback)
      if cmp.visible() and  cmp.get_active_entry() then
         cmp.confirm({ select = true })
         return
      end
      fallback()
   end,

   -- Fix Path auto completion
   ['<BS>'] = function(fallback)
      if not cmp.visible() then
         fallback()
         return
      end
      if cmp.get_entries()[1]['source']['name'] ~= 'path' then
         fallback()
         return
      end
      local precede_char = vim.fn.getline('.'):sub(1,vim.fn.col('.')-2):sub(-1,-1)
      if precede_char == " " or precede_char == "\t" or precede_char == ""  then
         cmp.abort()
         local keycode = vim.api.nvim_replace_termcodes("<ESC>a", true, true, true)
         vim.api.nvim_feedkeys(keycode,"n",false)
      end
      fallback()
   end,
}
