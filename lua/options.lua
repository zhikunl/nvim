local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

opt.smartindent = true
opt.wrap = false
-- opt.termguicolors = true

opt.mouse = "a"
opt.clipboard = "unnamedplus"

opt.ignorecase = true
opt.smartcase = true

opt.updatetime = 250
opt.signcolumn = "yes"
opt.completeopt = { "menu", "menuone", "noselect" }

opt.splitright = true
opt.splitbelow = true

-- 保持项目文件路径与工作目录清晰
opt.autoread = true

-- 状态栏始终显示文件信息
opt.statusline = table.concat({
    "%f",           -- 文件路径
    "%h",           -- 帮助文件标记
    "%m",           -- 文件修改标记 [+]
    "%r",           -- 只读标记 [RO]
    "%=",           -- 左右分隔
    "ft=%{&filetype}", -- 文件类型
    "%y",           -- 文件格式类型描述
    " | ",
    "enc=%{&fileencoding}", -- 文件编码
    " | ",
    "%{&fileformat}", -- 换行格式 unix/dos
    " | ",
    "L%l/%L",       -- 当前行/总行数
    " C%c",         -- 当前列
    " %P",          -- 当前进度百分比
})

vim.filetype.add({
    extension = {
        cpp = "cpp",
        cc = "cpp",
        cxx = "cpp",
        hpp = "cpp",
        cu = "cuda",
        cuh = "cuda",
    },
})
