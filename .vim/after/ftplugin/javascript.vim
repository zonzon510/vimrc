"print
noremap <buffer> <leader>p ^v$hxaconsole.log("pa", pa);



augroup my_javascript
    au!
    au BufWinEnter <buffer> setlocal foldmethod=indent
    au BufWinEnter <buffer> setlocal shiftwidth=2
    au BufWinEnter <buffer> setlocal softtabstop=2
    au BufWinEnter <buffer> let foldlevelstart=1
    " au BufWinEnter <buffer> let javaScript_fold=1
    " au BufWinEnter <buffer> hi Folded ctermfg=LightBlue
    " au BufWinEnter <buffer> e
    " au BufWinEnter <buffer> SemanticHighlight
augroup END

let b:undo_ftplugin = get(b:, 'undo_ftplugin', 'exe')
    \ . "
    \ | setlocal foldmethod<
    \ | exe 'au! my_javascript * <buffer>'
    \ "
