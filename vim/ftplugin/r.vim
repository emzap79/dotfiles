" ----------------------------
" Mapping Function
" ----------------------------

" Mappings for Vim-R"{{{

" NOTE: Only *(ivn)map* will work!
" Start R from inside vim by hitting: <,rf>

nmap <localleader>q <Plug>RClose
imap <localleader>q <esc><Plug>RClose
vmap <localleader>q <Plug>RClose

nmap L <Plug>RDSendLine
imap L <esc><Plug>RDSendLine
vmap L <Plug>RDSendSelection

" Custom Keybindings
nmap <C-kMinus> <Space><-<Space>
imap <C-kMinus> <esc> <Space><-<Space>
vmap <C-kMinus> <Space><-<Space>

nmap <S-C-l> <Space><-<Space>
imap <S-C-l> <esc> <Space><-<Space>
vmap <S-C-l> <Space><-<Space>

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

"}}}
" Benutzung (Kommandozeile)"{{{

" http://wiki.ubuntuusers.de/R#Benutzung-Kommandozeile
" Unter Linux verfügt R über keine Standardoberfläche. Es wird über ein Terminal
" mit dem Befehl: R gestartet. Am Befehlsprompt können nur R-Befehle eingegeben
" werden, die direkt ausgeführt werden. Die umfangreiche Hilfe von R lässt sich
" mit dem Befehl: help.start() in einem Browser aufrufen.  Um R zu beenden,
" führt man den Befehl : q() aus.

"}}}
" Configurations for R in Gvim"{{{

" ----------------------------
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

"}}}
