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

fun! SetMatlabBreakPoint()
	" set breakpoint in matlab
	let line_num = getcurpos()[1]
	let line_num = line_num+1
	let mfilename = expand("%:t")
	" dont include the .m part
	let mfilename = split(mfilename, '\.')[0]

	call feedkeys("idbstop in ".mfilename." at ".line_num."\<CR>")
	call feedkeys("disp('breakpoint');"."\<CR>")
	call feedkeys("dbclear all"."\<ESC>")

endfun

" comment
vnoremap <buffer> <leader>c :call MatlabComment()<CR>
" uncomment
vnoremap <buffer> <leader>uc :call MatlabUnComment()<Cr>

" set breakpoints
inoremap <buffer> ;break <ESC>:call SetMatlabBreakPoint()<CR>

" close bracket
inoremap <buffer> ;; <Esc>A;<Esc>
