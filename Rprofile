# Disable "save workspace (y/n/c):" prompt
# http://stackoverflow.com/a/4996252
# Set hook to be run when Defaults is attached
setHook(packageEvent("Defaults", "attach"),
  function(...) { setDefaults(q, save="no"); useDefaults(q) })
# add Defaults to the default packages loaded on startup
old <- getOption("defaultPackages");
options(defaultPackages = c(old, "Defaults"))

if(interactive()){
# Get startup messages of three packages and set Vim as R pager:
    options(setwidth.verbose = 1,
            colorout.verbose = 1,
            vimcom.verbose = 1,
            pager = "vimrpager")
# Use the text based web browser w3m to navigate through R docs:
        if(Sys.getenv("TMUX") != "")
            options(browser="~/bin/vimrw3mbrowser",
                    help_type = "html")
# Use either Vim or GVim as text editor for R:
                if(nchar(Sys.getenv("DISPLAY")) > 1)
                    options(editor = 'gvim -f -c "set ft=r"')
                else
                    options(editor = 'vim -c "set ft=r"')
# Load the colorout library:
                        library(colorout)
                        if(Sys.getenv("TERM") != "linux" && Sys.getenv("TERM") != ""){
# Choose the colors for R output among 256 options.
# You should run show256Colors() and help(setOutputColors256) to
# know how to change the colors according to your taste:
                            setOutputColors256(verbose = FALSE)
                        }
# Load the setwidth library:
    library(setwidth)
# Load the vimcom.plus library only if R was started by Vim:
        if(Sys.getenv("VIMRPLUGIN_TMPDIR") != ""){
            library(vimcom.plus)
# See R documentation on Vim buffer even if asking for help in R Console:
                if(Sys.getenv("VIM_PANE") != "")
                    options(help_type = "text", pager = vim.pager)
        }
}
