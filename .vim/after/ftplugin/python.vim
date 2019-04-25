
" fold settings (foldignore fixes python folding)
set foldmethod=indent
set shiftwidth=4
set softtabstop=4
set expandtab
set foldignore=

" set breakpoints
noremap <leader>b iimport ipdb; ipdb.set_trace() # BREAKPOINT<Esc>

" test
" inoremap <buffer> ppp this_is_python


"  python print command
noremap <buffer> <leader>p ^v$hxaprint("pa"a, pa)^


