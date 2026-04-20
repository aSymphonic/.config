vim.g.mapleader = " "

vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
vim.keymap.set("n", "<leader>aa", "<cmd>Floaterminal<CR>")

-- Indentation settings
vim.opt.expandtab = true -- Converts tabs to spaces
vim.opt.shiftwidth = 4 -- Number of spaces for each step of (auto)indent
vim.opt.tabstop = 4 -- Number of spaces that a <Tab> in the file counts for
vim.opt.softtabstop = 4 -- Number of spaces that a <Tab> counts for while editing
vim.opt.smartindent = true -- Makes indenting "smart" (e.g., adds indent after a brace)

-- Visuals
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "no"

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "java" },
	callback = function()
		vim.treesitter.start()
	end,
})

-- File Tree
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3 -- Tree view
vim.g.netrw_winsize = 15
vim.g.netrw_browse_split = 4
vim.keymap.set("n", "<leader>e", "<cmd>Lexplore<CR>", { desc = "Toggle Explorer" })

-- LSP Keybindings (Go to Definition, etc.)
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)

		-- DISABLING SEMANTIC TOKENS:
		-- This stops the LSP from overriding Treesitter's fast highlighting
		if client then
			client.server_capabilities.semanticTokensProvider = nil
		end

		local opts = { buffer = ev.buf }

		-- The Big Four
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- Go to Definition
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts) -- Show References
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- Hover Documentation
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- Smart Rename
--

		-- Extra Java Goodies
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts) -- Go to Implementation
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- Quick Fix / Import

		vim.keymap.set("n", "<leader>cf", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})

-- Quality of Life

-- 1. Enable undofiles
vim.opt.undofile = true

-- 2. Set a dedicated directory in nvim's data folder
local undodir = vim.fn.stdpath("data") .. "/undo"
if vim.fn.isdirectory(undodir) == 0 then
    vim.fn.mkdir(undodir, "p", 0700)
end
vim.opt.undodir = undodir

-- 3. Ensure levels are high and buffer-local doesn't glitch
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000

-- Map <Esc> to clear highlights and also close the floating cmd box
vim.keymap.set("n", "<Esc>", "<cmd>noh<cr><esc>", { silent = true })

vim.diagnostic.config({
  virtual_text = {
    spacing = 4,
    prefix = "●", -- You can use "󰅚 " if you have a Nerd Font
    source = "if_many", -- Only show the source (e.g., "jdtls") if there are multiple
  },
})

-- Set delay to 250ms (default is 4000)
vim.opt.updatetime = 250
