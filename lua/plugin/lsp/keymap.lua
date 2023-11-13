-- Dignostics
vim.keymap.set('n', 'gf', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', function()
   vim.diagnostic.goto_prev({ severity = { min = vim.diagnostic.severity.WARN } })
end)
vim.keymap.set('n', ']d', function()
   vim.diagnostic.goto_next({ severity = { min = vim.diagnostic.severity.WARN } })
end)
vim.keymap.set('n', '<space>d', function()
   vim.diagnostic.setloclist({
      severity = { min = vim.diagnostic.severity.WARN }
   })
end
)

-- LSP feature
vim.api.nvim_create_autocmd('LspAttach', {
   callback = function(event)
      local opts = { buffer = event.buf }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.rename, opts)
      vim.keymap.set('n', 'gR', vim.lsp.buf.references, opts)
      vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, opts)
      vim.keymap.set('n', 'gt', vim.lsp.buf.signature_help, opts)
   end,
})
