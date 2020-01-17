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
" set termencoding=utf-8 " 终端使用的字符编码
" set guifont=Source\ Code\ Pro\ for\ Powerline:h12 " GUI版本使用的字体
set hlsearch    " 高亮搜索
set incsearch " 在输入要搜索的文字时， 实时匹配
set ignorecase " 搜索模式里忽略大小写
set smartcase " 如果搜索模式包含大写字符，不使用'ignorecase'选项
set updatetime=300 " 缩短光标停留事件触发时间
set signcolumn=yes " 总是显示标记列，防止输入时列时显时隐导致窗口抖动
if has("termguicolors")
    " fix bug for vim
    set t_8f=^[[38;2;%lu;%lu;%lum
    set t_8b=^[[48;2;%lu;%lu;%lum

    " 给终端开启truecolor
    set termguicolors
endif

"========== 
" 加载插件
"========== 
if filereadable(expand(s:VIM_PLUG_FILE.""))
    execute 'source '.fnameescape(s:VIM_PLUG_FILE)
endif 


"========== 
" 插件设置
"========== 
" lifepillar/vim-solarized8
colorscheme onedark " 使用solarized8主题
" 修改solarized8主题默认的signcolumn列颜色，跟行号列同色
hi! link SignColumn LineNr

" " scrooloose/nerdtree
" autocmd StdinReadPre * let s:std_in=1 " TODO:不明觉厉
" autocmd VimEnter * if !argc() | Startify | NERDTree | wincmd w | endif " 当启动vim不追加任何参数时，默认打开启动页，文件数窗口，并切换窗口焦点到启动页
" let NERDTreeIgnore = ['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$', '\.gitkeep$'] " 文件数忽略的文件/目录列表匹配
" let NERDTreeQuitOnOpen=1 " 用NERDTree相关命令打开文件时关闭NERDTree窗口
" let NERDTreeMouseMode=2 " 鼠标单击展开节点，双击打开文件
" let NERDTreeShowHidden=1 " 显示隐藏文件，通常一些.开头的文件视为隐藏, 方便展示一些.开头的配置文件
" let NERDTreeKeepTreeInNewTab=1 " TODO: 不明觉厉
" let NERDTreeMinimalUI=1 " 去掉一些额外的显示，开启简化UI模式

" vim-airline/vim-airline
let g:airline#extensions#tabline#enabled = 1 " 开启tab栏加强
let g:airline#extensions#tabline#buffer_nr_show = 1 " 显示buffer索引
let g:airline#extensions#tabline#formatter = 'unique_tail' " 更改tabName显示格式，同名时显示唯一区分
let g:airline_powerline_fonts = 1 " 启用pwerline的字体
let g:airline_theme='onedark' " 使用onedark主题
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}' " airline集成coc的错误数目显示
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}' " airline集成coc的警告数目显示

" raimondi/delimitmate
let delimitMate_expand_cr = 1 " 在匹配符号对立enter键成对换行展开
let delimitMate_expand_space = 1 " 在匹配符号对立空格键成对输入展开
let delimitMate_matchpairs = "(:),[:],{:}" " 设置非引号类的成对符号, 去掉尖括号，防止和closetag插件冲突
au FileType vim let b:delimitMate_quotes = "'" " vim文件类型关闭双引号匹配

" alvan/vim-closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.tsx,*.jsx' " 针对这些文件开启closetag插件
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx' " 针对这些文件自动写成自关闭, 比如： <img> ==> <img/>
let g:closetag_emptyTags_caseSensitive = 1 " 自关闭标签的大小写敏感开启，比如：<img> ==> <img/> 会自关闭, 而大写的<Img> => <Img></Img>会变成非自关闭标签并自动添加结尾标签
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ } " 使jsx和tsx文件只有光标在模板标签区域内closetag插件才生效
let g:closetag_shortcut = '>' " 触发自动closetag的快捷键
let g:closetag_close_shortcut = '<leader>>' " leader+>：不触发closetag的情况下输入>

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
let g:pretteri#config#tab_width = 2
let g:prettier#config#single_quote = 'true'
let g:prettier#config#semi = 'false'

" mxw/vim-jsx
let g:jsx_ext_required = 0   " Allow JSX in normal JS files
" autocmd BufRead,BufNewFile *.tsx setlocal syntax=javascript.jsx


" " Yggdroot/indentLine
" let g:indentLine_enabled = 1
" let g:indentLine_concealcursor = 0
" let g:indentLine_char = '┆'
" let g:indentLine_faster = 1

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
" search word under cursor, the pattern is treated as regex, and enter normal mode directly
" noremap <leader>ff :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" 复制当前内容到系统粘贴板
noremap YY "+y<CR>
" 将系统粘贴板内容粘贴到当前位置
noremap <leader>p "+gP<CR>
" 剪切当前内容到系统粘贴板 
noremap XX "+x<CR>

" " 切换NERDTree显示，速记'file list'
" nnoremap <leader>fl :NERDTreeToggle<CR>   

" 跳转到上一个警告
nmap <silent> [c <Plug>(coc-diagnostic-prev)
" 跳转到下一个警告
nmap <silent> ]c <Plug>(coc-diagnostic-next)
" 跳转到定义
nmap <silent> gd <Plug>(coc-definition)
" 跳转到类型定义
nmap <silent> gy <Plug>(coc-type-definition)
" 跳转到实现的地方
nmap <silent> gi <Plug>(coc-implementation)
" 跳转到引用的地方
nmap <silent> gr <Plug>(coc-references)
" 变量重命名
nmap <leader>rn <Plug>(coc-rename)
" 显示文档
nnoremap <silent> K :call <SID>show_documentation()<CR>
" <Tab>键设置
" 选中当前补全/展开代码片段/代码片段中跳跃/默认<TAB>制表符输入/呼出自动补全
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort " 检查当前光标是不是在空格或者行首
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" 回车键确认当前候选的选择
" 配合coc-setting里面的suggest.noselect:false，
" 自动选择第一个候选,回车键就默认选中第一个输入
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
                                            \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" coc keymap 
noremap <leader>f :<C-u>CocList files<CR>
noremap <leader>fl :<C-u>CocCommand explorer<CR>
noremap <leader>b :<C-u>CocList buffers<CR>
noremap <leader>tsf :<C-u>CocCommand tslint.fixAllProblems<CR>
