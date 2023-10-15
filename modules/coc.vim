set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" update by ffz, 2020.12.24
" use tab for trigger completion, completion confirm, snippet expand and jump like VSCode.
" check coc-snipp doc
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()

inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" " Use <leader>x for convert visual selected code to snippet
xmap <leader>x <Plug>(coc-convert-snippet)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<C-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<C-k>'
" end 2020.12.24

" update by ffz, use ctrl + j/k to move up/down when choosing a completion item
inoremap <expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
inoremap <expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"


" open yank list
nnoremap <silent> <leader>ya  :<C-u>CocFzfList yank<cr>

" diagnostics
nmap <silent> [e <Plug>(coc-diagnostic-prev)
nmap <silent> ]e <Plug>(coc-diagnostic-next)
" nnoremap <silent> <Leader>es :CocDiagnostics<CR>
nnoremap <silent> <Leader>es  :CocFzfList diagnostics<cr>

" GoTo code navigation.
nmap gd <Plug>(coc-definition)
nmap gt <Plug>(coc-type-definition)
nmap gi <Plug>(coc-implementation)
nmap gr <Plug>(coc-references)
" usage:
" go the difinition with vsplit if the definition is in another file
" and if the definition is just in the same file, then only move the cursor
" check this article
" https://ramgo.li/posts/coc.nvim_split_if_not_open/
" and the github issue: https://github.com/neoclide/coc.nvim/issues/586,
" check the comment: https://github.com/neoclide/coc.nvim/issues/586#issuecomment-701711012
function! SplitIfNotOpen(...)
    let fname = a:1
    let call = ''
    if a:0 == 2
    let fname = a:2
    let call = a:1
    endif
    let bufnum=bufnr(expand(fname))
    let winnum=bufwinnr(bufnum)
    if winnum != -1
    " Jump to existing split
    exe winnum . "wincmd w"
    else
    " Make new split as usual
    exe "vsplit " . fname
    endif
    " Execute the cursor movement command
    exe call
endfunction

command! -nargs=+ CocSplitIfNotOpen :call SplitIfNotOpen(<f-args>)

" add by ffz, 2020.11.24
" let g:coc_fzf_preview = ''
let g:coc_fzf_opts = []
" end 2020.11.24

" Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   elseif (coc#rpc#ready())
"     call CocActionAsync('doHover')
"   else
"     execute '!' . &keywordprg . " " . expand('<cword>')
"   endif
" endfunction

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" update by ffz 2021-02-18 08:51, use coc.preference.formatOnSaveFileTypes
" Add `:Format` command to format current buffer.
" command! -nargs=0 Format :call CocAction('format')

" update by ffz 2021-02-18 08:51, use coc.preference.formatOnSaveFileTypes
" auto formating when saving, modified by ffz
" let blacklist = ['html.mustache', 'template', 'md', 'markdown.mkd']
" let whitelist = ['go', 'py', 'yaml', 'json']
" au BufWrite * if index(whitelist, &ft) >= 0 | call CocAction('format')

" applying codeaction to the selected region.
" example: `<leader>aap` for current paragraph
xmap <leader>ac  <plug>(coc-codeaction-selected)
nmap <leader>ac  <plug>(coc-codeaction-selected)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)


"" coc-explorer
augroup MyCocExplorer
    " autocmd!
    " autocmd VimEnter * sil! au! F
    " set window status line
    autocmd FileType coc-explorer setl statusline=File-Explorer
    "quit explorer whein it's the last
    autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
    " " Make sure nothing opened in coc-explorer buffer
    " autocmd BufEnter * if bufname('#') =~# "\[coc-explorer\]-." && winnr('$') > 1 | b# | endif

    " have vim start coc-explorer if vim started with folder
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'CocCommand explorer' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

    " " open if directory specified or if buffer empty
    " autocmd VimEnter * let d = expand('%:p')
    "     \ | if argc() == 0
    "     \ | exe 'CocCommand explorer --sources buffer+,file+'
    "     \ | elseif isdirectory(d) || (bufname()=='')
    "     \ | silent! bd
    "     \ | exe 'CocCommand explorer --sources buffer+,file+ ' . d
    "     \ | exe 'cd ' . d
    "     \ | else
    "     \ | cd %:p:h
    "     \ | endif
    " " cd after open
    autocmd User CocExplorerOpenPost let dir = getcwd() | call CocActionAsync("runCommand", "explorer.doAction", "closest", {"name": "cd", "args": [dir]})
augroup END

nnoremap <leader>n :CocCommand explorer --toggle --no-focus<CR>
" nnoremap <leader>a <Cmd>call CocAction('runCommand', 'explorer.doAction', 'closest', ['reveal:0'], [['relative', 0, 'file']])<CR>
"
"
" coc-go
" add missing imports on save
autocmd BufWritePre *.go,*.py :silent! call CocAction('runCommand', 'editor.action.organizeImport')
" autocmd BufWritePre *.py silent! :call CocAction('runCommand', 'python.sortImports')
" autocmd BufWrite *.py :CocCommand python.sortImports
