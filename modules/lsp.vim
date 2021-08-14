lua << EOF
require'lspconfig'.gopls.setup{}
require'lspconfig'.pyright.setup{}
EOF

nnoremap <silent><leader>jr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent><leader>jd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent><leader>ac <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent><leader>ep <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent><leader>en <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
