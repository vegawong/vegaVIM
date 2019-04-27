" --------------------------------
" 配置文件入口
" --------------------------------


set nocompatible " 关闭vi兼容模式

"========== 
" 变量设置 
"==========
let s:VIM_CONFIG_PATH = "~/.config/nvim" " VIM 配置文件路径，这里只面向nvim
let s:VIM_PLUG_FILE = s:VIM_CONFIG_PATH . "/vimrc.bundles" " VIM 插件目录
let g:mapleader = ',' " leader键映射


"==========
" vim自身设置
"==========
set background=dark " 指定vim使用深色背景
filetype plugin indent on " 检测文件类型后并自动应用对应插件和缩进规则
syntax enable " 开启语法高亮(允许自定义）
" syntax on  " 开启语法高亮（采用默认，不允许自定义)
set hidden " 当前缓冲区有改动且未保存时切换，vim会隐藏缓冲区而不是放弃改动，切换回来时状态还在
set cmdheight=2 " 命令行占用屏幕行数，用两行比较好的展示一些较长的错误提示
set noswapfile " 载入缓冲区时不生成交换文件
set nobackup  " 覆盖文件时不生成备份文件
set mousemodel=popup " 鼠标工作模式：右键-菜单，shift+左键扩展选择区
set mouse=a " 允许所有模式下使用鼠标
set tabstop=4 " (渲染)<Tab>制表符占用4个空格字符长度
set shiftwidth=4 " 每层缩进使用4个空格
set softtabstop=4 " 开启expandtab时候<Tab>和<Bs>对应操作的4个空格
set smarttab " 行首输入<Tab>时候输入sw个空格
set expandtab " 输入<Tab>是替换成空格
set shiftround " 使用缩进命令是<Tab>/>/<总是取整到st的倍数
set autoindent " 添加新行时采用与当前行同等的自动缩进
set smartindent " 基于autoindent的改进
set nu " 显示行号
set rnu " 显示相对行号
set cursorcolumn " 高亮当前列
set cursorline " 高亮当前行
set encoding=utf-8 " 默认字符编码为utf-8
set fileencodings=utf-8,ucs-bom,cp3936,gb18030,big5,euc-jp,euc-kr,latin1 " 按顺序检测符合的文件字符编码并对应改变encoding的值
set termencoding=utf-8 " 终端使用的字符编码
" set guifont=Source\ Code\ Pro\ for\ Powerline:h12 " GUI版本使用的字体
set hlsearch    " 高亮搜索
set incsearch " 在输入要搜索的文字时， 实时匹配
set ignorecase " 搜索模式里忽略大小写
set smartcase " 如果搜索模式包含大写字符，不使用'ignorecase'选项

"========== 
" 加载插件
"========== 
if filereadable(expand(s:VIM_PLUG_FILE.""))
    execute 'source '.fnameescape(s:VIM_PLUG_FILE)
endif 


"========== 
" 插件设置
"========== 
" altercation/vim-colors-solarized 
if filereadable(expand("~/.config/nvim/plug/vim-colors-solarized/colors/solarized.vim"))
    colorscheme solarized " 使用solarized主题
endif

" scrooloose/nerdtree
autocmd StdinReadPre * let s:std_in=1 " TODO:不明觉厉
autocmd VimEnter * if !argc() | Startify | NERDTree | wincmd w | endif " 当启动vim不追加任何参数时，默认打开启动页，文件数窗口，并切换窗口焦点到启动页
let NERDTreeIgnore = ['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$', '\.gitkeep$'] " 文件数忽略的文件/目录列表匹配
let NERDTreeQuitOnOpen=1 " 用NERDTree相关命令打开文件时关闭NERDTree窗口
let NERDTreeMouseMode=2 " 鼠标单击展开节点，双击打开文件
let NERDTreeShowHidden=1 " 显示隐藏文件，通常一些.开头的文件视为隐藏, 方便展示一些.开头的配置文件
let NERDTreeKeepTreeInNewTab=1 " TODO: 不明觉厉
let NERDTreeMinimalUI=1 " 去掉一些额外的显示，开启简化UI模式

