fun! TexAbbreviations()
    iab ... \ldots
    iab (...) (\ldots)
    iab s. S.~<C-R>

    """ abbreviations
    iab va v.~a.
    iab idr i.~d.~R.
    iab uu u.~U.
    iab zb z.~b.
    iab Zb Z.~b.
    iab dh d.~h.
    iab Dh D.~h.
    iab eg e.~g.
    iab Eg E.~g.
    iab oä o.~ä.
    iab Oä O.~ä.
    iab zb z.~B.
    iab Zb Z.~B.
    iab ua u.~a.
    iab Ua U.~a.

endfun
" Call Function Texabbrevs
au! filetype tex,latex call TexAbbreviations()

fun! MailAbbreviations()
    " iab addr Beckhausstr. 11, c/o Stefan Ickler, 44892 Bochum<C-R>
    iab addr Dellplatz 7, c/o Zimmer 316, 47051 Duisburg<C-R>
    iab sgdh Sehr geehrte Damen und Herren<C-R>,
    iab sgh Sehr geehrter Herr<C-R>,
    iab sgf Sehr geehrte Frau<C-R>,
    iab gr Gruß Jonas <C-R>
    iab vg Viele Grüße
                \<CR><CR>Jonas <C-R>
    iab lg Liebe Grüße
                \<CR><CR>Jonas <C-R>
    iab bg Beste Grüße
                \<CR><CR>Jonas <C-R>
    iab mfg Mit freundlichen Grüßen
                \<CR><CR>Jonas Petong<CR><CR><C-R>
    iab fg freundliche Grüße
                \<CR><CR>Jonas Petong<CR><CR><C-R>
endf
call MailAbbreviations()


