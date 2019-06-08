
augroup my_php
    au!
    au BufWinEnter <buffer> setlocal foldmethod=syntax
    au BufWinEnter <buffer> setlocal shiftwidth=2
    au BufWinEnter <buffer> setlocal softtabstop=2
    au BufWinEnter <buffer> let foldlevelstart=1
    au BufWinEnter <buffer> let php_folding=2
    au BufWinEnter <buffer> hi Folded ctermfg=Green
    au BufWinEnter <buffer> e
    " au BufWinEnter <buffer> SemanticHighlight
augroup END

let b:undo_ftplugin = get(b:, 'undo_ftplugin', 'exe')
    \ . "
    \ | setlocal foldmethod<
    \ | exe 'au! my_php * <buffer>'
    \ "