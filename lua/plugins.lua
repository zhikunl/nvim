local packer = require("packer")

packer.startup(function(use)
  use "wbthomason/packer.nvim"

  use {"neovim/nvim-lspconfig", tag = "v0.1.3"}

  use {"hrsh7th/nvim-cmp", commit = "433af3dffce64cbd3f99bdac9734768a6cc41951"}
  use {"hrsh7th/cmp-nvim-lsp", commit = "ebdfc204afb87f15ce3d3d3f5df0b8181443b5ba"}
  use {"hrsh7th/cmp-buffer", commit = "d66c4c2d376e5be99db68d2362cd94d250987525"}
  use {"hrsh7th/cmp-path", commit = "466b6b8270f7ba89abd59f402c73f63c7331ff6e"}

  -- 暂时禁用snippet，避开旧版本兼容噩梦
  -- use {"L3MON4D3/LuaSnip", tag = "v1.2.1"}
  -- use {"saadparwaiz1/cmp_luasnip", commit = "018f9e8"}
end)
