set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" exit any window in any mode with alt key
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
tnoremap <A-n> <C-\><C-N>

" terminal
" move to previous window
tnoremap <C-w>p <C-\><C-N><C-w><C-p>
tnoremap <C-w><C-p> <C-\><C-N><C-w><C-p>

" move to left window
tnoremap <C-w>h <C-\><C-N><C-w><C-h>
tnoremap <C-w><C-h> <C-\><C-N><C-w><C-h>


" move to right window
tnoremap <C-w>l <C-\><C-N><C-w><C-l>
tnoremap <C-w><C-l> <C-\><C-N><C-w><C-l>


" move to window above
tnoremap <C-w>k <C-\><C-N><C-w><C-k>
tnoremap <C-w><C-k> <C-\><C-N><C-w><C-k>


" move to window below
tnoremap <C-w>j <C-\><C-N><C-w><C-j>
tnoremap <C-w><C-j> <C-\><C-N><C-w><C-j>

" terminal
" switch to normal mode
tnoremap <C-w>N <C-\><C-N>


inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l


