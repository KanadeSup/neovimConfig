local bufferline = require('bufferline')
bufferline.setup {
   options = {
      style_preset = {
         bufferline.style_preset.minimal,
         bufferline.style_preset.no_italic,
      },
      indicator = {
         style = 'none'
      },
      modified_icon = '',
      buffer_close_icon = '',
      name_formatter = function(buf)
         return string.match(buf["name"], "(.+)%..+$")
      end,
      offsets = {
         {
            filetype = "NvimTree",
            text = "",
            highlight = "Directory",
            text_align = "center",
         }
      },
   },
}
vim.cmd([[
autocmd BufAdd * if len(getbufinfo({'buflisted':1}))  > 1 | set showtabline=2
autocmd BufDelete * if len(getbufinfo({'buflisted':1})) -1 < 2 | set showtabline=1
]])
