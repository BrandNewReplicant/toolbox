vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.autowrite = true
vim.opt.hidden = true
vim.opt.hlsearch = false
vim.opt.termguicolors = false
vim.opt.wrap = true
vim.opt.pumheight = 10
vim.opt.showtabline = 2
vim.opt.laststatus = 2
vim.opt.showmode = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.completeopt = "menu,menuone,noselect,popup"
vim.opt.syntax = on
vim.opt.omnifunc = "v:lua.vim.lsp.omnifunc"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorcolumn = true
vim.opt.cursorline = true
vim.opt.list = false
vim.opt.colorcolumn = "80"
vim.o.listchars = "space:·,eol:$,tab:>-,trail:·"

vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 0

vim.g.editorconfig = false

vim.bo.smartindent = false
vim.bo.cindent = true
vim.bo.expandtab = true
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.autoindent = true

vim.api.nvim_set_keymap("i", "(", "()<Left>", { noremap = true })
vim.api.nvim_set_keymap("i", "{", "{}<Left>", { noremap = true })
vim.api.nvim_set_keymap("i", "[", "[]<Left>", { noremap = true })
vim.api.nvim_set_keymap("i", '"', '""<Left>', { noremap = true })
vim.api.nvim_set_keymap("i", "'", "''<Left>", { noremap = true })
vim.api.nvim_set_keymap("i", "`", "``<Left>", { noremap = true })
vim.api.nvim_set_keymap("i", "<", "<><Left>", { noremap = true })
vim.api.nvim_set_keymap("i", "/*", "/**/<Left><Left>", { noremap = true })

vim.diagnostic.enable = true
vim.diagnostic.config({
  virtual_lines = true,
})

vim.lsp.config("*", {
	capabilities = {
		textDocument = {
			semanticTokens = {
				multilineTokenSupport = true,
			},
		},
	},
})

vim.lsp.config("ruff", {
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

vim.lsp.config("gopls", {
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

vim.lsp.config("clangd", {
	cmd = { "clangd", "--background-index" },
})

vim.lsp.enable("clangd")

vim.lsp.config("bashls", {
	on_attach = on_attach,
	filetypes = { "sh", "bash" },
})

vim.lsp.enable("bashls")
