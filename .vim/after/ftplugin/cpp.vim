
" test
" inoremap <buffer> ppp this_is_cpp

noremap <buffer> <leader>p ^v$hxastd::cout << pa << std::endl;

" get type with ycm
noremap <buffer> <leader>k :YcmCompleter GetType<CR>


nnoremap <F10> <Esc>:w<CR>:!clear;g++ % -o output.out; ./output.out<CR>
nnoremap <F9> <Esc>:w<CR>:!clear;g++ % -g -o output.out<CR>

