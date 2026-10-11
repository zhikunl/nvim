local capabilities =
    require("cmp_nvim_lsp").default_capabilities()

local function on_attach(_, bufnr)
    local opts = { buffer = bufnr, silent = true }

    vim.keymap.set("n", "gd",
        vim.lsp.buf.definition, opts)

    vim.keymap.set("n", "gD",
        vim.lsp.buf.declaration, opts)

    vim.keymap.set("n", "gi",
        vim.lsp.buf.implementation, opts)

    vim.keymap.set("n", "gr",
        vim.lsp.buf.references, opts)

    vim.keymap.set("n", "K",
        vim.lsp.buf.hover, opts)

    vim.keymap.set("n", "<leader>rn",
        vim.lsp.buf.rename, opts)

    vim.keymap.set("n", "<leader>ca",
        vim.lsp.buf.code_action, opts)
end

require("lspconfig").clangd.setup({
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--completion-style=detailed",
        "--header-insertion=iwyu",
        "--query-driver=/usr/local/cuda/bin/nvcc",
    },
    capabilities = capabilities,
    on_attach = on_attach,
})
