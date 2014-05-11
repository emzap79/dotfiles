" vim:fdm=marker
" Mappings for Vim-R

" some previous notes"{{{

" NOTE: Only *(ivn)map* will work!
" Start R from inside vim by hitting: <,rf>

" the prefix RE means "echo"; RD, "cursor down";
" RED, both "echo" and "down", eg. RDSendLine: send line under cursor and
" jump to next line of code!

" some previous notes"}}}
" start & close R"{{{

" Start R
nmap <localleader>R <Plug>RStart
imap <localleader>R <esc><Plug>RStart
vmap <localleader>R <Plug>RStart

" Close R
nmap <localleader>qq <Plug>RClose
imap <localleader>qq <esc><Plug>RClose
vmap <localleader>qq <Plug>RClose

" start & close R"}}}
" send code to console"{{{

" Send Line And Jump To Next Codechunk
nmap <esc>l <Plug>RDSendLine
vmap <esc>l <Plug>RDSendSelection

" Send Line
nmap <localleader>l <Plug>RSendLine
vmap <localleader>l <Plug>RSendSelection

" Send Chunks
nmap <esc>k <Plug>RDSendParagraph
vmap <esc>k <Plug>RSendSelection

" Send Marked Blocks ('marks')
" If the cursor is below the last mark, the plugin will send from the
" mark to the end of the file. The mark above the cursor is included and
" the mark below is excluded from the block to be sent to R.
nmap <esc>b <Plug>RDSendMBlock
vmap <esc>b <Plug>RDSendMBlock

" Send File
nmap <localleader>f <Plug>RSendFile

" send code to console"}}}
" Code editing mappings"{{{

" assing value to variable ('<-')
imap <C-kMinus> <esc> <Space><-<Space>
nmap <C-kMinus> a<Space><-<Space>

" Code editing mappings"}}}
" GVIM - Mappings"{{{

nmap <M-1> 1gt
imap <M-1> <esc>1gt
vmap <M-1> 1gt

nmap <M-2> 2gt
imap <M-2> <esc>2gt
vmap <M-2> 2gt

nmap <M-3> 3gt
imap <M-3> <esc>3gt
vmap <M-3> 3gt

nmap <M-4> 4gt
imap <M-4> <esc>4gt
vmap <M-4> 4gt

nmap <M-5> 5gt
imap <M-5> <esc>5gt
vmap <M-5> 5gt

" GVIM-Mappings"}}}
" GVIM - disable menue items"{{{

" Nicht genutzte Schaltflächen
" aunmenu ToolBar.-sep1-
" aunmenu ToolBar.-sep2-
" aunmenu ToolBar.-sep3-
" aunmenu ToolBar.-sep4-
" aunmenu ToolBar.-sep5-
" aunmenu ToolBar.-sep6-
" aunmenu ToolBar.-sep7-
" aunmenu ToolBar.Open
" aunmenu ToolBar.Save
" aunmenu ToolBar.SaveAll
" aunmenu ToolBar.LoadSesn
" aunmenu ToolBar.SaveSesn
" aunmenu ToolBar.RunScript
" aunmenu ToolBar.Make
" aunmenu ToolBar.RunCtags
" aunmenu ToolBar.TagJump
" aunmenu ToolBar.Zurück
" aunmenu ToolBar.Redo
" aunmenu ToolBar.FindNext
" aunmenu ToolBar.FindPrev
" aunmenu ToolBar.Hilfe
" aunmenu ToolBar.Ausschneiden
" aunmenu ToolBar.Kopieren
" aunmenu ToolBar.Einfügen
" aunmenu ToolBar.Replace

" Menuepunkte ausblenden
" GVIM - disable menue items"}}}
