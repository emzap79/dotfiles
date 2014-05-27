" count spaces as seen at :h map-operator
nmap <silent> gc :set opfunc=CountSpaces<CR>g@
vmap <silent> gc :<C-U>call CountSpaces(visualmode(), 1)<CR>

function! CountSpaces(type, ...)
    let sel_save = &selection
    let &selection = "inclusive"
    let reg_save = @@

    if a:0  " Invoked from Visual mode, use '< and '> marks.
        silent exe "normal! `<" . a:type . "`>y"
    elseif a:type == 'line'
        silent exe "normal! '[V']y"
    elseif a:type == 'block'
        silent exe "normal! `[\<C-V>`]y"
    else
        silent exe "normal! `[v`]y"
    endif

    echomsg strlen(substitute(@@, '[^ ]', '', 'g'))

    let &selection = sel_save
    let @@ = reg_save
endfunction
