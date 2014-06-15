fun! TeXAbbreviations()
    iab ... \ldots
    iab dh. d.~h.
    iab eg. e.~g.
    iab oä. o.~ä.
    iab zb. z.~B.
    iab ua. u.~a.
    iab S.  S.~<C-R>
endfun
autocmd! filetype noweb,rnoweb,tex call TeXAbbreviations()

fun! MailAbbreviations()
    iab addr Beckhausstr. 11, c/o Stefan Ickler, 44892 Bochum<C-R>
endf
autocmd! filetype mail,eml call MailAbbreviations()

fun! BasicAbbreviations()
  iab wrt with respect to
  iab otoh on the other hand
  iab btw by the way
  iab Wrt With respect to
  iab Otoh On the other hand
  iab Btw By the way
  iab imo in my opinion
  iab Imo in my opinion

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
  iab dtt <C-R>=strftime("%Y%m%d")<CR>
  iab dts <C-R>=strftime("%Y%m%d - %H%M")<CR>
endfu
call BasicAbbreviations()
