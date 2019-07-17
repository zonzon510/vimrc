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
Plugin 'tpope/vim-fugitive'



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
" Plugin 'davidhalter/jedi-vim'
" let g:jedi#popup_on_dot = 0

Plugin 'Valloric/YouCompleteMe'
let g:ycm_auto_trigger = 0
let g:ycm_autoclose_preview_window_after_insertion = 1

" Plugin 'vim-syntastic/syntastic'
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0 

" error checking with pylint
Plugin 'w0rp/ale'

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
" set number

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

" indicate trailing white space
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" moving indentation easier
vnoremap < <gv
vnoremap > >gv

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

" break indent level matching
set breakindent
set showbreak=->
set display +=lastline

" set default latex filetype
let g:tex_flavor = "latex"
" incsearch
set incsearch

" move up one indentation level
fun! UpByIndent()
	normal! m'
	norm! ^
	let start_col = col(".")
	let col = start_col
	while col >= start_col
		norm! k^
		if getline(".") =~# '^\s*$'
			let col = start_col
		elseif col(".") <= 1
			return
		else
			let col = col(".")
		endif
	endwhile
endfun
nnoremap <c-p> :call UpByIndent()<cr>

" move to line with same indentation
nnoremap <c-k> :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')<CR>
nnoremap  <c-j> :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')<CR>

" jump to next/previous method:
" ]m / [m

let g:NERDTreeNodeDelimiter = "\u00a0"

" command for toggleing line numbers
nnoremap  <leader>nu :set invnumber<CR>

" in the current buffer window
" show the file in nerdtree
nnoremap <leader>cp :let @" = expand("%")<CR>:e <C-R>"<C-F>dT/<CR>/<C-R>"\><CR>


" quickfix jump list
nnoremap [q :cprev <CR>
nnoremap ]q :cnext <CR>
nnoremap [Q :cfirst <CR>
nnoremap ]Q :clast <CR>
" vimgrep -recursive
" :vimgrep /pattern/gj **/*.py

" all files:
" :vimgrep /pattern/gj **/*

" when saving session, dont save options
set sessionoptions-=options
