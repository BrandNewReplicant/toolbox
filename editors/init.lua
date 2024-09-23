--[[
General settings
--]]
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
--[[
IDE-like symbols
--]]
vim.o.listchars = 'space:·,eol:$,tab:>-,trail:·,extends:>,precedes:<'
--[[
bash language server
--]]
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'sh',
  callback = function()
    vim.lsp.start({
      name = 'bash-language-server',
      cmd = { 'bash-language-server', 'start' },
    })
  end,
})
--[[
Python (Ruff) language server
--]]
require('lspconfig').ruff_lsp.setup {
  init_options = {
    settings = {
      -- Any extra CLI arguments for `ruff` go here.
      args = {},
    }
  }
}
--[[
Go language server - not tested yet
local lspconfig = require("lspconfig")
lspconfig.gopls.setup({
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
})
--]]

