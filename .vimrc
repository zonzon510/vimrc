set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'


" powerline
Plugin 'Lokaltog/vim-powerline'
set laststatus=2
set encoding=utf-8



" Python mode
" Plugin 'python-mode/python-mode'
" Enable Python mode
" let g:pymode = 0
" Default python mode options
" let g:pymode_options = 1
" Enable Python Folding
" let g:pymode_folding = 0
" let g:pymode_python = 'python3'
" let g:pymode_enable_shortcuts = 1
" let g:pymode_rope_goto_def_newwin = "vnew"
" let g:pymode_rope_extended_complete = 1
" let g:pymode_breakpoint = 0
" let g:pymode_syntax = 1
" let g:pymode_syntax_builtin_objs = 0
" let g:pymode_syntax_builtin_funcs = 0


" VIM Fugutive
" Plugin 'tpope/vim-fugitive'



" vim indent guides
" toggle indent guide: 
" <leader>ig
Plugin 'nathanaelkane/vim-indent-guides'



" vim git gutter
Plugin 'airblade/vim-gitgutter'
" set update time for git tracking to render the symbols for hunk
set updatetime=100
" stage / unstage hunk: <leader>hs / <leader>hu
"
"                       next / previous
" move between hunks      ]c / [c

Plugin 'jaxbot/semantic-highlight.vim'
" semantic highlighting
nnoremap <leader>s :SemanticHighlightToggle<cr>
inoremap <leader>" ""<left>
let g:semanticTermColors = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 21, 57, 93, 129, 165, 201, 46, 82, 118, 154, 190, 226, 51, 87, 123, 159, 195, 231]
" let g:semanticTermColors = [1, 2, 3]
" disable cached colors: this allows colors to persist across files
" let g:semanticUseCache = 0

" color scheme
Plugin 'BarretRen/vim-colorscheme'


" HTML tag highlight
Plugin 'gregsexton/MatchTag'
" HTML navigation (without plugin)
" move between matching tags:
" 1. enter visual mode with v
" a + t : whole tag 
" i + t : inner tag select only
" o: jump to opposite tag



" jedi autocompleteion for python
Plugin 'davidhalter/jedi-vim'
let g:jedi#popup_on_dot = 0

" Plugin 'Valloric/YouCompleteMe'


" Nerdtree
Plugin 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>

call vundle#end()
"run 
"PluginUpdate
filetype plugin indent on
syntax on

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
inoremap <leader>< <><left>



" center screen around cursor:
"       zz

command! MakeTags !ctags -R .
" search for definition: ctrl+], ctrl + t to return
" g + ctrl + ] : find re-occuring tags

" reload all open files
" checkt[ime]

colorscheme monokai

" get out of insert mode
inoremap jk <Esc>

" set background to black
hi Normal ctermbg=16

" set comment color
hi Comment ctermbg=black
hi Comment ctermfg=lightblue

" search  highlight colors
hi Search ctermbg=LightBlue
hi Search ctermfg=Black

" search for string without regex
vnoremap <leader>f yw/\V<C-r>"<Cr>

" add key for copying to clipboard
" remember to install : vim-gtk first or it wont work
vnoremap <leader>y "+y

" window switching
nnoremap <leader>1 :1wincmd w<CR>
nnoremap <leader>2 :2wincmd w<CR>
nnoremap <leader>3 :3wincmd w<CR>
nnoremap <leader>4 :4wincmd w<CR>
nnoremap <leader>5 :5wincmd w<CR>
nnoremap <leader>6 :6wincmd w<CR>
nnoremap <leader>7 :7wincmd w<CR>
nnoremap <leader>8 :8wincmd w<CR>
nnoremap <leader>9 :9wincmd w<CR>
" status line
" set statusline=win:%{WindowNumber()}
" call Pl#Theme#InsertSegment(win:%{WindowNumber()})
" call Pl#Theme#InsertSegment('charcode', 'after', 'filetype')
"
" toggle line wrapping 
nnoremap <leader>w :set wrap! wrap?<CR>

" toggle nerdtree find
nnoremap <leader>nf :NERDTreeFind<CR><c-w><c-p>

" buffer
nnoremap gb :ls<CR>:b<Space>

" auto enter with colors
autocmd BufEnter *.py :SemanticHighlight
autocmd BufEnter *.js :SemanticHighlight
autocmd BufEnter *.cpp :SemanticHighlight
autocmd BufEnter *.h :SemanticHighlight
