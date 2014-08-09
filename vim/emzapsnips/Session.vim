let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/.vim/emzapsnips
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +66 ~/Unimaterialien/Sommer2014/BAArbeit/main/master.rnw
badd +59 ~/Unimaterialien/Sommer2014/BAArbeit/main/header.tex
badd +63 ~/Unimaterialien/Sommer2014/BAArbeit/main/sections/cont/abbreviations.tex
badd +0 ~/Unimaterialien/Sommer2014/BAArbeit/main/sections/bib/library.bib
badd +4 rnoweb.snippets
badd +279 plaintex.snippets
badd +158 ~/.vim/vimrc_mappings
argglobal
silent! argdel *
argadd ~/Unimaterialien/Sommer2014/BAArbeit/main/master.rnw
edit ~/Unimaterialien/Sommer2014/BAArbeit/main/sections/bib/library.bib
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
2wincmd k
wincmd w
wincmd w
wincmd w
wincmd t
set winheight=1 winwidth=1
exe '1resize ' . ((&lines * 4 + 22) / 44)
exe 'vert 1resize ' . ((&columns * 112 + 84) / 168)
exe '2resize ' . ((&lines * 4 + 22) / 44)
exe 'vert 2resize ' . ((&columns * 112 + 84) / 168)
exe '3resize ' . ((&lines * 30 + 22) / 44)
exe 'vert 3resize ' . ((&columns * 112 + 84) / 168)
exe 'vert 4resize ' . ((&columns * 55 + 84) / 168)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=2
setlocal fen
silent! normal! zE
let s:l = 518 - ((2 * winheight(0) + 2) / 4)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
518
normal! 02|
lcd ~/Unimaterialien/Sommer2014/BAArbeit/main/sections/cont
wincmd w
argglobal
edit ~/Unimaterialien/Sommer2014/BAArbeit/main/sections/cont/chap_03.rnw
setlocal fdm=syntax
setlocal fde=TeXFold(v:lnum)
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=3
setlocal fml=1
setlocal fdn=2
setlocal fen
let s:l = 34 - ((2 * winheight(0) + 2) / 4)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
34
normal! 0
lcd ~/Unimaterialien/Sommer2014/BAArbeit/main
wincmd w
argglobal
edit ~/Unimaterialien/Sommer2014/BAArbeit/main/sections/cont/chap_03.rnw
setlocal fdm=syntax
setlocal fde=TeXFold(v:lnum)
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=1
setlocal fml=1
setlocal fdn=2
setlocal fen
let s:l = 36 - ((22 * winheight(0) + 15) / 30)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
36
normal! 034|
lcd ~/.vim/emzapsnips
wincmd w
argglobal
edit ~/Unimaterialien/Sommer2014/BAArbeit/main/master.rnw
setlocal fdm=syntax
setlocal fde=TeXFold(v:lnum)
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=2
setlocal fen
let s:l = 67 - ((20 * winheight(0) + 20) / 40)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
67
normal! 026|
lcd ~/Unimaterialien/Sommer2014/BAArbeit/main
wincmd w
3wincmd w
exe '1resize ' . ((&lines * 4 + 22) / 44)
exe 'vert 1resize ' . ((&columns * 112 + 84) / 168)
exe '2resize ' . ((&lines * 4 + 22) / 44)
exe 'vert 2resize ' . ((&columns * 112 + 84) / 168)
exe '3resize ' . ((&lines * 30 + 22) / 44)
exe 'vert 3resize ' . ((&columns * 112 + 84) / 168)
exe 'vert 4resize ' . ((&columns * 55 + 84) / 168)
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=30 winwidth=55 shortmess=filnxToOatI
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
let g:this_obsession = v:this_session
unlet SessionLoad
" vim: set ft=vim :
