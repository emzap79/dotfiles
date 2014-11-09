" Filetypedetect
" recognize .textmpl files
if has("autocmd")
    au! BufRead,BufNewFile *.textmpl   setf textmpl
endif
