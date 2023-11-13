vim.keymap.set('n','<C-W>',
   function()
      require('bufdelete').bufdelete(0)
   end,
   { noremap = true, silent = true }
)
