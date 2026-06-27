-- set leader key to space
vim.g.mapleader = " "

local map = vim.keymap.set -- for conciseness

-- General Keymaps -------------------

-- use jk to exit insert mode
map("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- increment/decrement numbers
map("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
map("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
map("n", "<leader>sv", ": vsplit | edit<CR>", { desc = "Split window vertically" }) -- split window vertically
map("n", "<leader>sh", ": split | edit<CR>", { desc = "Split window horizontally" }) -- split window horizontally
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
map("n", "<leader>sq", "<C-w>w", { desc = "Jump between split windows" }) -- jump between split windows
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
map("n", "<leader><Tab>", ": Chowcho<CR>", { desc = "Choose what window to jump too" })

map("n", "<leader>n", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
map("n", "<leader>x", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
map("n", "<leader>!f", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- terminal
map(
	"n",
	"<leader>th",
	":ToggleTerm size=10  direction=horizontal<CR>",
	{ desc = "Open terminal in horizontal split window" }
)
map("n", "<leader>ts", ":TermSelect<CR>", { desc = "Select which terminal to open" })
map("n", "<leader>tb", ":ToggleTerm direction=tab<CR>", { desc = "Open terminal in another tab" })
map("n", "<leader>tf", ":ToggleTerm direction=float<CR>", { desc = "Open terminal in float mode" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Get out of insert modc" })

-- window resize
map("n", "=", "<cmd>vertical resize +5<CR>") -- make the window biger vertically
map("n", "-", "<cmd>vertical resize -5<CR>") -- make the window smaller vertically
map("n", "+", "<cmd>horizontal resize +2<CR>") -- make the window bigger horizontally by pressing shift and =
map("n", "_", "<cmd>horizontal resize -2<CR>") -- make the window smaller horizontally by pressing shift and -

-- file management
map("n", "<leader>sa", ":wa<CR>", { desc = "Save all files" })
map("n", "<leader>sc", ":w<CR>", { desc = "Save current file" })

-- find and replace
map("n", "<leader>fi", ":%s/", { desc = "Substitute" })

-- macros(kinda)
map("i", "sopln", "System.out.println", { desc = "Make java easier" })

-- Bufferline
map("n", "<leader>bs", ":BufferLinePick<CR>")
map("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>")
map("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>")
map("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>")
map("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>")
map("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>")
map("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>")
map("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>")
map("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>")
map("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>")

-- Find and Replace
-- Simple find using /
map("n", "<leader>/", "/", { noremap = true }) -- enter search mode

-- Find and replace current word under cursor
map("n", "<leader>r", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], opts)
-- Explanation: replaces the word under cursor throughout the file with confirmation cursor before replacement text
