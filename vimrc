" --------------------------------
" 配置文件入口
" --------------------------------


set nocompatible " 关闭vi兼容模式

"========== 
" 变量设置 
"==========
let s:VIM_CONFIG_PATH = "~/.config/nvim" " VIM 配置文件路径，这里只面向nvim
let s:VIM_PLUG_FILE = s:VIM_CONFIG_PATH . "/vimrc.bundles" " VIM 插件目录
let s:VIM_KEYMAPS_FILE = s:VIM_CONFIG_PATH . "/vimrc.keymaps" " VIM 快捷键设置

"========== 
" 加载插件
"========== 
if filereadable(expand(s:VIM_PLUG_FILE.""))
    execute 'source '.fnameescape(s:VIM_PLUG_FILE)
endif 

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
set tabstop=2 " (渲染)<Tab>制表符占用4个空格字符长度
set shiftwidth=2 " 每层缩进使用4个空格
set softtabstop=2 " 开启expandtab时候<Tab>和<Bs>对应操作的4个空格
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
colorscheme onedark " 使用solarized8主题



"========== 
" 插件设置
"========== 
" vim-airline/vim-airline
let g:airline_left_sep = "\ue0c0"
let g:airline_right_sep = "\ue0c2"
let g:airline#extensions#tabline#enabled = 1 " 开启tab栏加强
let g:airline#extensions#tabline#buffer_nr_show = 1 " 显示buffer索引
let g:airline#extensions#tabline#formatter = 'unique_tail' " 更改tabName显示格式，同名时显示唯一区分
let g:airline_powerline_fonts = 1 " 启用pwerline的字体
let g:airline_theme='onedark' " 使用onedark主题
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}' " airline集成coc的错误数目显示
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}' " airline集成coc的警告数目显示

" mxw/vim-jsx
let g:jsx_ext_required = 0   " Allow JSX in normal JS files

" suy/vim-context-commentstring
function! s:UpdateCommentString()
  if exists('g:context#commentstring#table')
    let g:context#commentstring#table['javascriptreact'] = g:context#commentstring#table['javascript.jsx']
    let g:context#commentstring#table['typescriptreact'] = g:context#commentstring#table['typescript.tsx']
  endif
endfunction
autocmd FileType * call <SID>UpdateCommentString()

" jsonc
au BufNewFile,BufRead tsconfig.json set filetype=jsonc

" defx
function! s:defx_node_open() abort
  " Open current file, or toggle directory expand/collapse
  if defx#is_directory()
      return defx#do_action('open_or_close_tree')
  endif
  return defx#do_action('multi', ['drop'])
endfunction

function! s:defx_mappings() abort
	" Defx window keyboard mappings
	setlocal signcolumn=no
	" 使用回车打开文件
	nnoremap <silent><buffer><expr> <CR> <SID>defx_node_open()
  " 新建目录
  nnoremap <silent><buffer><expr> ad defx#do_action('new_directory')
  " 新建文件
  nnoremap <silent><buffer><expr> af defx#do_action('new_file')
  " 重命名
  nnoremap <silent><buffer><expr> rn defx#do_action('rename')
  " 删除
  nnoremap <silent><buffer><expr> dd defx#do_action('remove')
  " 剪切
  nnoremap <silent><buffer><expr> mv defx#do_action('move')
  " 复制
  nnoremap <silent><buffer><expr> cp defx#do_action('copy')
  " 粘贴
  nnoremap <silent><buffer><expr> p defx#do_action('paste')
endfunction

call defx#custom#option('_', {
	\ 'columns': 'git:indent:icons:filename',
	\ 'winwidth': 25,
	\ 'split': 'vertical',
	\ 'direction': 'topleft',
	\ 'listed': 1,
	\ 'show_ignored_files': 0,
	\ 'root_marker': '≡ ',
	\ 'ignored_files':
	\     '.mypy_cache,.pytest_cache,.git,.hg,.svn,.stversions'
	\   . ',__pycache__,.sass-cache,*.egg-info,.DS_Store,*.pyc,*.swp'
	\ })

autocmd FileType defx call s:defx_mappings()

" vim-clap
let g:clap_search_box_border_style = ''


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


"========== 
" 快捷键设置
"========== 
if filereadable(expand(s:VIM_KEYMAPS_FILE.""))
    execute 'source '.fnameescape(s:VIM_KEYMAPS_FILE)
endif 
  
