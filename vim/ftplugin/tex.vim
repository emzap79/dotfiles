" vim:fdm=marker

" =============================================================================
" File: ftplugin/tex.vim
" Description: Provide foldexpr and foldtext for TeX files
" Author: Matthias Vogelgesang <github.com/matze>
"
" =============================================================================
"
if exists("b:did_ftplugin")
  finish
endif

let b:did_ftplugin = 1

" Globals      " {{{1

if !exists('g:tex_fold_sec_char')
    let g:tex_fold_sec_char = '➜'
endif

if !exists('g:tex_fold_env_char')
    let g:tex_fold_env_char = '✎'
endif

if !exists('g:tex_fold_override_foldtext')
    let g:tex_fold_override_foldtext = 1
endif

if !exists('g:tex_fold_allow_marker')
    let g:tex_fold_allow_marker = 1
endif

" Fold options " {{{1

setlocal foldmethod=expr
setlocal foldexpr=TeXFold(v:lnum)

if g:tex_fold_override_foldtext
    setlocal foldtext=TeXFoldText()
endif

" Functions    " {{{1

" " texfold    " {{{
"
" function! TeXFold(lnum)
"     let line = getline(a:lnum)
"
"     if line =~ '^\s*\\section'
"         return '>1'
"     endif
"
"     if line =~ '^\s*\\subsection'
"         return '>2'
"     endif
"
"     if line =~ '^\s*\\subsubsection'
"         return '>3'
"     endif
"
"     if line =~ '^\s*\\begin{frame'
"         return 'a1'
"     endif
"
"     if line =~ '^\s*\\end{frame'
"         return 's1'
"     endif
"
"     if g:tex_fold_allow_marker
"         if line =~ '^[^%]*%[^{]*{{{'
"             return 'a1'
"         endif
"
"         if line =~ '^[^%]*%[^}]*}}}'
"             return 's1'
"         endif
"     endif
"
"     return '='
" endfunction
"
" function! TeXFoldText()
"     let fold_line = getline(v:foldstart)
"
"     if fold_line =~ '^\s*\\\(sub\)*section'
"         let pattern = '\\\(sub\)*section{\([^}]*\)}'
"         let repl = ' ' . g:tex_fold_sec_char . ' \2'
"     elseif fold_line =~ '^\s*\\begin'
"         let pattern = '\\begin{\([^}]*\)}'
"         let repl = ' ' . g:tex_fold_env_char . ' \1'
"     elseif fold_line =~ '^[^%]*%[^{]*{{{'
"         let pattern = '^[^{]*{' . '{{\([.]*\)'
"         let repl = '\1'
"     endif
"
"     let line = substitute(fold_line, pattern, repl, '') . ' '
"     return '+' . v:folddashes . line
" endfunction
"
" "}}}
"
" " TeXFold"}}}
" undo filetype" {{{2

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= "|setl foldexpr< foldmethod< foldtext<"
else
  let b:undo_ftplugin = "setl foldexpr< foldmethod< foldtext<"
endif

" insert \item " {{{2

" " http://stackoverflow.com/a/2551652
function! CR()
    if searchpair('\\begin{itemize}', '', '\\end{itemize}', '') || searchpair('\\begin{enumerate}', '', '\\end{enumerate}', '')
        return "\r\\item "
    elseif searchpair('\\begin{description}', '', '\\end{description}', '')
        return "\r\\item["
    elseif searchpair('\\begin{align}', '', '\\end{align}', '') || searchpair('\\begin{align\*}', '', '\\end{align\*}', '')
        return "\r\&"
    elseif searchpair('\\begin{acronym}', '', '\\end{acronym}', '')
        return "\racro"
    endif
    return "\r"
endfunction
inoremap <expr><buffer> <CR> CR()

" insert \item"}}}

