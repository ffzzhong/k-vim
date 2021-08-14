" airline {{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1

" for coc, added by ffz
" enable/disable coc integration
let g:airline#extensions#coc#enabled = 1
" change error symbol
let airline#extensions#coc#error_symbol = 'E:'
" change warning symbol
let airline#extensions#coc#warning_symbol = 'W:'
" change error format
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
" change warning format
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
" end

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" }}}