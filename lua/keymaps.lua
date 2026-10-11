-- lua/keymaps.lua 适配 nvim 0.6.1
vim.g.mapleader = " "

local function map(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.noremap = opts.noremap ~= false
    opts.silent = opts.silent ~= false
    -- 0.6.1 nvim_set_keymap 不支持desc，opts不能带desc字段
    vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

map("n", "<leader>w", "<cmd>write<CR>", {})
map("n", "<leader>q", "<cmd>quit<CR>", {})
map("n", "<Esc>", "<cmd>nohlsearch<CR>", {})

-- LSP快捷键
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })

map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
map("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })

