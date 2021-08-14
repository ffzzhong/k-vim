" vim-go {{{
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient: coc
let g:go_def_mapping_enabled = 0
"
" format with goimports instead of gofmt
let g:go_fmt_command = "goimports"
let g:go_addtags_transform = "camelcase"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_version_warning = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

let g:godef_split=2

" let g:go_auto_sameids = 1

let g:go_fmt_fail_silently = 1
" let g:go_auto_type_info = 1
" use <leader>gi to show go types
" nnoremap <Leader>gi :GoInfo<CR>
"
" use <leader>gt to show go types
nnoremap <Leader>gt :GoTest<CR>

" add by ffz 2021-02-20 19:16
" show indent line when using Yggdroot/indentLine
" https://github.com/Yggdroot/indentLine/issues/210
" set list lcs=tab:\¦\ 
" }}}