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

" frame
inoremap ;frame \begin{frame}<cr>\end{frame}<Esc>O\frametitle{<++>}<CR><++><Esc><Esc>:call JumptoNext("?", "frametitle")<cr> :call JumptoNext("/", "<++>")<cr>"_c4l
" textblock
inoremap ;text \begin{textblock*}{<++>cm}(<++>cm,<++>cm)<cr><++><cr>\end{textblock*}<Esc>:call JumptoNext("?", "begin")<cr> :call JumptoNext("/", "<++>")<cr>"_c4l
" include graphics
inoremap ;incl \includegraphics[trim=0cm 0cm 0cm 0cm, clip, height=<++>cm]{<++>}<Esc> :call JumptoNext("?", "includegraphics")<cr> :call JumptoNext("/", "<++>")<cr>"_c4l
" itemize
inoremap ;item \begin{itemize}<CR>\end{itemize}<Esc>O\item{}<Esc>i



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
