fun! CppComment()
	" save old search
	let old = @/
	" comment
	:silent! execute ':s/\(^\s*\)\@<=\S.*/\/\/ &'
	" restore search
	call histdel('/', -1)
	let @/ = old
endfun

fun! CppUnComment()
	" save old search
	let old = @/
	" uncomment
	:silent! execute ":s".'/\/\/ //'
	" restore search
	call histdel('/', -1)
	let @/ = old
endfun

" comment
vnoremap <buffer> <leader>c :call CppComment()<CR>
" uncomment
vnoremap <buffer> <leader>uc :call CppUnComment()<Cr>

noremap <buffer> <leader>pp ^v$hxastd::cout << pa << std::endl;
nnoremap <buffer> <leader>pv ^vg_xastd::cout << "<C-r>"" << " => " << <C-r>" << std::endl;<ESC>

" for loop
inoremap <buffer> ;for for(<++>;<++>;<++>){<cr><++><cr>}<ESC>:call JumptoNext("?", "for")<cr> :call JumptoNext("/", "<++>")<cr>"_c4l
" while loop
inoremap <buffer> ;while while(<++>){<cr><++><cr>}<ESC> :call JumptoNext("?", "while")<cr> :call JumptoNext("/", "<++>")<cr>"_c4l
" close bracket
inoremap <buffer> ;; <Esc>A;<Esc>
inoremap <buffer> ;def <Esc>maa<++> <++>(<++>){<cr><++><cr>}<ESC>`ac4l



" get type with ycm
noremap <buffer> <leader>k :YcmCompleter GetType<CR>

" move up by bracket
nmap <buffer> <c-p> [{


" nnoremap <F10> <Esc>:w<CR>:!clear;g++ % -o output.out; ./output.out<CR>
" nnoremap <F9> <Esc>:w<CR>:!clear;g++ % -g -o output.out<CR>
nnoremap <F10> :!cmake --build . <CR>


augroup my_cpp
   au!
   au BufWinEnter <buffer> setlocal foldmethod=indent
   au BufWinEnter <buffer> setlocal shiftwidth=2
   au BufWinEnter <buffer> setlocal softtabstop=2
   au BufWinEnter <buffer> let foldlevelstart=1
   au BufWinEnter <buffer> setlocal expandtab
augroup END

let b:undo_ftplugin = get(b:, 'undo_ftplugin', 'exe')
    \ . "
    \ | setlocal foldmethod<
    \ | exe 'au! my_cpp * <buffer>'
    \ "
