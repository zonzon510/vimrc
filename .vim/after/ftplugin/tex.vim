set wrap
set display+=lastline
set linebreak
nnoremap j gj
nnoremap k gk

" snippet
nnoremap <buffer> <leader>meeting :-1read ~/.vim/snippet/meeting.tex<CR>

nnoremap <buffer> <F10> <Esc>:w<CR>:!clear;pdflatex %<CR>

" begin and end tag
inoremap <buffer> ;t <ESC>bdEa\begin{<C-R>"}<CR>\end{<C-R>"}<ESC>kA{}()<C-O>T{

augroup my_tex
    au!
    au BufWinEnter <buffer> setlocal foldmethod=indent
    au BufWinEnter <buffer> setlocal shiftwidth=2
    au BufWinEnter <buffer> setlocal softtabstop=2
    au BufWinEnter <buffer> let foldlevelstart=1
augroup END

let b:undo_ftplugin = get(b:, 'undo_ftplugin', 'exe')
    \ . "
    \ | setlocal foldmethod<
    \ | exe 'au! my_tex * <buffer>'
    \ "
