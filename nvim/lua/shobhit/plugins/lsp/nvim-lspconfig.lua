return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },

	config = function()
		--------------------------------------------------
		-- Common setup
		--------------------------------------------------
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local on_attach = function(client, bufnr)
			local opts = { buffer = bufnr, silent = true }

			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "<leader>f", function()
				vim.lsp.buf.format({ async = true })
			end, opts)

			-- Ruff formats Python, not basedpyright
			if client.name == "basedpyright" then
				client.server_capabilities.documentFormattingProvider = false
			end
		end

		--------------------------------------------------
		-- Lua
		--------------------------------------------------
		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
					telemetry = { enable = false },
				},
			},
		})

		--------------------------------------------------
		-- Python: basedpyright
		--------------------------------------------------
		vim.lsp.config("basedpyright", {
			settings = {
				basedpyright = {
					analysis = {
						typeCheckingMode = "basic",
						diagnosticMode = "openFilesOnly",

						reportMissingImports = false,
						reportMissingTypeStubs = false,

						reportGeneralTypeIssues = false,
					},
				},
			},
		})

		--------------------------------------------------
		-- Python: ruff
		--------------------------------------------------
		vim.lsp.config("ruff", {
			capabilities = capabilities,
			on_attach = on_attach,
			init_options = {
				settings = {
					format = { enable = true },
				},
			},
		})

		--------------------------------------------------
		-- Rust
		--------------------------------------------------
		vim.lsp.config("rust_analyzer", {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				["rust-analyzer"] = {
					cargo = { allFeatures = true },
					checkOnSave = { command = "clippy" },
				},
			},
		})

		--------------------------------------------------
		-- C / C++
		--------------------------------------------------
		vim.lsp.config("clangd", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		--------------------------------------------------
		-- Java
		--------------------------------------------------
		vim.lsp.config("jdtls", {
			capabilities = capabilities,
			on_attach = on_attach,
			cmd = { "jdtls" },
		})

		--------------------------------------------------
		-- Enable servers
		--------------------------------------------------
		vim.lsp.enable({
			"lua_ls",
			"basedpyright",
			"ruff",
			"rust_analyzer",
			"clangd",
			"jdtls",
		})

		vim.diagnostic.config({
			underline = true,
			virtual_text = false, -- 🔥 VS Code style
			signs = true,
			update_in_insert = false,
			float = {
				border = "rounded",
				source = "if_many",
			},
		})
	end,
}
