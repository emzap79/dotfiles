" http://learnvimscriptthehardway.stevelosh.com/chapters/49.html#expr-folding
" http://learnvimscriptthehardway.stevelosh.com/chapters/49.html#one-more-helper

""""""""""""""""""""""""
"  indentation syntax  "
""""""""""""""""""""""""

setlocal foldmethod=expr
setlocal foldexpr=GetMarkdownFold(v:lnum)

function! IndentLevel(lnum)
    return indent(a:lnum) / &shiftwidth
endfunction

function! NextNonBlankLine(lnum)
    let numlines = line('$')
    let current = a:lnum + 1

    while current <= numlines
        if getline(current) =~? '\v\S'
            return current
        endif

        let current += 1
    endwhile

    return -2
endfunction

function! GetMarkdownFold(lnum)
    if getline(a:lnum) =~? '\v^\s*$'
        return '-1'
    endif

    let this_indent = IndentLevel(a:lnum)
    let next_indent = IndentLevel(NextNonBlankLine(a:lnum))

    if next_indent == this_indent
        return this_indent
    elseif next_indent < this_indent
        return this_indent
    elseif next_indent > this_indent
        return '>' . next_indent
    endif
endfunction

""""""""""""""
"  comments  "
""""""""""""""

" The indent(a:lnum) returns the number of spaces at the beginning of the
" given line number. We divide that by the shiftwidth of the buffer to get the
" indentation level.

" I chose -2 because we're working with folding code, and '-1' (and '0') is a
" special Vim foldlevel string.  When my eyes are reading over this file and I
" see a -1 my brain immediately thinks "undefined foldlevel".

""""""""""
"  code  "
""""""""""

" here's the original Markdown code snippet:

" factorial = (n):
"     total = 1
"     n to 1 (i):
"         total *= i.
"         total.
"
" 10 times (i):
"     i string print
"     '! is: ' print
"     factorial (i) string print
"     "\n" print.