" vim-airline/vim-airline
let g:airline#extensions#tabline#enabled = 1 " 开启tab栏加强
let g:airline#extensions#tabline#buffer_nr_show = 1 " 显示buffer索引
let g:airline#extensions#tabline#formatter = 'unique_tail' " 更改tabName显示格式，同名时显示唯一区分
let g:airline_powerline_fonts = 1 " 启用pwerline的字体
let g:airline_theme='onedark' " 使用onedark主题

" TODO: 不知道怎么设置
" raimondi/delimitmate
" let delimitMate_expand_cr = 1
" let delimitMate_expand_space = 1
" let delimitMate_matchpairs = "(:),[:],{:}"


" alvan/vim-closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.tsx,*.jsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

" mhinz/vim-startify 
let g:startify_custom_header = [
            \' $$$$$$$$\                        $$\     $$\                                   $$$$$$$\                        $$\     ',
            \' \__$$  __|                       \$$\   $$  |                                  $$  __$$\                       $$ |    ',
            \'    $$ | $$$$$$\  $$\   $$\        \$$\ $$  /$$$$$$\  $$\   $$\  $$$$$$\        $$ |  $$ | $$$$$$\   $$$$$$$\ $$$$$$\   ',
            \'    $$ |$$  __$$\ $$ |  $$ |        \$$$$  /$$  __$$\ $$ |  $$ |$$  __$$\       $$$$$$$\ |$$  __$$\ $$  _____|\_$$  _|  ',
            \'    $$ |$$ |  \__|$$ |  $$ |         \$$  / $$ /  $$ |$$ |  $$ |$$ |  \__|      $$  __$$\ $$$$$$$$ |\$$$$$$\    $$ |    ',
            \'    $$ |$$ |      $$ |  $$ |          $$ |  $$ |  $$ |$$ |  $$ |$$ |            $$ |  $$ |$$   ____| \____$$\   $$ |$$\ ',
            \'    $$ |$$ |      \$$$$$$$ |          $$ |  \$$$$$$  |\$$$$$$  |$$ |            $$$$$$$  |\$$$$$$$\ $$$$$$$  |  \$$$$  |',
            \'    \__|\__|       \____$$ |          \__|   \______/  \______/ \__|            \_______/  \_______|\_______/    \____/ ',
            \'                  $$\   $$ |                                                                                            ',
            \'                  \$$$$$$  |                                                                                            ',
            \'                   \______/                                                                                             '
            \]

" prettier/vim-prettier
nnoremap <leader><c-f> :Prettier<CR>
let g:pretteri#config#tab_width = 4
let g:prettier#config#single_quote = 'true'

" mxw/vim-jsx
let g:jsx_ext_required = 0   " Allow JSX in normal JS files
" autocmd BufRead,BufNewFile *.tsx setlocal syntax=javascript.jsx


" Yggdroot/indentLine
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1

" neoclide/coc.nvim
function! s:show_documentation()
    if &filetype == 'vim'
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction



"========== 
" 快捷键
"========== 
" 上一个buffer
nnoremap <leader>bp :bp<CR> 
" 下一个buffer
nnoremap <leader>bn :bn<CR>
" 查看buffers
nnoremap <leader>ls :ls<CR>
" buffer索引跳转
nnoremap <leader>1b :1b<CR>
nnoremap <leader>2b :2b<CR>
nnoremap <leader>3b :3b<CR>
nnoremap <leader>4b :4b<CR>
nnoremap <leader>5b :5b<CR>
nnoremap <leader>6b :6b<CR>
nnoremap <leader>7b :7b<CR>
nnoremap <leader>8b :8b<CR>
nnoremap <leader>9b :9b<CR>
nnoremap <leader>0b :0b<CR>
" 编辑模式下光标左右移动
inoremap <c-f> <right>
inoremap <c-b> <left>
" 复制当前内容到系统粘贴板
noremap YY "+y<CR>
" 将系统粘贴板内容粘贴到当前位置
noremap <leader>p "+gP<CR>
" 剪切当前内容到系统粘贴板 
noremap XX "+x<CR>

" 切换NERDTree显示，速记'file list'
nnoremap <leader>fl :NERDTreeToggle<CR>   

nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nnoremap <silent> K :call <SID>show_documentation()<CR>
