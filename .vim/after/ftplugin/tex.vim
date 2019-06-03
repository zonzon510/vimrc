set wrap
set display+=lastline
set linebreak
nnoremap j gj
nnoremap k gk

" snippet
nnoremap <buffer> <leader>meeting :-1read ~/.vim/snippet/meeting.tex<CR>

nnoremap <buffer> <F10> <Esc>:w<CR>:!clear;pdflatex %<CR>

