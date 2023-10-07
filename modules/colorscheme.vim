" enable true color
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" 防止tmux下vim的背景色显示异常
" Refer: http://sunaku.github.io/vim-256color-bce.html
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" Set extra options when running in GUI mode
if has("gui_running")
    set guifont=Monaco:h14
    if has("gui_gtk2")   "GTK2
        set guifont=Monaco\ 12,Monospace\ 12
    endif
    set guioptions-=T
    set guioptions+=e
    set guioptions-=r
    set guioptions-=L
    set guitablabel=%M\ %t
    set showtabline=1
    set linespace=2
    set noimd
endif

" gruvbox, true color
" set background=dark
" let $BAT_THEME="gruvbox-dark"
" let g:airline_theme='gruvbox'
" " 增强对比度
" " let g:gruvbox_contrast_dark='hard'
" " 允许斜体
" let g:gruvbox_italic=1
" " visual 模式下的颜色
" let g:gruvbox_invert_selection=0
" " 这个用来 override 侧边栏语法错误和告警的样式, enable 可能导致 crash
" let g:gruvbox_invert_signs=0
" let g:gitgutter_override_sign_column_highlight=1
" " 这个是用来移除vertical split 的那条线
" " set fillchars+=vert:\ 
" colorscheme gruvbox
" " 每次新打开 vim 时就会有很多空行, 这个设置可以用来隐藏空行的波浪线~，
" highlight EndOfBuffer guifg=bg
"
" one
" set background=dark
" let g:one_allow_italics=1
" let g:airline_theme='one'
" colorscheme one
"
" vim-hybrid-material
" 虽然和 iterm material-design-colors 是一体，但是和 iterm one half 更好看
 " let g:enable_bold_font = 1
 " let g:enable_italic_font = 1
 " let g:hybrid_transparent_background = 1
 " let g:airline_theme = "hybrid"
 " colorscheme hybrid_material
 " colorscheme hybrid_reverse
"
" molokai
 " colorscheme molokai
 "
" catppuccin
set background=dark
let g:airline_theme = 'catppuccin'
colorscheme catppuccin " catppuccin catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

" tokyonight
" set background=dark
" let g:airline_theme = "tokyonight"
" colorscheme tokyonight-moon " tokyonight tokyonight-night tokyonight-storm tokyonight-day tokyonight-moon
