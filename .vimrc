" 基础设置
set number
set relativenumber

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

syntax on

set mouse=a
set encoding=utf-8

" 搜索
set hlsearch
set incsearch

set termguicolors
" 状态栏
set laststatus=2
" 文件类型
filetype plugin indent on

" ===== Truecolor for PuTTY 0.81+
if has('termguicolors')
  set termguicolors
  let &t_8f = "\e[38;2;%lu;%lu;%lum"
  let &t_8b = "\e[48;2;%lu;%lu;%lum"
endif

" 插件
call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'preservim/nerdtree'

Plug 'vim-airline/vim-airline'

Plug 'dense-analysis/ale'

Plug 'tpope/vim-commentary'

call plug#end()

" **Inlay Hint 内联提示**：`: const device_buffer<float>` 这段**额外虚拟文字**，源码不存在
" nnoremap <F4> :CocCommand document.toggleInlayHint<CR>
" coc-settings.json
" {
    "inlayHint.enable": false
" }


" coc跳转快捷键
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> K  :call CocActionAsync('doHover')<CR>

" 保存前自动调用clang-format格式化c/cpp
"augroup clang_format_auto
  "autocmd!
  "autocmd BufWritePre *.c,*.cpp,*.cc,*.cu,*.h,*.hpp %!clang-format
"augroup end

" 补全菜单：普通候选项
highlight CocMenuSel ctermfg=15 ctermbg=24 guifg=#ffffff guibg=#005f87

" 补全菜单：匹配的文字
highlight CocSearch ctermfg=11 guifg=#ffd75f

" 补全菜单：额外信息
highlight CocFloating ctermfg=252 ctermbg=236 guifg=#d0d0d0 guibg=#303030

" 补全菜单：菜单分隔符
highlight CocMenuSel cterm=bold gui=bold

" ===== 建议在这里放 colorscheme xxx
" colorscheme campbell

" ===== Campbell配色高亮覆盖，放在colorscheme之后
hi Normal guifg=#cccccc guibg=#0c0c0c ctermfg=7 ctermbg=0
hi Comment guifg=#767676 ctermfg=8
hi SpecialComment guifg=#767676 ctermfg=8
hi cComment guifg=#767676 ctermfg=8
hi cCommentL guifg=#767676 ctermfg=8

hi cInclude guifg=#b4009e ctermfg=5
hi cPreProc guifg=#b4009e ctermfg=5
hi cType guifg=#3b78ff ctermfg=12

" ==========【新增补充，CUDA/C++需要】==========
" cStatement：关键字 if/for/return/__global__
hi cStatement guifg=#3b78ff ctermfg=12
" cConstant：数字常量
hi cConstant guifg=#f9f1a5 ctermfg=11
" cString：字符串
hi cString guifg=#16c60c ctermfg=10
" cOperator：运算符 + - *
hi cOperator guifg=#cccccc ctermfg=7
" cStructure struct/class
hi cStructure guifg=#3b78ff ctermfg=12
" cMacro 宏定义
hi cMacro guifg=#b4009e ctermfg=5
