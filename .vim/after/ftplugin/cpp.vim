
" comment
vnoremap <buffer> <leader>c :s/\(^\s*\)\@<=\S.*/\/\/ &<CR> :noh<CR>
" uncomment
vnoremap <buffer> <leader>uc :s/\/\/ //g<Cr>:noh<Cr>

noremap <buffer> <leader>pp ^v$hxastd::cout << pa << std::endl;
nnoremap <buffer> <leader>pv ^vg_xastd::cout << "<C-r>"" << " => " << <C-r>" << std::endl;<ESC>



fun! JumptoNext(direction, jump_to)
	" save old search
	let old = @/

	" jump to next <++>
	" let cmdstring = a:direction."<++>\<cr>"
	let cmdstring = a:direction.a:jump_to."\<cr>"
	:execute "normal! ".cmdstring

	" restore search
	call histdel('/', -1)
	let @/ = old
endfun

" jump points
inoremap <buffer> <space><space> <Esc>:call JumptoNext("/", "<++>")<cr>"_c4l
" for loop
inoremap <buffer> ;for for(<++>;<++>;<++>){<cr><++><cr>}<ESC>:call JumptoNext("?", "for")<cr> :call JumptoNext("/", "<++>")<cr>"_c4l
" while loop
inoremap <buffer> ;while while(<++>){<cr><++><cr>}<ESC> :call JumptoNext("?", "while")<cr> :call JumptoNext("/", "<++>")<cr>"_c4l
" close bracket
inoremap <buffer> ;<space> <Esc>A;<Esc>



" get type with ycm
noremap <buffer> <leader>k :YcmCompleter GetType<CR>

" move up by bracket
nmap <buffer> <c-p> [{


" nnoremap <F10> <Esc>:w<CR>:!clear;g++ % -o output.out; ./output.out<CR>
" nnoremap <F9> <Esc>:w<CR>:!clear;g++ % -g -o output.out<CR>
nnoremap <F10> :!cmake --build . <CR>


augroup my_cpp
   au!
   au BufWinEnter <buffer> setlocal foldmethod=syntax
   au BufWinEnter <buffer> setlocal shiftwidth=2
   au BufWinEnter <buffer> setlocal softtabstop=2
   au BufWinEnter <buffer> setlocal expandtab
augroup END

let b:undo_ftplugin = get(b:, 'undo_ftplugin', 'exe')
    \ . "
    \ | setlocal foldmethod<
    \ | exe 'au! my_cpp * <buffer>'
    \ "
