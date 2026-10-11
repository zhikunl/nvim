return {
    {
        "neovim/nvim-lspconfig",
        tag = "v0.1.8",
        config = function()
            require("lsp")
        end,
    },

    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            require("cmp-config")
        end,
    },
}
