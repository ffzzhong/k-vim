" 关闭方向键, 强迫自己用 hjkl
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

"Treat long lines as break lines (useful when moving around in them)
"se swap之后，同物理行上线直接跳
" nnoremap k gk
" nnoremap gk k
" nnoremap j gj
" nnoremap gj j

"==========================================
" F区功能键设置
"==========================================
" F2 行号开关
" 为方便复制，用<F2>开启/关闭行号显示:
function! HideNumber()
  if(&relativenumber == &number)
    set relativenumber! number!
  elseif(&number)
    set number!
  else
    set relativenumber!
  endif
  set number?
endfunc
nnoremap <F2> :call HideNumber()<CR>
" F3 项目结构开关
nnoremap <F3> :NERDTreeToggle<CR>
" F4 tagbarToggle
nnoremap <F4> :TagbarToggle<CR>
" F5 快速运行
map <F5> :QuickRun<CR>
" F6 语法开关，关闭语法可以加快大文件的展示
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>
" F9 显示打印字符开关
nnoremap <F9> :set list! list?<CR>
" F10 换行开关
nnoremap <F10> :set wrap! wrap?<CR>

" disbale paste mode when leaving insert mode
au InsertLeave * set nopaste

" 在 insert mode 模式下，粘贴代码时，自动设置 past mode
" Automatically set paste mode in Vim when pasting in insert mode
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()


" 分屏窗口移动, Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


" http://stackoverflow.com/questions/13194428/is-better-way-to-zoom-windows-in-vim-than-zoomwin
" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <Leader>z :ZoomToggle<CR>


" Go to home and end using capitalized directions
noremap H ^
noremap L $


" Map ; to : and save a million keystrokes 用于快速进入命令行
nnoremap ; :


" 命令行模式增强，ctrl - a到行首， -e 到行尾
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" 搜索相关
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
" 进入搜索Use sane regexes"
nnoremap / /\v
vnoremap / /\v

" 去掉搜索高亮
noremap <silent><leader>/ :nohls<CR>

" 添加新行，但不进入insert模式
nnoremap al o<ESC>

" switch # *
nnoremap # *
nnoremap * #

"==========================================
" tab/buffer 相关
"==========================================
" 切换前后buffer
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>
" 使用方向键切换buffer
noremap <left> :bp<CR>
noremap <right> :bn<CR>

" tab 操作
" http://vim.wikia.com/wiki/Alternative_tab_navigation
" http://stackoverflow.com/questions/2005214/switching-to-a-particular-tab-in-vim

" add by ffz, 很少使用，注释掉， 2021.07.23
" tab切换
" map <leader>th :tabfirst<cr>
" map <leader>tl :tablast<cr>
" end 2021.07.23

nnoremap [t :tabprev<cr>
nnoremap ]t :tabnext<cr>

" add by ffz, 修改原有的key mapping, 2021.07.23
" tab create
map <leader>tc :tabnew<cr>
" map <leader>tc :tabclose<cr>
" end 2021.07.23

" normal模式下切换到确切的tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Toggles between the active and last active tab "
" The first tab is always 1 "
let g:last_active_tab = 1
" nnoremap <leader>gt :execute 'tabnext ' . g:last_active_tab<cr>
" nnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
" vnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
nnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
autocmd TabLeave * let g:last_active_tab = tabpagenr()

" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv

" y$ -> Y Make Y behave like other capitals
map Y y$

" add by ffz 2021-02-20 18:54
" yank a region in vim without the cursor moving to the top of the block
" 复制选中区到系统剪切板中
" vnoremap <leader>y "+ygv<Esc>

" Keep search pattern at the center of the screen.
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" auto jump to end of select
" vnoremap <silent> y y`]
" vnoremap <silent> p p`]
" nnoremap <silent> p p`]

" add by ffz 2021-02-20 18:49
" yank a region in vim without the cursor moving to the top of the block
" https://stackoverflow.com/questions/3806629/yank-a-region-in-vim-without-the-cursor-moving-to-the-top-of-the-block
" adjust <leader>y as well
" vnoremap y ygv<Esc>

" add by ffz, 2020.12.17
" 一次复制，多次粘贴
nnoremap <silent> <C-p> viw"0p
" end 2020.12.17

" select all
map <Leader>sa ggVG

" 选中并高亮最后一次插入的内容
nnoremap gv `[v`]

" select block
" nnoremap <leader>v V`}

" w!! to sudo & write a file
cmap w!! w !sudo tee >/dev/null %

" kj 替换 Esc
inoremap kj <Esc>
inoremap jk <Esc>


" 滚动Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" Quickly close the current window
nnoremap <leader>q :q<CR>

" Quickly save the current file
nnoremap <leader>w :w<CR>

" Quickly save and close
nnoremap <leader>wq :wq<CR>

" mark 相关
" 交换 ' `, 使得可以快速使用'跳到marked位置
nnoremap ' `
nnoremap ` '
" delete 所有marks
nnoremap <leader>dm :delmarks!<CR>

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" window resize
nnoremap <silent> <leader>[ :vertical resize -8<CR>
nnoremap <silent> <leader>] :vertical resize +8<CR>
