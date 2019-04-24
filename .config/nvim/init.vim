call plug#begin('.vim/plugged')

Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
" pip install pynvim --upgrade
" :PlugInstall
" :UpdateRemotePlugins

" powerline
Plug 'Lokaltog/vim-powerline'
set laststatus=2
set encoding=utf-8

" vim indent guides
" toggle indent guide: 
" <leader>ig
Plug 'nathanaelkane/vim-indent-guides'

call plug#end()

set number
" fold settings (foldignore fixes python folding)
set foldmethod=indent
set shiftwidth=4
set softtabstop=4
set expandtab
set foldignore=

" search / highlight settings 
set hlsearch
set cursorline
set nowrap
set number

" automatic closing brackets
inoremap <leader>" ""<left>
inoremap <leader>' ''<left>
inoremap <leader>[ []<left>
inoremap <leader>{ {}<left>
inoremap <leader>( ()<left>

" print for python with macro
let @p = '^v$hxiprint\(\"pla, p'


" center screen around cursor:
"       zz

command! MakeTags !ctags -R .
" search for definition: ctrl+], ctrl + t to return
" g + ctrl + ] : find re-occuring tags

" reload all open files
" checkt[ime]

" fold color
:hi Folded ctermbg=Black
:hi Folded ctermfg=DarkGrey

" search  highlight colors
hi Search ctermbg=LightBlue
hi Search ctermfg=Black
