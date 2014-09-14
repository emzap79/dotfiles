fun! TexAbbreviations()
    iab ... \ldots
    iab (...) (\ldots)
    iab s. S.~<C-R>
endfun
" Call Function Texabbrevs
au! filetype tex call TexAbbreviations()

fun! MailAbbreviations()
    iab addr Beckhausstr. 11, c/o Stefan Ickler, 44892 Bochum<C-R>
    iab vg Viele Grüße,
                \<CR>Jonas <C-R>
    iab lg Liebe Grüße,
                \<CR>Jonas <C-R>
    iab bg Beste Grüße,
                \<CR>Jonas <C-R>
    iab mfg Mit freundlichen Grüßen,
                \<CR>Jonas <C-R>
    iab fg Freundliche Grüßen,
                \<CR>Jonas <C-R>
endf
call MailAbbreviations()

fun! BasicAbbreviations()

    " german spelling
    iab ANleger Anleger
    iab Finanzinsitutionen Finanzinstitutionen
    iab Abwärtsbeweung Abwärtsbewegung

    """ abbreviations
    iab va v.~a.
    iab uu u.~U.
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

    iab bzw bzw.
    iab eigtl eigtl.
    iab bspw bspw.
    iab usw usw.
    iab etc etc.
    iab vgl vgl.
    iab bzgl bzgl.
    iab Punkt Punkt~<C-R>

    iab dont don't
    iab wrt with respect to
    iab otoh on the other hand
    iab btw by the way
    iab Wrt With respect to
    iab Otoh On the other hand
    iab Btw By the way
    iab imo in my opinion
    iab Imo in my opinion
    iab fyi for your information

  " I commonly fat-finger these ruby commands
  iab 3nd end
  iab ned end
  iab od do
  iab p[ []

  " some spelling mistakes not (yet) caught by autocorrect.vim
  iab testamonial testimonial
  iab testamonials testimonials
  iab Testamonial Testimonial
  iab Testamonials Testimonials

  iab soultion solution
  iab soultions solutions
  iab Soultion Solution
  iab Soultions Solutions

  iab facililty facility
  iab facilty facility

  iab prenset present
  iab Prenset Present

  iab everythign everything
  iab Everythign Everything

  iab propogated propagated
  iab Propogated Propagated

  iab defecit deficit
  iab Defecit Deficit

  " programming expansions
  iab _pry require 'pry'; binding.pry
  iab _fgc FactoryGirl.create
  iab _saop save_and_open_page

  " Some helpful shortcuts
  iab dtt <C-R>=strftime("%Y-%m-%d")<CR>
  iab dts <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>
endfu
