nnoremap <F7> :set operatorfunc=GrepOperator<cr>g@
vnoremap <F7> :<c-u>call GrepOperator(visualmode())<cr>

function! GrepOperator(type)
    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        return
    endif

    silent execute "grep! -R " . shellescape(@@) . " ."
    copen
endfunction

" " count spaces as seen at :h map-operator
" nmap <silent> <f7> :set opfunc=CountSpaces<CR>g@
" vmap <silent> <f7> :<C-U>call CountSpaces(visualmode(), 1)<CR>

" function! CountSpaces(type, ...)
    " let sel_save = &selection
    " let &selection = "inclusive"
    " let reg_save = @@

    " if a:0  " Invoked from Visual mode, use '< and '> marks.
        " silent exe "normal! `<" . a:type . "`>y"
    " elseif a:type == 'line' 
        " silent exe "normal! '[V']y"
    " elseif a:type == 'block'
        " silent exe "normal! `[\<C-V>`]y"
    " else
        " silent exe "normal! `[v`]y"
    " endif

    " echomsg strlen(substitute(@@, '[^ ]', '', 'g'))

    " let &selection = sel_save
    " let @@ = reg_save
" endfunction
