augroup my_qf
    au!
    au BufWinEnter <buffer> setlocal number
augroup END

let b:undo_ftplugin = get(b:, 'undo_ftplugin', 'exe')
    \ . "
    \ | exe 'au! my_qf * <buffer>'
    \ "
