local packer = require("packer")

packer.startup(function(use)
  use "wbthomason/packer.nvim"

  -- LSP 锁定旧版本
  use {"neovim/nvim-lspconfig", tag = "v0.1.3"}

  -- nvim‑cmp 全套降级到支持0.6.1版本
  use {"hrsh7th/nvim-cmp", tag = "v0.2.1"}
  use {"hrsh7th/cmp-nvim-lsp", tag = "v0.1.0"}
  use {"hrsh7th/cmp-buffer", tag = "v0.1.0"}
  use {"hrsh7th/cmp-path", tag = "v0.1.0"}

  -- luasnip
  use {"L3MON4D3/LuaSnip", tag = "v1.2.1"}
  use {"saadparwaiz1/cmp_luasnip", tag = "v0.1.0"}

end)

