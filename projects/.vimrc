set background=dark
"set background=light
"命令显示历史
set history=500
"显示空格和tab
set list listchars=tab:→\ ,trail:·
"set list listchars=tab:>-,trail:·
"忽略大小匹配
set ignorecase
"检索高亮
set hlsearch
"输入检索时动态变化
set incsearch
set smartcase
"c，java等代码用4个空格缩进
autocmd FileType go,c,java,sh,php,html,htm,css,js,sql,json,vimrc set ts=4 sw=4 sts=4 et
"打开json时，用javascript的语法进行高亮显示
autocmd BufNewFile,BufRead *.json set filetype=javascript
"编码设定
set fileencoding=utf-8
set fileencodings=utf-8,gbk,utf-16,big5
set langmenu=zh_CN.UTF-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language messages zh_CN.UTF-8
"语法高亮
syntax on
"打开文件类型检测功能
filetype plugin indent on
if has("gui_running")
	if has("win32")
		au GUIEnter * simalt ~x
	endif
endif
"主题颜色设定
"colorscheme pyte
"colorscheme solarized
autocmd BufEnter * :syntax sync fromstart
"高亮当前行
set cursorline
"显示行号
set nu
"去掉有关vi一致性模式，避免以前版本的一些bug和局限
set nocompatible
"反向制表符中的空格数目
set shiftwidth=4
"指定tab缩进的字符数目
set tabstop=4
"解决shiftwidth和tabstop不等时的麻烦
set smarttab
"自动补全命令时候使用菜单式匹配列表
set wildmenu
"显示当点光标位置
set ruler
"使用鼠标
"set mouse=a
"状态栏显示参数 Format the status line
function! CurDir()
	let curdir = substitute(getcwd(), '/Users/lanffy/', "~/", "g")
	return curdir
endfunction
set statusline=\ %F%m%r%h\ %w\ \ PWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c\ \ \ %p%%
set laststatus=2
"命令行高度
set cmdheight=2
"光标移动到buffer的顶部和底部时保持三行差距
set scrolloff=3
"让 gvim 支持 Alt+n 来切换标签页
function! BufPos_Initialize()
	for i in range(0, 9)
		exe "map <M-" . i . "> " . i . "gt"
	endfor
endfunction
autocmd VimEnter * call BufPos_Initialize()
let g:LookupFile_MinPatLength = 2 "最少输入2个字符才开始查找
let g:LookupFile_PreserveLastPattern = 0 "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1 "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1 "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0 "不允许创建不存在的文件

"nomal模式下tab来切换窗口
nmap <tab> <C-W>w
"带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-


filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
"Plugin 'gmarik/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.












"Color schemes
"Plugin 'tomasr/molokai'
" All of your Plugins must be added before the following line
"call vundle#end()
filetype plugin indent on

