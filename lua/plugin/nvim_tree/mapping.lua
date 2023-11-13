-- Global Keymap
vim.keymap.set('n',"<leader>w", function() vim.api.nvim_command(":NvimTreeToggle<CR>") end)

-- Local Keymap
return function(bufnr) 
   local api = require('nvim-tree.api')
   local function opts(desc)
      return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
   end

   -- Default Keymapping
   vim.keymap.set('n', '<C-k>', api.node.show_info_popup,              opts('Node: Info'))
   vim.keymap.set('n', 'h',     api.node.navigate.parent,              opts('Node: To Parent'))
   vim.keymap.set('n', 'L',     api.tree.change_root_to_node,          opts('Node: Change directory'))
   vim.keymap.set('n', '<BS>',  api.node.navigate.parent_close,        opts('Node: Close Directory'))
   vim.keymap.set('n', 'a',     api.fs.create,                         opts('Node: Create'))
   vim.keymap.set('n', 'd',     api.fs.remove,                         opts('Node: Delete'))
   vim.keymap.set('n', 'p',     api.fs.paste,                          opts('Node: Paste'))
   vim.keymap.set('n', 'l',     api.node.open.edit,                    opts('Node: Open'))
   vim.keymap.set('n', '<CR>',  api.node.open.edit,                    opts('Node: Open'))
   vim.keymap.set('n', '<Tab>', api.node.open.preview,                 opts('Node: Preview'))

   vim.keymap.set('n', 'E',     api.tree.expand_all,                   opts('Tree: Expand All'))
   vim.keymap.set('n', 'W',     api.tree.collapse_all,                 opts('Tree: Collapse'))
   vim.keymap.set('n', 'q',     api.tree.close,                        opts('Tree: Close'))

   vim.keymap.set('n', 'c',     api.fs.copy.node,                      opts('Copy: Node'))
   vim.keymap.set('n', 'x',     api.fs.cut,                            opts('Copy: Cut'))
   vim.keymap.set('n', 'gy',    api.fs.copy.absolute_path,             opts('Copy: Absolute Path'))
   vim.keymap.set('n', 'y',     api.fs.copy.filename,                  opts('Copy: Name'))
   vim.keymap.set('n', 'Y',     api.fs.copy.relative_path,             opts('Copy: Relative Path'))

   vim.keymap.set('n', '<C-r>', api.fs.rename_sub,                     opts('Rename: Omit'))
   vim.keymap.set('n', 'r',     api.fs.rename,                         opts('Rename: Fullname'))
   vim.keymap.set('n', 'R',     api.fs.rename_basename,                opts('Rename: Basename'))

   vim.keymap.set('n', 'F',     api.live_filter.clear,                 opts('Unfilter'))
   vim.keymap.set('n', 'f',     api.live_filter.start,                 opts('Filter'))

   vim.keymap.set('n', 'B',     api.tree.toggle_no_buffer_filter,      opts('Hide: No Buffer'))
   vim.keymap.set('n', 'H',     api.tree.toggle_hidden_filter,         opts('Hide: Dotfiles'))

   vim.keymap.set('n', 'g?',    api.tree.toggle_help,                  opts('Help'))
end
