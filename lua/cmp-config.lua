local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),

        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),

        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),

        ["<CR>"] = cmp.mapping.confirm({
            select = false,
        }),

        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),

    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
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
                luasnip = "[Snippet]",
                buffer = "[Buffer]",
                path = "[Path]",
            })[entry.source.name] or ""
    
            return vim_item
        end,
    },
})


vim.opt.completeopt = { "menuone", "noinsert", "noselect" }

-- 补全菜单最多显示 20 行
vim.opt.pumheight = 20

-- =========================================
-- nvim-cmp completion colors
-- Neovim 0.9.5
-- =========================================

local function set_cmp_highlights()
    -- 普通候选项
    vim.api.nvim_set_hl(0, "Pmenu", {
        fg = "#d0d0d0",
        bg = "#303030",
        default = false,
    })
    -- 选中项
    vim.api.nvim_set_hl(0, "PmenuSel", {
        fg = "#ffffff",
        bg = "#005f87",
        bold = true,
        default = false,
    })
    -- 匹配字符
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", {
        fg = "#ffd75f",
        bold = true,
        default = false,
    })
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", {
        fg = "#ffd75f",
        bold = true,
        default = false,
    })
    -- 右侧菜单说明
    vim.api.nvim_set_hl(0, "CmpItemMenu", {
        fg = "#d0d0d0",
        bg = "#303030",
        default = false,
    })
    -- 右侧类型说明
    vim.api.nvim_set_hl(0, "CmpItemKind", {
        fg = "#8be9fd",
        bg = "#303030",
        default = false,
    })
    -- 滚动条
    vim.api.nvim_set_hl(0, "PmenuSbar", {
        bg = "#303030",
        default = false,
    })
    vim.api.nvim_set_hl(0, "PmenuThumb", {
        bg = "#005f87",
        default = false,
    })
end

set_cmp_highlights()
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = set_cmp_highlights,
})

