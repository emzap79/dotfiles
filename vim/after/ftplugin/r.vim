" vim:fdm=marker
" File: r.vim
" Author: Jonas Petong
" Description: Mappings for the R-VIM plugin
" Last Modified: April 19, 2015

" Config                                     {{{1
" r.rc                                       {{{2

" iskeyword: Keywords for recognizing beginning/end of word eg. in movements like w,e...
set isk-=.
set isk+="@
set isk+=48-57
set isk+=_
set isk+=192-255"

" gvim - disable menue items                 {{{2

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

" Mappings                                   {{{1
" Some Previous Notes                        {{{2

" NOTE: Only *(ivn)map* will work!
" Start R from inside vim by hitting: <,rf>

" the prefix RE means "echo"; RD, "cursor down";
" RED, both "echo" and "down", eg. RDSendLine: send line under cursor and
" jump to next line of code!

" Start/Close
" Start R (default)
" Start R --vanilla
" Start R (custom)

" Start & Close R                            {{{2
nmap <localleader>R <Plug>RStart
imap <localleader>R <esc><Plug>RStart
vmap <localleader>R <Plug>RStart

" Close R (no save)
nmap <localleader>qq <Plug>RClose
imap <localleader>qq <esc><Plug>RClose
vmap <localleader>qq <Plug>RClose

" Send Code To Console                       {{{2
" Send Part of current line                  {{{3
nmap <localleader>j <Plug>RNLeftPart
nmap <localleader>jj <Plug>RILeftPart
nmap <localleader>k <Plug>RNRightPart

" Send CodeChunk                             {{{3
nmap <localleader>c <Plug>REDSendChunk
nmap <localleader>ch <Plug>RSendChunkFH

" Send Line                                  {{{3
nmap <localleader>L <Plug>RSendLine
vmap <localleader>L <Plug>RDSendSelection``

" Send Line And Jump To Next Code            {{{3
nmap <esc>l <Plug>RDSendLine
vmap <esc>l <Plug>RDSendSelection``

" Send File                                  {{{3
nmap <localleader>f <Plug>RSendFile

" Send Paragraph                             {{{3
nmap <localleader>pp <Plug>RDSendParagraph
vmap <localleader>pp <Plug>RDSendSelection

" Send Marked Blocks ('marks')               {{{3
" If the cursor is below the last mark, the plugin will send from the
" mark to the end of the file. The mark above the cursor is included and
" the mark below is excluded from the block to be sent to R.
nmap <esc>b <Plug>RDSendMBlock
vmap <esc>b <Plug>RDSendMBlock
nmap <localleader>b <Plug>RSendMBlock
vmap <localleader>b <Plug>RSendMBlock

" Comments                                   {{{2
nmap <localleader>cr <Plug>RRightComment
vmap <localleader>cr <Plug>RRightComment

" Arguments, Example, Help (cur)             {{{2
nmap <silent><localleader>a <Plug>RShowArgs
vmap <silent><localleader>a <Plug>RShowArgs
nmap <silent><localleader>e <Plug>RShowEx
vmap <silent><localleader>e <Plug>RShowEx
nmap <silent><localleader>h <Plug>RHelp
vmap <silent><localleader>h <Plug>RHelp
map <silent> <localleader>sh :call RAction("help.search")<CR>

" Summary, Plot, Plot and summary (cur)      {{{2
nmap <silent><localleader>s <Plug>RSummary
vmap <silent><localleader>s <Plug>RSummary
nmap <silent><localleader>p <Plug>RPlot
vmap <silent><localleader>p <Plug>RPlot
nmap <silent><localleader>g <Plug>RSPlot
vmap <silent><localleader>g <Plug>RSPlot

" Set working directory (cur file path)      {{{2
nmap <silent><localleader>d <Plug>RSetwd
vmap <silent><localleader>d <Plug>RSetwd

" Range/Min/Max (cur)                        {{{2
map <silent> <LocalLeader>mi :call RAction("min")<CR>
map <silent> <LocalLeader>mx :call RAction("max")<CR>
map <silent> <LocalLeader>rg :call RAction("range")<CR>
map <silent> <LocalLeader>mn :call RAction("mean")<CR>
map <silent> <LocalLeader>me :call RAction("median")<CR>
map <silent> <LocalLeader>sd :call RAction("sd")<CR>
map <silent> <LocalLeader>su :call RAction("summary")<CR>

" Data Information (cur)                     {{{2
map <silent> <LocalLeader>hd :call RAction("head")<CR>
map <silent> <LocalLeader>id :call RAction("index")<CR>
map <silent> <LocalLeader>tl :call RAction("tail")<CR>
map <silent> <localleader>at :call RAction("attributes")<CR>
map <silent> <localleader>lt :call RAction("length")<CR>
map <silent> <localleader>dm :call RAction("dim")<CR>
map <silent> <localleader>dn :call RAction("dimnames")<CR>
map <silent> <localleader>nc :call RAction("ncol")<CR>
map <silent> <localleader>nr :call RAction("nrow")<CR>
map <silent> <localleader>lv :call RAction("levels")<CR>
map <silent> <localleader>tr :call RAction("t")<CR>

" Object Print, Names, Structure (cur)       {{{2
map <silent> <localleader>on :call RAction("names")<CR>
map <silent> <localleader>op :call RAction("print")<CR>
map <silent> <localleader>ot :call RAction("str")<CR>
map <silent> <localleader>cn :call RAction("colnames")<CR>
map <silent> <localleader>rn :call RAction("rownames")<CR>

" List Space (cur)                           {{{2
map <silent> <LocalLeader>ls <Plug>RListSpace
map <silent> <LocalLeader>rm :call RAction("rm")<CR>

" Gvim - Mappings                            {{{2
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

"""""""""""""""""""
"  not ready yet  "
"""""""""""""""""""
map <silent> <localleader>rr :call 'g:SendCmdToR("write.table(' . shellescape(expand("<cword>")) . ')"'<CR>
"""""""""""""""""""
"  not ready yet  "
"""""""""""""""""""

" Assine Value To Variable ('<-')            {{{2
nmap <esc>- hEa<Space><-<Space>

" Assign Argument Under Cursor In Next Line  {{{2
nmap <silent><localleader>- :normal! o0<CR>0v$
vmap <silent><localleader>- :<C-u>exec "s/$/\r" . GetVisualSelection()<cr>0v$

" SendCmdToR                                 {{{1
map <silent> <localleader>sr :call g:SendCmdToR("search()")<CR>
map <silent> <localleader>di :call g:SendCmdToR("dir()")<CR>
map <silent> <localleader>go :call g:SendCmdToR("graphics.off()")<CR>
map <silent> <localleader>as :call g:SendCmdToR("methods(as)")<CR>
map <silent> <localleader>is :call g:SendCmdToR("methods(is)")<CR>
map <silent> <localleader>rml :call g:SendCmdToR("rm(list=ls())")<CR>

" Operatorfunction                           {{{1
nnoremap <silent>gr :set operatorfunc=<SID>ROperator<cr>g@
vnoremap <silent>gr :<c-u>call <SID>ROperator(visualmode())<cr>

function! s:ROperator(type)
    let saved_unnamed_register = @@
    if a:type ==# 'v'
        normal! `<v`>
    elseif a:type ==# 'char'
        normal! `[v`]
    else
        return
    endif
    echom shellescape(@@)
    " http://stackoverflow.com/a/18547013
    " http://learnvimscriptthehardway.stevelosh.com/chapters/30.html
    silent execute "normal mz\<Plug>RDSendSelection`z"
    let @@ = saved_unnamed_register
endfunction
