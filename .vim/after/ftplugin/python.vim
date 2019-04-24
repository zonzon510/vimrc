
" fold settings (foldignore fixes python folding)
set foldmethod=indent
set shiftwidth=4
set softtabstop=4
set expandtab
set foldignore=

" print for python with macro
let @p = '^v$hxiprint\(\"pla, p'

" set breakpoints
noremap <leader>b iimport ipdb; ipdb.set_trace() # BREAKPOINT<Esc>
