" GVim-Colorscheme-Options
"----------------------------------
colors default
colorscheme default
" colors solarized
" colorscheme solarized

set guicursor+=a:blinkon0           " GUI cursor: no blinking
set guioptions-=T                   " no toolbar
set guioptions-=a                   " no autoselect 
set guioptions-=P                   " Like autoselect but using the "+ register
                                    " instead of the "*set syntax
set guioptions-=m                   " no Menu Bar
set guioptions+=c                   " Use console messages instead of GUI dialogs
set guioptions+=i                   " Use VIM-Icon
set guioptions+=R                   " Right-hand scrollbar is present when there
                                    " is a vertically split window.
set expandtab

" Specific 'Solarized' Settings
" options are 0 or 1 and normal/high/low respectively.
let g:solarized_contrast = "low"
let g:solarized_hitrail = 1
let g:solarized_visibility = "high"
let g:solarized_visibility= "normal"
let g:solarized_termcolors= 256
let g:solarized_termtrans = 0
let g:solarized_degrade = 0
let g:solarized_bold = 1
let g:solarized_underline = 1
let g:solarized_italic = 1

" Folding
"----------------------------------
"" Automatic & manual folding
augroup vimrc
    au BufReadPre * setlocal foldmethod=marker
    au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=marker | endif "manual, automatic, marker
augroup END

"----------------------------------
" Highlighting
"----------------------------------
highlight Normal ctermfg=grey ctermbg=black
highlight Normal ctermfg=grey ctermbg=black

"" Tabstops
""----------------------------------
syntax match Tab /\t/
hi Tab gui=underline guifg=blue ctermbg=blue

""" Cursor-Position
"""----------------------------------
""hi clear CursorLine
"hi CursorLine guibg=Gray25 cterm=underline
""leave it underlined (default) in cterm
"hi clear CursorColumn
"hi link CursorColumn CursorLine

" GUI-Fonts
"----------------------------------
set guifont=Inconsolata\ 12            " very nice, but leaves terrible artefacts with national (mostly russian) characters
"set guifont=DejaVu\ Sans\ Mono\ 10     " DejaVu Sans
