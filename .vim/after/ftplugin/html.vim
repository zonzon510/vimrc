
setlocal shiftwidth=2
setlocal softtabstop=2

"  comment
vnoremap <buffer> <leader>c :s/^\(.*\)$/<!-- \1 -->/<Cr>:noh<Cr>

" create a tag while typing with <leader> t
inoremap <buffer> <leader>t <Esc>bywi<<Esc>ea><><Esc>ha/<Esc>pF>i 


