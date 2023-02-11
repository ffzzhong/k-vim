let $LANG = 'en_US'
" Empty value to disable preview window altogether
" let g:fzf_preview_window = ''
" Always enable preview window on the right with 50% width
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
"
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
" let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" 让输入上方，搜索列表在下方
let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'

" function! OpenFloatingWin()
"     let height = &lines - 3
"     let width = float2nr(&columns - (&columns * 2 / 10))
"     let col = float2nr((&columns - width) / 2)

"     " 设置浮动窗口打开的位置，大小等。
"     " 这里的大小配置可能不是那么的 flexible 有继续改进的空间
"     let opts = {
"             \ 'relative': 'editor',
"             \ 'row': height * 0.3,
"             \ 'col': col + 30,
"             \ 'width': width * 2 / 3,
"             \ 'height': height / 2
"             \ }

"     let buf = nvim_create_buf(v:false, v:true)
"     let win = nvim_open_win(buf, v:true, opts)

"     " 设置浮动窗口高亮
"     call setwinvar(win, '&winhl', 'Normal:Pmenu')

"     setlocal
"             \ buftype=nofile
"             \ nobuflisted
"             \ bufhidden=hide
"             \ nonumber
"             \ norelativenumber
"             \ signcolumn=no
" endfunction
"
" 打开 fzf 的方式选择 floating window
let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.7 } }
" let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }


" 根据fzf.vim官网，优化Rg
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

nmap <Leader>? <plug>(fzf-maps-n)
xmap <Leader>? <plug>(fzf-maps-x)
omap <Leader>? <plug>(fzf-maps-o)

" 用惯了ag命令，实际上是在call Rg
nnoremap <Leader>rg :Rg<CR>
nnoremap <Leader>bs :Buffers<CR>
" modify by ffz, BTags 不常用，让给"跳转到tagbar具体位置", 2021.07.22
" nnoremap <Leader>t :BTags<CR>
" end 2021.07.22
"
" modify by ffz, 不常用，让给“一次复制，多次粘贴”, 2020.12.17
" nnoremap <C-p> :Files<CR>
" end 2020.12.17
nnoremap <Leader>m :Marks<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>l :BLines<CR>
" git commit for current buffer
nnoremap <Leader>co :BCommits<CR>
