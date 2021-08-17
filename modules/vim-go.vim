" vim-go {{{
" 依然保持vim-go的gopls 打开，因为展示文档，语法高亮和其他功能依然需要gopls
" 但关闭vim-go的其他功能，比如completion，diagnostics，因为coc已经做了
let g:go_def_mapping_enabled = 0
let g:go_code_completion_enabled = 0
let g:go_fmt_autosave = 0
let g:go_imports_autosave = 0
let g:go_diagnostics_enabled = 0
let g:go_diagnostics_level = 0
let g:go_mod_fmt_autosave = 0
let g:go_asmfmt_autosave = 0
let g:go_echo_go_info = 0
let g:go_metalinter_enabled = 0
let g:go_metalinter_autosave = 0
let g:go_term_enabled = 0
let g:go_gopls_enabled = 1
"
" format with goimports instead of gofmt
" let g:go_fmt_command = "goimports"

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

" let g:go_addtags_transform = "camelcase"
" let g:go_list_type = "quickfix"

" let g:go_fmt_fail_silently = 1

" let g:go_auto_sameids = 1

" let g:go_auto_type_info = 1
" use <leader>gi to show go types
" nnoremap <Leader>gi :GoInfo<CR>
"
" use <leader>gt to show go types
" nnoremap <Leader>gt :GoTest<CR>

" add by ffz 2021-02-20 19:16
" show indent line when using Yggdroot/indentLine
" https://github.com/Yggdroot/indentLine/issues/210
" set list lcs=tab:\¦\ 
" }}}
