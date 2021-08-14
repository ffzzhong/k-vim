" nerdtree nerdtree-git-plugin {{{
map <leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$', '__pycache__']
"prevents NERDTree from hiding when first selecting a file."
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" s/v 分屏打开文件
let g:NERDTreeMapOpenSplit = 's'
let g:NERDTreeMapOpenVSplit = 'v'
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"" 设置nerdtree宽度
"" let g:NERDTreeWinSize=30
"" Anchor file in tree "
nmap <Leader>a :NERDTreeFind<CR>

""" add by ffz, 2021.07.29
 """在nerdtree里面自动高亮当前文件: https://codeyarns.com/tech/2014-05-05-how-to-highlight-current-file-in-nerdtree.html
 """Check if NERDTree is open or active
 ""function IsNERDTreeOpen()
     ""return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
 ""endfunction
 """ Call NERDTreeFind if NERDTree is active, current window contains a modifiable
 """ file, and we're not in vimdiff
 ""function SyncTree()
     ""if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
         ""NERDTreeFind
         ""wincmd p
     ""endif
 ""endfunction
 """Highlight currently open buffer in NERDTree
 ""autocmd BufEnter * call SyncTree()
""" " end 2021.07.29
""
" nerdtree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'☒',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'✭',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

let g:NERDTreeGitStatusUseNerdFonts = 1
" let g:NERDTreeGitStatusShowClean = 1
" let g:NERDTreeGitStatusConcealBrackets = 1
" }}}
