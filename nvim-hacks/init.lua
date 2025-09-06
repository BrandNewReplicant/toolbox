-- FILE | BUFFER | COMMAND
vim.opt.showcmd = true
vim.opt.autowrite = true
vim.opt.hidden = true
vim.opt.confirm = true
vim.opt.undofile = true

-- SEARCH
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- VISUAL
vim.opt.termguicolors = false
vim.opt.textwidth = 80
vim.opt.linebreak = true
vim.opt.showmatch = true
vim.opt.wrap = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.pumheight = 10
vim.opt.showmode = true
vim.opt.showtabline = 2
vim.opt.laststatus = 2

-- LINE NUMBERS & CURSOR LOCATION
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorcolumn = true
vim.opt.cursorline = true
vim.opt.colorcolumn = "80"

-- COMPLETION
-- vim.opt.syntax = on
vim.opt.completeopt = "menu,menuone,noselect,popup,fuzzy"
vim.opt.omnifunc = "v:lua.vim.lsp.omnifunc"
vim.bo.omnifunc = 'v:lua.vim.treesitter.query.omnifunc'

-- LIST CHARACTERS 
vim.opt.list = false
vim.opt.listchars = {
  space = '·',
  eol = '$',
  tab= '>-',
  trail= '·'
}

-- FOLDING
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- FILE TREE
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 0

-- INDENT
vim.g.editorconfig = false
vim.bo.smartindent = false
vim.bo.autoindent = true
vim.bo.cindent = true
vim.bo.expandtab = true
vim.bo.tabstop = 2
vim.bo.shiftwidth = 0

-- FONT 
vim.cmd [[highlight Comment cterm=italic gui=italic]]

-- SPELLING
vim.opt.spell = true
vim.opt.spelllang = { "en", "ru", "de" }

-- SIMPLE COMPLETION 
-- TODO: with tree-sitter
vim.api.nvim_set_keymap("i", "(", "()<Left>", { noremap = true })
vim.api.nvim_set_keymap("i", "{", "{}<Left>", { noremap = true })
vim.api.nvim_set_keymap("i", "[", "[]<Left>", { noremap = true })
vim.api.nvim_set_keymap("i", '"', '""<Left>', { noremap = true })
vim.api.nvim_set_keymap("i", "'", "''<Left>", { noremap = true })
vim.api.nvim_set_keymap("i", "`", "``<Left>", { noremap = true })
vim.api.nvim_set_keymap("i", "<", "<><Left>", { noremap = true })
vim.api.nvim_set_keymap("i", "/*", "/**/<Left><Left>", { noremap = true })

-- DIAGNOSTICS
vim.opt.signcolumn = "yes"
vim.diagnostic.enable = true
vim.diagnostic.config({
  virtual_lines = true,
})

-- LANGUAGE SERVERS
vim.lsp.config("*", {
  capabilities = {
    textDocument = {
      semanticTokens = {
        multilineTokenSupport = true,
      },
    },
  },
})

-- PYTHON
vim.lsp.config("ruff", {
  cmd = { 'ruff', 'server' },
  filetypes = { 'python' },
  init_options = {
    settings = {
      lineLength = 80,
      organizeImports = true,
      showSyntaxErrors = true,
      configurationPreference = "editorOnly",
      codeAction = {
        disableRuleComment = {
          enable = true,
        },
        fixViolation = {
          enable = true,
        },
      },
      lint = {
        enable = true,
        preview = true,
      },
      format = {
        preview = true,
      },
    },
  },
})

vim.lsp.enable("ruff")

-- GO
vim.lsp.config("gopls", {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
})

vim.lsp.enable("gopls")

-- C/C++
vim.lsp.config("clangd", {
  filetypes = { 'c', 'cpp', 'cuda' },
  cmd = { 
    "clangd", 
    "--background-index",
    "--clang-tidy",
  },
})

vim.lsp.enable("clangd")

-- SHELL
vim.lsp.config("bashls", {
  cmd = { 'bash-language-server', 'start' },
  filetypes = { 'bash', 'sh' },
  on_attach = on_attach
})

vim.lsp.enable("bashls")

-- TREE-SITTER
vim.treesitter.language.register('bash', { 'sh', 'zsh' })
vim.treesitter.language.register('c', { 'cpp', 'c++' })

vim.api.nvim_create_autocmd("FileType", {
  callback = function(ev)
    pcall(vim.treesitter.start, ev.buf)
  end
})
