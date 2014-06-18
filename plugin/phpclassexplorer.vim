if exists("g:loaded_phpclassexplorer_plugin")
    finish
endif
let g:loaded_phpclassexplorer_plugin = 1

function! s:findFunctions()
    let currentfile = expand("%")
    if filereadable(currentfile)
        execute 'lvimgrep /function [a-zA-Z_\x7f-\xff][a-zA-Z0-9_\x7f-\xff]*/ '. currentfile
    endif
endfun

function! s:classExplorer()
    call <SID>findFunctions()
    execute 'lopen'
endfun

command PHPClassExplorer :call <SID>classExplorer()
