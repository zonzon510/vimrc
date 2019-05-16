
" fold settings (foldignore fixes python folding)
setlocal foldmethod=indent
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal expandtab
setlocal foldignore=

" set breakpoints
noremap <leader>b iimport ipdb; ipdb.set_trace() # BREAKPOINT<Esc>

" test
" inoremap <buffer> ppp this_is_python


"  python print command
noremap <buffer> <leader>p ^v$hxaprint("pa"a, pa)^

set showbreak=->
nnoremap <F10> <Esc>:w<CR>:!clear;python %<CR>


