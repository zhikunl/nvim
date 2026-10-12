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
" 状态栏
set laststatus=2
" 文件类型
filetype plugin indent on
" 搜索
set hlsearch
set incsearch

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
Plug 'voldikss/vim-floaterm' " float terminal
Plug 'skywind3000/asyncrun.vim' " async terminal

call plug#end()

" **Inlay Hint 内联提示**：`: const device_buffer<float>` 这段**额外虚拟文字**，源码不存在
" nnoremap <F4> :CocCommand document.toggleInlayHint<CR>
" coc-settings.json
" {
    "inlayHint.enable": false
" }

" ============= keymaps settings begain =============
" coc跳转快捷键
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> K  :call CocActionAsync('doHover')<CR>

" floaterm config
nnoremap <F12> :FloatermToggle<CR>
tnoremap <F12> <C-\><C-n>:FloatermToggle<CR>

" asyncrun config
let g:asyncrun_open = 6
let g:asyncrun_bell = 1
nnoremap <F9> :AsyncRun -cwd=<root> make<CR>

" 保存前自动调用clang-format格式化c/cpp
"augroup clang_format_auto
  "autocmd!
  "autocmd BufWritePre *.c,*.cpp,*.cc,*.cu,*.h,*.hpp %!clang-format
"augroup end

" ============= keymaps settings end =============

" 补全菜单：普通候选项
highlight CocMenuSel ctermfg=15 ctermbg=24 guifg=#ffffff guibg=#005f87
" 补全菜单：匹配的文字
highlight CocSearch ctermfg=11 guifg=#ffd75f
" 补全菜单：额外信息
highlight CocFloating ctermfg=252 ctermbg=236 guifg=#d0d0d0 guibg=#303030
" 补全菜单：菜单分隔符
highlight CocMenuSel cterm=bold gui=bold

" ===== 建议在这里放 colorscheme xxx
" colorscheme desert
" colorscheme morning
" colorscheme slate
colorscheme evening
