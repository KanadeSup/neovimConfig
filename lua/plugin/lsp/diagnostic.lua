local severity = { min = vim.diagnostic.severity.WARN }
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
   vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = { severity = severity },
      virtual_text = false,
      signs = { severity = severity },
      severity_sort = true,
      update_in_insert = true,
   }
)

vim.diagnostic.config({
   float = {
      header = "",
      severity = severity,
      severity_sort = true,
      border = "rounded",
   }
})

-- highlight
vim.cmd("sign define DiagnosticSignError text= texthl=DiagnosticSignError")
vim.cmd("sign define DiagnosticSignWarning text= texthl=DiagnosticSignError")
