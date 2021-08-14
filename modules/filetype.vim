"==========================================
" FileType Settings  文件类型设置
"==========================================
" for # indent, python文件中输入新行时#号注释不切回行首
autocmd BufNewFile,BufRead *.py inoremap # X<c-h>#

" 具体编辑文件类型的一般设置，比如不要 tab 等
autocmd FileType ruby,javascript,html,css,xml,json,proto set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
" modify by ffz
autocmd FileType yaml set tabstop=4 shiftwidth=4 softtabstop=4 expandtab ai
" end
autocmd BufRead,BufNewFile *.md,*.mkd,*.markdown set filetype=markdown.mkd
autocmd BufRead,BufNewFile *.part set filetype=html
autocmd BufRead,BufNewFile *.template set filetype=template
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
" modify by ffz, add config for ruby
autocmd BufRead,BufNewFile Appraisals set filetype=ruby

" disable showmatch when use > in php
au BufWinEnter *.php set mps-=<:>


" 设置可以高亮的关键字
if has("autocmd")
  " Highlight TODO, FIXME, NOTE, etc.
  if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
  endif
endif
