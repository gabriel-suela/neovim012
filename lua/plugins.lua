vim.pack.add({
	"https://github.com/D0nw0r/dark2026.nvim",
	"https://github.com/nvim-neo-tree/neo-tree.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/folke/trouble.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.x") },
})

require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.comment").setup()
require("mini.pick").setup()
local statusline = require("mini.statusline")
statusline.setup({
	use_icons = false,
	content = {
		active = function()
			local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
			local git = statusline.section_git({ trunc_width = 40 })
			local filename = statusline.section_filename({ trunc_width = 140 })

			return statusline.combine_groups({
				{ hl = mode_hl, strings = { mode } },
				{ hl = "MiniStatuslineDevinfo", strings = { git } },
				"%=",
				{ hl = "MiniStatuslineFilename", strings = { filename } },
			})
		end,
		inactive = function()
			local filename = statusline.section_filename({ trunc_width = 140 })
			return statusline.combine_groups({
				"%=",
				{ hl = "MiniStatuslineFilename", strings = { filename } },
			})
		end,
	},
})

require("trouble").setup()
local servers = { "lua_ls", "yamlls" }
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = servers,
})
require("blink.cmp").setup()
require("gitsigns").setup({
	current_line_blame = true,
})
require("nvim-treesitter").setup({
	ensure_installed = {
		"yaml",
		"lua",
		"json",
		"dockerfile",
		"python",
		"bash",
		"vim",
		"vimdoc",
	},
	highlight = {
		enable = true,
	},

	indent = {
		enable = true,
	},
})
require("neo-tree").setup({})
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		yaml = { "prettier" },
	},
})

vim.lsp.config("lua_ls", {
	root_markers = {
		"init.lua",
		{ ".emmyrc.json", ".luarc.json", ".luarc.jsonc" },
		{ ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml" },
		{ ".git" },
	},
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		pcall(vim.treesitter.start)
	end,
})

vim.lsp.enable(servers)

vim.cmd.colorscheme("dark2026")
