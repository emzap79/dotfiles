" LaTeX
" Tex-Specific Config
" dictionaries"{{{

set dictionary+=~/.vim/dictionaries/tex.dict

"}}}
" tex specific settings"{{{

let g:autoclose = 1
let g:Tex_SmartKeyQuote = 1
let g:tex_flavor='latex'
" let g:tex_indent_items = 1
" let b:loaded_tex_autoclose = 1
setlocal efm+=%E%f:%l:\ %m
set grepprg=grep\ -nH\ $*

"}}}
" syntax-highlighting"{{{

au BufEnter *.tex,*.sty set filetype=tex  " make vim recognize correct filetype
au BufEnter *.tex,*.sty set syntax=tex    " setting correct syntax
au BufEnter *.tex,*.sty set autowrite
au BufEnter *.tex,*.sty set smartindent

"}}}

" Compile PDF-File
" own command for pdf-compilation"{{{

" http://plankenau.com/blog/post-8/latexInVim
" command!  LatexCompilePDF execute "silent !latexmk\ -pdf\ % > /dev/null && xdg-open %:r.pdf > /dev/null 2>&1 &" | redraw!
command!  LatexCompilePDF execute "silent !pdflatex % > /dev/null && xdg-open %:r.pdf > /dev/null 2>&1 &" | redraw!
command!  TexCompilePDF execute "silent !pdftex % > /dev/null && xdg-open %:r.pdf > /dev/null 2>&1 &" | redraw!
command!  XeLatexCompilePDF execute "silent !xelatex % > /dev/null && xdg-open %:r.pdf > /dev/null 2>&1 &" | redraw!

"}}}
" vim-latex"{{{

" let g:Tex_DefaultTargetFormat = 'pdf'
" let g:Tex_MultipleCompileFormats = 'pdf'
" let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode $*'
" let g:Tex_GotoError = 0
" let g:Tex_ViewRule_dvi = 'xdvi'
" let g:Tex_ViewRule_ps  = 'gv'
" let g:Tex_ViewRule_pdf = 'evince'

"}}}

" Mappings, Functions & Abbreviations
autocmd Filetype tex call SetTexConfig()
function! SetTexConfig()
" Keybindings"{{{

nnoremap <leader>ab :split<CR>:buffer abbrev.tex<CR>
vnoremap <leader>ab <ESC>:split<CR>:buffer abbrev.tex<CR>

" Save Buffer before Switching
nnoremap <c-k> :w<cr><c-w><up>
nnoremap <c-j> :w<cr><c-w><down>
nnoremap <c-l> :w<cr><c-w><right>
nnoremap <c-h> :w<cr><c-w><left>

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
    if searchpair('\\begin{itemize}', '', '\\end{itemize}', '') || searchpair('\\begin{description}', '', '\\end{description}', '') || searchpair('\\begin{enumerate}', '', '\\end{enumerate}', '')
        return "\r\\item "
    endif
    return "\r"
endfunction
inoremap <expr><buffer> <CR> CR()

""}}}

"functions"}}}
" Abbreviations"{{{

" own abbr"{{{

inoremap <buffer>... \ldots
inoremap <buffer>dh. d.~h.<space>
inoremap <buffer>eg. e.~g.<space>
inoremap <buffer>oä. o.~ä.<space>
inoremap <buffer>zb. z.~B.<space>

" own abbr"}}}

"}}}

endfunction
