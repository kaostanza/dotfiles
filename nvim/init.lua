local vim = vim
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.g.mapleader = ' '
vim.o.winborder = 'rounded'
vim.o.expandtab = true
vim.o.splitbelow = true
vim.o.cindent = true
vim.o.cinoptions = "(0"

vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')

vim.keymap.set({ 'n', 'v', 'x' }, '<leader>y', '"+y<CR>')
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>d', '"+d<CR>')

vim.keymap.set({'n'}, '<leader>th', ':split | terminal<CR>')
vim.keymap.set({'n'}, '<leader>tv', ':vsplit | terminal<CR>')
vim.keymap.set({'t'}, '<Esc>', [[<C-\><C-n>]])

vim.keymap.set('n', '<leader>g', '<cmd>lua vim.lsp.buf.format({async = true})<CR>')

-- Pour pouvoir valider l'autocomplete avec TAB
-- vim.keymap.del("i", "<Tab>")

vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim"           },
    { src = "https://github.com/leojimenezg/minimal-madness-nvim"},
	{ src = "https://github.com/nvim-telescope/telescope.nvim"},
	{ src = "https://github.com/nvim-lua/plenary.nvim"        },
	{ src = "https://github.com/stevearc/oil.nvim"            },
	{ src = "https://github.com/echasnovski/mini.pick"        },
	{ src = "https://github.com/neovim/nvim-lspconfig"        },
	{ src = "https://github.com/saghen/blink.cmp"             },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons"  },
	{ src = "https://github.com/mbbill/undotree"              },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = "https://github.com/MrcJkb/haskell-tools.nvim"    }, 
	{ src = "https://github.com/rebelot/kanagawa.nvim"        },
})

require "mini.pick".setup()
require "oil".setup({
	columns = {
		"icon",
		"filename",
	},
})
require "blink.cmp".setup({
	keymap = { preset = "super-tab" },
	appearance = {
		nerd_font_variant = "mono",
	},
	sources = {
		default = { "lsp", "buffer", "path", "snippets" },
	},
	fuzzy = { implementation = "lua" },
})

vim.lsp.enable({ "lua_ls", "clangd", "gopls", "rust_analyzer", "tinymist" , "zls"})
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>f', ':Pick files<CR>')
vim.keymap.set('n', '<leader>h', ':Pick help<CR>')

vim.keymap.set('n', '<leader>e', ':Oil<CR>')

vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep)


vim.cmd("colorscheme kanagawa")
vim.cmd(":hi statusline guibg=NONE")

vim.o.updatetime = 250
vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float(nil,
			{ focusable = false, close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" } })
	end,
})
