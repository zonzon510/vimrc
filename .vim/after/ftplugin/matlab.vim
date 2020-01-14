fun! MatlabComment()
	" save old search
	let old = @/
	" comment
	:silent! execute ':s/\(^\s*\)\@<=\S.*/% &'
	" restore search
	call histdel('/', -1)
	let @/ = old
endfun

fun! MatlabUnComment()
	" save old search
	let old = @/
	" uncomment
	:silent! execute ":s".'/% //'
	" restore search
	call histdel('/', -1)
	let @/ = old
endfun

" comment
vnoremap <buffer> <leader>c :call MatlabComment()<CR>
" uncomment
vnoremap <buffer> <leader>uc :call MatlabUnComment()<Cr>

" close bracket
inoremap <buffer> ;; <Esc>A;<Esc>
