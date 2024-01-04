"非兼容vi模式。去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set nocompatible
filetype off " required! turn off

"################### 插件管理 ###################
"inspired by spf13, 自定义需要的插件集合
if !exists('g:bundle_groups')
    let g:bundle_groups=['thrift', 'python', 'json', 'yaml', 'Jenkinsfile', 'terraform', 'ansible']
endif

"使用 vim-plug 管理插件
call plug#begin('~/.config/nvim/bundle')

"command-line fuzzy finder
"在 mac 上，先用 brew install fzf, 然后 Plug ‘/usr/local/opt/fzf’
" Plug '/usr/local/opt/fzf'
"如果不在 mac 上，可以用 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" autoformat
" Plug 'Chiel92/vim-autoformat'
"
" auto complete
" coc 是一个 language client，负责跟 language server 通信
" coc 提供的一些跟某个语言相关的插件，这些插件就是配置好的 language servers
" 比如 coc-python，coc-go，coc-yaml
" 都是用于提供相应语言的开箱即用的 language server
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}


"==========================================
" 高效编码必备插件
"==========================================
" 自动补全单引号，双引号等
Plug 'Raimondi/delimitMate'
" trailingwhitespace
" 快速去行尾空格 [, + <Space>]
Plug 'bronson/vim-trailing-whitespace'
" easymotion
"更高效的移动 [,, + w/fx/h/j/k/l]
Plug 'Lokaltog/vim-easymotion'
" quickscope
" 快速注释
Plug 'scrooloose/nerdcommenter'
" 快速加入修改环绕字符, 引号等
" for repeat -> enhance surround.vim, . to repeat command
Plug 'tpope/vim-repeat' | Plug 'tpope/vim-surround'
" 成对标签跳转
Plug 'vim-scripts/matchit.zip'
" rainbow
" 增强版括号显示，improved kien/rainbow_parentheses.vim
Plug 'luochen1990/rainbow'
" tagbar
Plug 'majutsushi/tagbar'
" 一次性关闭不用的buffer，节省内存
Plug 'Asheq/close-buffers.vim'
" Group dependencies, vim-snippets depends on ultisnips
" 代码片段快速插入 (snippets中,是代码片段资源,需要学习)
" Snippets are separated from the engine. Add this if you want them:
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" signature
" 显示marks - 方便自己进行标记和跳转
" m[a-zA-Z] add mark
" '[a-zA-Z] go to mark
" m<Space>  del all marks
" m/        list all marks
" m.        add new mark just follow previous mark
Plug 'kshenoy/vim-signature'
" git
" fugitive, fzf 的commits 需要fugitive
Plug 'tpope/vim-fugitive'
" vim-gitgutter 比fugitive 好用多了
Plug 'airblade/vim-gitgutter'
" 多光标选中编辑
" multiplecursors
Plug 'terryma/vim-multiple-cursors'
" text object
" 支持自定义文本对象
"Plug 'kana/vim-textobj-user'
Plug 'tomasr/molokai'

" color schemes
Plug 'rakr/vim-one'
Plug 'morhetz/gruvbox'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'tomasr/molokai'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'folke/tokyonight.nvim', {'as': 'tokyonight'}

" airline
" 状态栏增强展示
" Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" 加快 jk move
Plug 'rainbowhxch/accelerated-jk.nvim'

" 文件树
" nerdtree nerdtreetabs
" Plug 'preservim/nerdtree' |
"             \ Plug 'Xuyuanp/nerdtree-git-plugin' |
"             \ Plug 'ryanoasis/vim-devicons'

if count(g:bundle_groups, 'python')
    let g:python3_host_prog = '~/.pyenv/shims/python'
endif

if count(g:bundle_groups, 'golang')
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
endif

if count(g:bundle_groups, 'Jenkinsfile')
    " add by ffz
    " recognize Jenkinsfile as a groovy script
    Plug 'martinda/Jenkinsfile-vim-syntax'
endif

if count(g:bundle_groups, 'thrift')
    Plug 'solarnz/thrift.vim'
endif

if count(g:bundle_groups, 'ansible')
    Plug 'pearofducks/ansible-vim'
    let g:coc_filetype_map = {'yaml.ansible': 'ansible'}
endif


Plug 'camspiers/animate.vim'
" Plug 'camspiers/lens.vim'
Plug 'ipod825/lens.vim', {'branch': 'fixfilter'}

" Plug 'neovim/nvim-lspconfig'

Plug 'lukas-reineke/indent-blankline.nvim'

call plug#end()
