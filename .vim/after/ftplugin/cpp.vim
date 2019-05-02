
" test
" inoremap <buffer> ppp this_is_cpp

noremap <buffer> <leader>p ^v$hxastd::cout << pa << std::endl;


nnoremap <F10> <Esc>:w<CR>:!clear;g++ % -o output.out; ./output.out<CR>

