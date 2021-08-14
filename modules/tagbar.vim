" tagbar {{{
let g:tagbar_autofocus = 1
" let g:tagbar_autoshowtag = 1
" let g:tagbar_show_visibility = 1

" add by ffz, 使用<leader>t 快速跳转到tagbar具体位置, 2021.07.22
noremap <silent> <Leader>t :TagbarOpen fj<cr>
" end 2021.07.22

" add by ffz, 2021-07-22
" by default tagbar will be sorted according to name, so disable it
let g:tagbar_sort = 0
" end 2021-07-22


" go语言的tagbar配置
" 1. install gotags 'go get -u github.com/jstemmer/gotags'
" 2. make sure `gotags` in you shell PATH, you can call check it with `which gotags`
" for gotags. work with tagbar
let g:tagbar_type_go = {
            \ 'ctagstype' : 'go',
            \ 'kinds'     : [
            \ 'p:package',
            \ 'i:imports:1',
            \ 'c:constants',
            \ 'v:variables',
            \ 't:types',
            \ 'n:interfaces',
            \ 'w:fields',
            \ 'e:embedded',
            \ 'm:methods',
            \ 'r:constructor',
            \ 'f:functions'
            \ ],
            \ 'sro' : '.',
            \ 'kind2scope' : {
            \ 't' : 'ctype',
            \ 'n' : 'ntype'
            \ },
            \ 'scope2kind' : {
            \ 'ctype' : 't',
            \ 'ntype' : 'n'
            \ },
            \ 'ctagsbin'  : 'gotags',
            \ 'ctagsargs' : '-sort -silent'
            \ }
" }}}
