local ls = {
   "lua_ls"
}
local setting_path = "plugin/lsp/ls_setting/"
local lspconfig = require('lspconfig')
for _, v in pairs(ls) do
   lspconfig[v].setup ({
      settings = require(setting_path .. v),
   })
end
lspconfig["tailwindcss"].setup({})
lspconfig["tsserver"].setup({})
lspconfig["pyright"].setup({})
lspconfig["csharp_ls"].setup({})
