local map = vim.keymap.set

vim.g.mapleader = " "

map("n", "<leader>w", "<cmd>write<CR>",
  { desc = "Save file" })

map("n", "<leader>q", "<cmd>quit<CR>",
  { desc = "Quit" })

map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- LSP 操作：在 lsp.lua 中配置对应功能
map("n", "gd", vim.lsp.buf.definition,
  { desc = "Go to definition" })

map("n", "gr", vim.lsp.buf.references,
  { desc = "Find references" })

map("n", "K", vim.lsp.buf.hover,
  { desc = "Hover documentation" })

map("n", "<leader>rn", vim.lsp.buf.rename,
  { desc = "Rename symbol" })

map("n", "<leader>ca", vim.lsp.buf.code_action,
  { desc = "Code action" })

map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)
map("n", "<leader>e", vim.diagnostic.open_float)
