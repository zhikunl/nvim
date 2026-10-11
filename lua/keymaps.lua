-- lua/keymaps.lua 适配nvim 0.6.1
vim.g.mapleader = " "

local function map(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.noremap = opts.noremap ~= false
    opts.silent = opts.silent ~= false
    vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

map("n", "<leader>w", "<cmd>write<CR>", { desc = "Save file" })
map("n", "<leader>q", "<cmd>quit<CR>", { desc = "Quit" })
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- LSP 快捷键
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition" })
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "Find references" })
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Hover documentation" })
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename symbol" })
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code action" })

map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
map("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>")

