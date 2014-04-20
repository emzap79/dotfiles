" folding for tex files
"
" written by Roman Bertle 2001
"
" partly inspired by fortran.vim and by Stefan Römer

if version >= 600 && exists("tex_fold")

  syn sync fromstart
  syn region texPartFold transparent fold keepend start="^[^%]\{-}\\part\>" end="\n\ze[^%]\{-}\\\(part\>\|end\s*{\s*document\*}\)"
  syn region texChapterFold transparent fold keepend start="^[^%]\{-}\\chapter\>" end="\n\ze[^%]\{-}\\\(part\>\|chapter\>\|end\s*{\s*document\s*}\)"
  syn region texSectionFold transparent fold keepend start="^[^%]\{-}\\section\>" end="\n\ze[^%]\{-}\\\(part\>\|chapter\>\|section\>\|end\s*{\s*document\s*}\)"
  syn region texSubsectionFold transparent fold keepend start="^[^%]\{-}\\subsection\>" end="\n\ze[^%]\{-}\\\(part\>\|chapter\>\|\(sub\)\=section\>\|end\s*{\s*document\s*}\)"
  syn region texSubsubsectionFold transparent fold keepend start="^[^%]\{-}\\subsubsection\>" end="\n\ze[^%]\{-}\\\(part\>\|chapter\>\|\(sub\)*section\>\|end\s*{\s*document\s*}\)"
  syn region texParagraphFold transparent fold keepend start="^[^%]\{-}\\paragraph\>" end="\n\ze[^%]\{-}\\\(part\>\|chapter\>\|\(sub\)*section\>\|paragraph\>\|end\s*{\s*document\s*}\)"
  syn region texSubparagraphFold transparent fold keepend start="^[^%]\{-}\\subparagraph" end="\n\ze[^%]\{-}\\\(part\|chapter\>\|\(sub\)*section\>\|\(sub\)\=paragraph\>\|end\s*{\s*document\s*}\)"

  if exists("tex_fold_environments")

    syn region texEnvironment transparent fold keepend extend start="^[^%]\{-}\\begin\s*{\s*\z(\w*\*\=\)\s*}" end="^[^%]\{-}\\end\s*{\s*\z1\s*}"
    " In addition we fold also the tex form of the comment environment
    syn region texCommentCommand transparent fold keepend extend start="^[^%]\{-}\\comment" end="^[^%]\{-}\\endcomment"

  else

    " abstract, theindex and thebibliography are always folded
    syn region texAbstract transparent fold keepend extend start="^[^%]\{-}\\begin\s*{\s*abstract\s*}" end="^[^%]\{-}\\end\s*{\s*abstract\s*}"
    syn region texTheindex transparent fold keepend extend start="^[^%]\{-}\\begin\s*{\s*theindex\s*}" end="^[^%]\{-}\\end\s*{\s*theindex\s*}"
    syn region texThebibliography transparent fold keepend extend start="^[^%]\{-}\\begin\s*{\s*thebibliography\s*}" end="^[^%]\{-}\\end\s*{\s*thebibliography\s*}"

  endif

  if exists("tex_fold_multilinecomments")
    syn match texMultiCommentLines transparent fold "\(^\s*%.*\(\n\|\%$\)\)\{4,}"
  endif

endif
