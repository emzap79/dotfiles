" recognize .markdown files
" http://stackoverflow.com/a/23279293/3569509
if has("autocmd")
    " au BufNewFile,BufRead *.markd*,*.md,*.mkd set filetype=markdown
    au BufWritePre,BufNewFile,BufRead *.markd*,*.md,*.mkd set filetype=markdown
endif
