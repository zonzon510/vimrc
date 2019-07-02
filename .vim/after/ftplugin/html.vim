



"  comment
vnoremap <buffer> <leader>c :s/\(^\s*\)\@<=\S.*/<!--&--><CR> :noh<CR>
" uncomment
vnoremap <buffer> <leader>uc :s/<!--\\|-->//g<Cr>:noh<Cr>

" jinja comment
vnoremap <buffer> <leader>jc :s/\(^\s*\)\@<=\S.*/{#&#}<CR> :noh<CR>
" jinja uncomment
vnoremap <buffer> <leader>juc :s/{#\\|#}//g<Cr>:noh<Cr>


" create a tag while typing with <leader> t
inoremap <buffer> <leader>t <Esc>wbywi<<Esc>ea><><Esc>ha/<Esc>pF>i 

" create beginning of jinja logic
inoremap <buffer> <leader>j {%  %}<Esc>3ha

" comment jinja logic statement (not whole line)
nnoremap <buffer> <leader>jc i{#<Esc>l%a#}<Esc>
" uncomment jinja logic statement (not whole line)
nnoremap <buffer> <leader>juc xx%lxx

" snippet
nnoremap <buffer> <leader>html :-1read ~/.vim/snippet/start.html<CR>4jf>a


"remove all tabs/ indents at beginning of lines
" and remove all blank lines
nnoremap <buffer> <leader>com :g/^\s*$/d<CR>:%le<CR>:noh<CR>


augroup my_html
    au!
    au BufWinEnter <buffer> setlocal foldmethod=indent
    au BufWinEnter <buffer> setlocal shiftwidth=2
    au BufWinEnter <buffer> setlocal softtabstop=2
augroup END

let b:undo_ftplugin = get(b:, 'undo_ftplugin', 'exe')
    \ . "
    \ | setlocal foldmethod<
    \ | execute 'au! my_html * <buffer>'
    \ "
