fun! BasicAbbreviations()
  iab wrt with respect to
  iabbrev otoh on the other hand
  iabbrev btw by the way
  iabbrev Wrt With respect to
  iabbrev Otoh On the other hand
  iabbrev Btw By the way
  iabbrev imo in my opinion
  iabbrev Imo in my opinion

  " I commonly fat-finger these ruby commands
  iabbrev 3nd end
  iabbrev ned end
  iabbrev od do
  iabbrev p[ []

  " some spelling mistakes not (yet) caught by autocorrect.vim
  iabbrev testamonial testimonial
  iabbrev testamonials testimonials
  iabbrev Testamonial Testimonial
  iabbrev Testamonials Testimonials

  iabbrev soultion solution
  iabbrev soultions solutions
  iabbrev Soultion Solution
  iabbrev Soultions Solutions

  iabbrev facililty facility
  iabbrev facilty facility

  iabbrev prenset present
  iabbrev Prenset Present

  iabbrev everythign everything
  iabbrev Everythign Everything

  iabbrev propogated propagated
  iabbrev Propogated Propagated

  iabbrev defecit deficit
  iabbrev Defecit Deficit

  " programming expansions
  iabbrev _pry require 'pry'; binding.pry
  iabbrev _fgc FactoryGirl.create
  iabbrev _saop save_and_open_page

  " Some helpful shortcuts
  iabbrev dtt <C-R>=strftime("%Y%m%d")<CR>
  iabbrev dts <C-R>=strftime("%Y%m%d - %H%M")<CR>
endfu
call BasicAbbreviations()
