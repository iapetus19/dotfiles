return {
	"stevearc/aerial.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("aerial").setup({
			backends = { "treesitter", "lsp", "markdown", "asciidoc", "man" },
			layout = {
				max_width = { 40, 0.2 },
				width = nil,
				min_width = 30,
			},
		}) -- Initialize aerial.nvim
		vim.keymap.set("n", "<leader>co", "<cmd>AerialOpen<CR>")
		vim.keymap.set("n", "<leader>cc", "<cmd>AerialCloseAll<CR>")
	end,
}
