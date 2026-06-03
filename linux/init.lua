vim.opt.autowrite = true
vim.opt.confirm = true
vim.opt.undofile = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.opt.clipboard = "unnamedplus"
vim.o.winborder = "rounded"
vim.opt.termguicolors = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showmatch = true
vim.opt.scrolloff = 0
vim.opt.sidescrolloff = 5
vim.opt.pumheight = 5
vim.opt.showtabline = 2
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = false
vim.opt.syntax = on
vim.opt.completeopt = {
	"fuzzy",
	"menu",
	"menuone",
	"preview",
	"popup",
	"noselect",
	"noinsert",
}
vim.bo.omnifunc = "v:lua.vim.treesitter.query.omnifunc"
vim.o.foldenable = true
vim.opt.foldlevel = 99
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 0
vim.g.editorconfig = false
vim.bo.autoindent = true
vim.bo.cindent = true
vim.g.smarttab = true
vim.opt.expandtab = true
vim.opt.tabstop = 8
vim.opt.softtabstop = 8
vim.opt.shiftwidth = 0
vim.keymap.set("n", "<Space>h", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<Space>j", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<Space>k", "<C-w>k", { noremap = true })
vim.keymap.set("n", "<Space>l", "<C-w>l", { noremap = true })
-- terminal
vim.keymap.set("t", "<C-R>", function()
	local char = vim.fn.nr2char(vim.fn.getchar())
	return "<C-\\><C-N>\"" .. char .. "pi"
end, { noremap = true, expr = true })
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true })
vim.keymap.set(
	"n",
	"<Space>t",
	":10split | startinsert | term<CR>",
	{ noremap = true }
)
vim.keymap.set("n", "<Space>f", ":20Vex<CR>", { noremap = true })
vim.keymap.set("n", "<Space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "grf", function()
	vim.lsp.buf.format()
end)
vim.keymap.set("n", "grk", function()
	vim.lsp.buf.hover()
end)
vim.opt.spell = true
vim.opt.spelllang = { "en", "ru", "de" }
vim.opt.signcolumn = "yes"
vim.diagnostic.enable = true
vim.diagnostic.config({
	severity_sort = true,
	virtual_lines = false,
	virtual_text = false,
	update_in_insert = false,
})
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python3_provider = 0
vim.treesitter.language.register("bash", { "sh", "zsh" })
-- vim.treesitter.language.register("c", { "cpp", "c++", "cuda" })
vim.treesitter.language.register("go", { "gomod", "gowork", "gotmpl" })
vim.api.nvim_create_autocmd("FileType", {
	callback = function(ev)
		pcall(vim.treesitter.start, ev.buf)
	end,
})
vim.api.nvim_set_hl(0, "Comment", { italic = true })
vim.lsp.config["ruff"] = {
	cmd = { "ruff", "server" },
	filetypes = { "python" },
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
}
vim.lsp.config["gopls"] = {
	root_markers = { "go.mod", "go.sum", "go.work" },
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
				unreachable = true,
				unusedvariable = true,
				shadow = true,
			},
			staticcheck = true,
			gofumpt = true,
			codelenses = {
				generate = true,
				gc_details = true,
				test = true,
				tidy = true,
			},
			symbolScope = "all",
			usePlaceholders = true,
			completeFunctionCalls = true,
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				ignoredError = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
		},
	},
}
vim.lsp.config["clangd"] = {
	-- filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
	filetypes = { "c", "cpp" },
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--suggest-missing-includes",
	},
}
vim.lsp.config["bashls"] = {
	cmd = { "bash-language-server", "start" },
	filetypes = { "bash", "sh" },
	on_attach = on_attach,
}
vim.lsp.config["zls"] = {
	cmd = { "zls" },
	filetypes = { "zig", "zir" },
	root_markers = { "build.zig", "zls.json" },
	workspace_required = false,
}
vim.lsp.config["rust-analyzer"] = {
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	settings = {
		["rust-analyzer"] = {
			diagnostics = {
				enable = true,
			},
			lens = {
				debug = { enable = true },
				enable = true,
				implementations = { enable = true },
				references = {
					adt = { enable = true },
					enumVariant = { enable = true },
					method = { enable = true },
					trait = { enable = true },
				},
				run = { enable = true },
				updateTest = { enable = true },
			},
		},
	},
}
vim.lsp.enable({
	"bashls",
	"gopls",
	"clangd",
	"ruff",
	"zls",
	"rust-analyzer",
})
