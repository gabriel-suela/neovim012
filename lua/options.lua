vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.number = true
vim.o.relativenumber = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = "yes"
vim.o.confirm = true
vim.o.swapfile = false
vim.o.ttimeoutlen = 1
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.clipboard = "unnamedplus"

vim.cmd("syntax off")

vim.diagnostic.config({
	severity_sort = true,
	update_in_insert = false,
	float = { source = "if_many" },
	jump = {
		on_jump = function(diagnostic)
			if diagnostic then
				vim.diagnostic.open_float({ focus = false })
			end
		end,
	},
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		vim.o.signcolumn = "yes:1"
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if client:supports_method("textDocument/completion") then
			vim.o.complete = "o,.,w,b,u"
			vim.o.completeopt = "menu,menuone,popup,noinsert"
			vim.lsp.completion.enable(true, client.id, args.buf)
		end
	end,
})
