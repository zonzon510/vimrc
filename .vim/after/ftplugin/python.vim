
" fold settings (foldignore fixes python folding)

" set breakpoints
noremap <buffer> <leader>b iimport ipdb; ipdb.set_trace() # BREAKPOINT<Esc>

" test
" inoremap <buffer> ppp this_is_python


"  python print command
noremap <buffer> <leader>p ^v$hxaprint("pa"a, pa)^

set showbreak=->
nnoremap <F10> <Esc>:w<CR>:!clear;python %<CR>


augroup my_python
    au!
    au BufWinEnter <buffer> setlocal foldmethod=indent
    au BufWinEnter <buffer> setlocal shiftwidth=4
    au BufWinEnter <buffer> setlocal softtabstop=4
    au BufWinEnter <buffer> setlocal expandtab
    au BufWinEnter <buffer> setlocal foldignore=
augroup END

let b:undo_ftplugin = get(b:, 'undo_ftplugin', 'exe')
    \ . "
    \ | setlocal foldmethod<
    \ | exe 'au! my_python * <buffer>'
    \ "
