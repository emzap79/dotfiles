" vim:fdm=marker
" LaTeX
" Tex-Specific Config"{{{

" tex specific settings"{{{

let g:autoclose = 1
let g:Tex_SmartKeyQuote = 1
let g:tex_flavor='latex'
" let g:tex_indent_items = 1
" let b:loaded_tex_autoclose = 1
setlocal efm+=%E%f:%l:\ %m  " errorformat
setlocal grepprg=grep\ -nH\ $*

"}}}
" syntax-highlighting"{{{

" make vim recognize correct filetype & syntax
" (may lead to performance issues!!)
" au BufEnter *.tex,*.sty syntax on  " setting correct syntax
" au BufEnter *.tex,*.sty set filetype=tex  " make vim recognize correct filetype
" au BufEnter *.tex,*.sty set syntax=tex  " setting correct syntax

"}}}
" fasten up vim when in tex"{{{

" au BufEnter *.tex,*.sty nosm  " showmatch
" au BufEnter *.tex,*.sty set nornu         " http://stackoverflow.com/a/9753149
au BufEnter *.tex,*.sty set nocul         " https://bbs.archlinux.org/viewtopic.php?pid=1357535#p1357535
au BufEnter *.tex,*.sty set noaw    " disable autowrite

"}}}
" dictionaries"{{{

set dictionary+=~/.vim/dictionaries/tex.dict

"}}}

"}}}
" Mappings, Functions & Abbreviations"{{{

" Keybindings"{{{

nnoremap <leader>ab :split<CR>:buffer abbrev.tex<CR>
vnoremap <leader>ab <ESC>:split<CR>:buffer abbrev.tex<CR>

"itemizing full paragraph
nnoremap <leader>it {jV}:s/^../\\item &/<cr>{jV}k<cr>
inoremap <localleader>it \item<space>
nnoremap <leader>gq ?^$\\|^\s*\(\\begin\\|\\end\\|\\label\\|\\documentclass\\|\\usepackage\\|\\paragraph\\item\)?1<CR>gq//+1<CR>

" paragraph formatting 
nnoremap <leader>lp ?^$\\|^\s*\(\\begin\\|\\end\\|\\label\)?1<CR>//-1<CR>.<CR>

""}}}
" Functions "{{{

" " " automatically add new \item when newline"{{{

" " " http://stackoverflow.com/a/2551652
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

""}}}

"functions"}}}
""}}}
