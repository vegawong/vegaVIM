" --------------------------------
" 配置文件入口
" --------------------------------


set nocompatible 

" 变量
let s:VIM_CONFIG_PATH = "~/.config/nvim"
let s:VIM_PLUG_FILE = s:VIM_CONFIG_PATH . "/vimrc.bundles"
let g:mapleader = ','


filetype plugin indent on
syntax enable
syntax on
set background=dark

set hidden " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存

set cmdheight=2

" 去掉默认的swap文件生成
set noswapfile
set nobackup

set mousemodel=popup
set mouse=a

" soft tab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set shiftround " use multiple of shiftwidth when indenting with '<' and '>'
set smartindent " 启用只能对其方式

" 行号
set nu
set rnu
set cursorcolumn " highlight current column
set cursorline " highlight current line

" File encode:encode for varied filetype
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,cp3936,gb18030,big5,euc-jp,euc-kr,latin1
set termencoding=utf-8
set guifont=Source\ Code\ Pro\ for\ Powerline:h12

set hlsearch    " 高亮搜索
set incsearch " 在输入要搜索的文字时， 实时匹配
set ignorecase " 搜索模式里忽略大小写
set smartcase " 如果搜索模式包含大写字符，不使用'ignorecase'选项

" buffer导航
nnoremap <leader>bp :bp<CR>
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

" 复制、粘贴
noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>



"Load plugins
if filereadable(expand(s:VIM_PLUG_FILE.""))
    execute 'source '.fnameescape(s:VIM_PLUG_FILE)
endif 


