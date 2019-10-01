fun! PythonComment()
	" save old search
	let old = @/
	" comment
	:silent! execute ':s/\(^\s*\)\@<=\S.*/# &'
	" restore search
	call histdel('/', -1)
	let @/ = old
endfun

fun! PythonUnComment()
	" save old search
	let old = @/
	" uncomment
	:silent! execute ":s".'/# //'
	" restore search
	call histdel('/', -1)
	let @/ = old
endfun

" comment
vnoremap <buffer> <leader>c :call PythonComment()<CR>
" uncomment
vnoremap <buffer> <leader>uc :call PythonUnComment()<CR>

" fold settings (foldignore fixes python folding)

" set breakpoints
inoremap <buffer> ;break import ipdb; ipdb.set_trace() # BREAKPOINT<CR>print("BREAKPOINT")<Esc>

"  python print command
noremap <buffer> <leader>p ^v$hxaprint("pa =>"a, pa)^
nnoremap <buffer> <leader>e oexit()<Esc>
inoremap <buffer> ;e exit()<Esc>

set showbreak=->
nnoremap <buffer> <F10> <Esc>:w<CR>:!clear;python %<CR>

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
