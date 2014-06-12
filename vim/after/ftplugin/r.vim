" vim:fdm=marker
" Mappings for Vim-R

" Config"{{{

" R.rc"{{{

" iskeyword: Keywords for recognizing beginning/end of word eg. in movements like w,e...
set isk-=.
set isk+="@
set isk+=48-57
set isk+=_
set isk+=192-255"

" R.rc"}}}
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

" Config"}}}
" Mappings"{{{

" some previous notes"{{{

" NOTE: Only *(ivn)map* will work!
" Start R from inside vim by hitting: <,rf>

" the prefix RE means "echo"; RD, "cursor down";
" RED, both "echo" and "down", eg. RDSendLine: send line under cursor and
" jump to next line of code!

" some previous notes"}}}
" Start & Close R"{{{

" Menu entry
" Start/Close
" . Start R (default)
" . Start R --vanilla
" . Start R (custom)
nmap <localleader>R <Plug>RStart
imap <localleader>R <esc><Plug>RStart
vmap <localleader>R <Plug>RStart

" Close R (no save)
nmap <localleader>qq <Plug>RClose
imap <localleader>qq <esc><Plug>RClose
vmap <localleader>qq <Plug>RClose

" start & close R"}}}
" Send Code to Console"{{{

" Send File
nmap <localleader>f <Plug>RSendFile

" Send Part of current line
nmap <localleader>j <Plug>RNLeftPart
" imap <localleader>j <Plug>RILeftPart
nmap <localleader>k <Plug>RNRightPart
" imap <localleader>k <Plug>RIRightPart

" Send Line
nmap <localleader>l <Plug>RSendLine
vmap <localleader>l <Plug>RDSendSelection``

" Send Line And Jump To Next Code
nmap <esc>l <Plug>RDSendLine
vmap <esc>l <Plug>RDSendSelection

" Send Paragraph
nmap <esc>p <Plug>RDSendParagraph
vmap <esc>p <Plug>RDSendSelection

" Send Marked Blocks ('marks')
" If the cursor is below the last mark, the plugin will send from the
" mark to the end of the file. The mark above the cursor is included and
" the mark below is excluded from the block to be sent to R.
nmap <esc>b <Plug>RDSendMBlock
vmap <esc>b <Plug>RDSendMBlock

" send code to console"}}}
" Editing Commands"{{{

" Command
" . List space
" . Clear console
" . Clear all
nmap <silent><localleader>ls <Plug>RListSpace
vmap <silent><localleader>ls <Plug>RListSpace
nmap <silent><localleader>cc <Plug>RClearConsole
vmap <silent><localleader>cc <Plug>RClearConsole
nmap <silent><localleader>ca <Plug>RClearAll
vmap <silent><localleader>ca <Plug>RClearAll

" . Print (cur)
" . Names (cur)
" . Structure (cur)
nmap <silent><localleader>op <Plug>RObjectPr
vmap <silent><localleader>op <Plug>RObjectPr
nmap <silent><localleader>on <Plug>RObjectNames
vmap <silent><localleader>on <Plug>RObjectNames
nmap <silent><localleader>ot <Plug>RObjectStr
vmap <silent><localleader>ot <Plug>RObjectStr

" . Arguments (cur)
" . Example (cur)
" . Help (cur)
nmap <silent><localleader>a <Plug>RShowArgs
vmap <silent><localleader>a <Plug>RShowArgs
nmap <silent><localleader>e <Plug>RShowEx
vmap <silent><localleader>e <Plug>RShowEx
nmap <silent><localleader>h <Plug>RHelp
vmap <silent><localleader>h <Plug>RHelp

" . Summary (cur)
" . Plot (cur)
" . Plot and summary (cur)
nmap <silent><localleader>s <Plug>RSummary
vmap <silent><localleader>s <Plug>RSummary
nmap <silent><localleader>p <Plug>RPlot
vmap <silent><localleader>p <Plug>RPlot
nmap <silent><localleader>g <Plug>RSPlot
vmap <silent><localleader>g <Plug>RSPlot

" . Set working directory (cur file path)
nmap <silent><localleader>d <Plug>RSetwd
vmap <silent><localleader>d <Plug>RSetwd

" Editing Commands"}}}
" Custom mappings & functions "{{{

" assign argument under cursor in next line
nmap <silent><localleader>, :normal! o0<CR>0
vmap <silent><localleader>, :<C-u>exec "s/$/\r" . GetVisualSelection()<cr>0

" define commands & actions
map <silent> <localleader>rs :call g:SendCmdToR("search()")<CR>
map <silent> <localleader>rh :call RAction("help.search")<CR>
map <silent> <localleader>rl :call RAction("levels")<CR>

" assine value to variable ('<-')
nmap <esc>- hEa<Space><-<Space>

" Custom mappings & functions "}}}
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

" Mappings"}}}
