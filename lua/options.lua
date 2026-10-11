local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.smartindent = true
opt.wrap = false

opt.termguicolors = true  -- 必须开启真彩色

opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.ignorecase = true
opt.smartcase = true
opt.updatetime = 250
opt.signcolumn = "yes"

opt.splitright = true
opt.splitbelow = true
opt.autoread = true

opt.pumheight = 12

opt.statusline = table.concat({
    "%f",
    "%h",
    "%m",
    "%r",
    "%=",
    "ft=%{&filetype}",
    "%y",
    " | ",
    "enc=%{&fileencoding}",
    " | ",
    "%{&fileformat}",
    " | ",
    "L%l/%L",
    " C%c",
    " %P",
})

-- Neovim 0.6.1 设置文件类型（替代 vim.filetype.add）
vim.cmd([[
autocmd BufRead,BufNewFile *.cc set filetype=cpp
autocmd BufRead,BufNewFile *.cxx set filetype=cpp
autocmd BufRead,BufNewFile *.hpp set filetype=cpp
autocmd BufRead,BufNewFile *.cu set filetype=cuda
autocmd BufRead,BufNewFile *.cuh set filetype=cuda
]])

