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
vim.o.listchars = "space:·,eol:$,tab:>-,trail:·,extends:>,precedes:<"

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

local lspconfig = require("lspconfig")

-- Shell
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "sh", "bash", "dash" },
	callback = function()
		vim.lsp.start({
			name = "bash-language-server",
			cmd = { "bash-language-server", "start" },
		})
	end,
})

-- Python
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "py", "ipynb" },
	callback = function()
		vim.bo.shiftwidth = 4
		vim.opt.colorcolumn = "88"
	end,
	lspconfig.ruff.setup({}),
})

-- Go
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "go", "go.mod" },
	callback = function()
		vim.bo.expandtab = false
	end,
	lspconfig.gopls.setup({}),
})

-- C
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "cpp", "c++", "h", "hpp", "h++" },
	callback = function()
		vim.bo.expandtab = false
		vim.opt.colorcolumn = "80"
	end,
	lspconfig.clangd.setup({}),
})
