local cmp = require("cmp")

cmp.setup({
    -- snippet 模块删掉，没有luasnip
    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        -- Tab直接原生tab，去掉luasnip跳转逻辑
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "path" },
    }, {
        { name = "buffer" },
    }),
    formatting = {
        fields = { "abbr", "kind", "menu" },
        format = function(entry, vim_item)
            local kind_icons = {
                Text = "󰉿",
                Method = "󰆧",
                Function = "󰊕",
                Constructor = "",
                Field = "󰜢",
                Variable = "󰀫",
                Class = "󰠱",
                Interface = "",
                Module = "",
                Property = "󰜢",
                Unit = "󰑭",
                Value = "󰎠",
                Enum = "",
                Keyword = "󰌋",
                Snippet = "",
                Color = "󰏘",
                File = "󰈙",
                Reference = "󰈇",
                Folder = "󰉋",
                EnumMember = "",
                Constant = "󰏿",
                Struct = "󰙅",
                Event = "",
                Operator = "󰆕",
                TypeParameter = "󰅲",
            }
            vim_item.kind = (kind_icons[vim_item.kind] or "") .. " " .. vim_item.kind
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                buffer = "[Buffer]",
                path = "[Path]",
            })[entry.source.name] or ""
            return vim_item
        end,
    },
})

vim.opt.completeopt = { "menuone", "noinsert", "noselect" }

local function set_cmp_highlights()
    vim.api.nvim_set_hl(0, "Pmenu", { fg = "#d0d0d0", bg = "#303030" })
    vim.api.nvim_set_hl(0, "PmenuSel", { fg = "#ffffff", bg = "#005f87", bold = true })
    vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#303030" })
    vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#005f87" })
end

set_cmp_highlights()
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = set_cmp_highlights
})

