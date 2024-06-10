--[[ General settings --]]
vim.o.showcmd = true
vim.o.showmatch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.autowrite = true
vim.o.hidden = true
vim.o.mouse = 'a'
vim.o.hlsearch = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.bo.smartindent = true
vim.bo.cindent = true
vim.bo.expandtab = true
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.wo.cursorcolumn = true
vim.wo.cursorline = true
vim.bo.omnifunc = 'syntaxcomplete#Complete'
vim.bo.autoindent = true
vim.wo.list = true
--[[ IDE-like symbols --]]
vim.o.listchars = 'space:·,eol:$,tab:>-,trail:·,extends:>,precedes:<'
--[[ LSPs 
require('lsp_config') --]]

