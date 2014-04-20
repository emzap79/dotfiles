" ----------------------------
" Mapping Function
" ----------------------------
nnoremap <C-Y> <Plug>RStart
inoremap <C-Y> <esc><Plug>RStart
vnoremap <C-Y> <Plug>RStart

" Mappings for Vim-R"{{{

" ----------------------------
vnoremap <Space> <Plug>RDSendSelection
nnoremap <Space> <Plug>RDSendLine

nnoremap <localleader>q <Plug>RClose
inoremap <localleader>q <esc><Plug>RClose
vnoremap <localleader>q <Plug>RClose

nnoremap <M-l> <Plug>RSendLine
inoremap <M-l> <esc><Plug>RSendLine
vnoremap <M-l> <Plug>RSendLine

nnoremap <M-p> <Plug>RSendSelection
inoremap <M-p> <esc><Plug>RSendSelection
vnoremap <M-p> <Plug>RSendSelection

" Custom Keybindings
nnoremap <C-kMinus> <Space><-<Space>
inoremap <C-kMinus> <esc> <Space><-<Space>
vnoremap <C-kMinus> <Space><-<Space>

nnoremap <C-l> <Space><-<Space>
inoremap <C-l> <esc> <Space><-<Space>
vnoremap <C-l> <Space><-<Space>

nnoremap <M-1> 1gt
inoremap <M-1> <esc>1gt
vnoremap <M-1> 1gt

nnoremap <M-2> 2gt
inoremap <M-2> <esc>2gt
vnoremap <M-2> 2gt

nnoremap <M-3> 3gt
inoremap <M-3> <esc>3gt
vnoremap <M-3> 3gt

nnoremap <M-4> 4gt
inoremap <M-4> <esc>4gt
vnoremap <M-4> 4gt

nnoremap <M-5> 5gt
inoremap <M-5> <esc>5gt
vnoremap <M-5> 5gt

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
