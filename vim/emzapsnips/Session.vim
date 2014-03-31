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
badd +9 /tmp/mutt-zapata-K52F-1000-22322-1066120755470144372
badd +23 /tmp/mutt-zapata-K52F-1000-19361-12887688781503005254
badd +58 mail.snippets
badd +108 all.snippets
badd +67 c.snippets
badd +13 ~/bin/muttSignRand.py
badd +1 ~/.sigdata
badd +2 /tmp/blaa.mail
badd +1 snippets.snippets
args /tmp/mutt-zapata-K52F-1000-19361-12887688781503005254
edit /tmp/mutt-zapata-K52F-1000-19361-12887688781503005254
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
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe '1resize ' . ((&lines * 13 + 22) / 45)
exe 'vert 1resize ' . ((&columns * 84 + 84) / 168)
exe '2resize ' . ((&lines * 13 + 22) / 45)
exe 'vert 2resize ' . ((&columns * 84 + 84) / 168)
exe '3resize ' . ((&lines * 13 + 22) / 45)
exe 'vert 3resize ' . ((&columns * 84 + 84) / 168)
exe 'vert 4resize ' . ((&columns * 83 + 84) / 168)
argglobal
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 5 - ((4 * winheight(0) + 6) / 13)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
5
normal! 0
lcd ~/.vim/emzapsnips
wincmd w
argglobal
edit ~/.vim/emzapsnips/mail.snippets
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=3
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 68 - ((6 * winheight(0) + 6) / 13)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
68
normal! 023|
lcd ~/.vim/emzapsnips
wincmd w
argglobal
edit ~/.vim/emzapsnips/mail.snippets
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=3
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 13 - ((6 * winheight(0) + 6) / 13)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
13
normal! 034|
lcd ~/.vim/emzapsnips
wincmd w
argglobal
edit ~/.vim/emzapsnips/c.snippets
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 71 - ((26 * winheight(0) + 20) / 41)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
71
normal! 05|
lcd ~/.vim/emzapsnips
wincmd w
exe '1resize ' . ((&lines * 13 + 22) / 45)
exe 'vert 1resize ' . ((&columns * 84 + 84) / 168)
exe '2resize ' . ((&lines * 13 + 22) / 45)
exe 'vert 2resize ' . ((&columns * 84 + 84) / 168)
exe '3resize ' . ((&lines * 13 + 22) / 45)
exe 'vert 3resize ' . ((&columns * 84 + 84) / 168)
exe 'vert 4resize ' . ((&columns * 83 + 84) / 168)
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=atI
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
