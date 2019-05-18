
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal foldmethod=indent

"  comment
vnoremap <buffer> <leader>c :s/^\(.*\)$/<!--\1-->/<Cr>:noh<Cr>
" uncomment
vnoremap <buffer> <leader>uc :s/<!--\\|-->//g<Cr>:noh<Cr>


" create a tag while typing with <leader> t
inoremap <buffer> <leader>t <Esc>wbywi<<Esc>ea><><Esc>ha/<Esc>pF>i 

" create beginning of jinja logic
inoremap <buffer> <leader>j {%  %}<Esc>3ha

" snippet
nnoremap <buffer> <leader>html :-1read ~/.vim/snippet/start.html<CR>4jf>a


