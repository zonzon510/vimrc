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
"


" VIM Fugutive
Plugin 'tpope/vim-fugitive'

" vim surround
Plugin 'tpope/vim-surround'



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
let g:semanticTermColors = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 21, 57, 93, 129, 165, 201, 46, 82, 118, 154, 190, 226, 51, 87, 123, 159, 195, 231]
" let g:semanticTermColors = [1, 2, 3]
" disable cached colors: this allows colors to persist across files
" let g:semanticUseCache = 0

" color scheme
" Plugin 'BarretRen/vim-colorscheme'


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
let g:ycm_show_diagnostics_ui = 0

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


" gdb
Plugin 'sakhnik/nvim-gdb'

" Nerdtree
Plugin 'scrooloose/nerdtree'

map <C-n> :NERDTreeToggle<CR>

call vundle#end()

" set leader key to space
let mapleader=" "
nnoremap <SPACE> <Nop>
vnoremap <SPACE> <Nop>

" toggle ale linting
nmap <leader>l :ALEToggle <CR>
" ale highlight colors
highlight ALEWarning ctermbg=NONE cterm=inverse
highlight ALEError ctermbg=NONE cterm=inverse
" this isnt working for some reason

" toggle semantic highlighting
nnoremap <leader>ss :SemanticHighlightToggle<cr>
" nnoremap <leader>so :SemanticHighlight<cr>

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
inoremap ;" ""<left>
inoremap ;' ''<left>
inoremap ;[ []<left>
inoremap ;{ {}<left>
inoremap ;( ()<left>
inoremap ;< <><left>



" center screen around cursor:
"       zz

command! MakeTags !ctags -R .
" search for definition: ctrl+], ctrl + t to return
" g + ctrl + ] : find re-occuring tags

" reload all open files
" checkt[ime]


" moving indentation easier
vnoremap < <gv
vnoremap > >gv

" colorscheme monokai
" Vim color file
" Converted from Textmate theme Monokai using Coloration v0.3.2 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

set t_Co=256
" let g:colors_name = "monokai"
"colors:

" indicate trailing white space
highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace / \+$/
au InsertLeave * match ExtraWhitespace /\s\+$/

hi Cursor ctermfg=235 ctermbg=231 cterm=NONE
hi Visual ctermfg=NONE ctermbg=59 cterm=NONE
hi CursorLine ctermfg=NONE ctermbg=237 cterm=NONE
hi CursorColumn ctermfg=NONE ctermbg=237 cterm=NONE
hi ColorColumn ctermfg=NONE ctermbg=237 cterm=NONE
" line number
hi LineNr ctermfg=255 ctermbg=NONE cterm=NONE
" vertical split
hi VertSplit ctermfg=241 ctermbg=16 cterm=NONE
" matching parenthesiis
hi MatchParen ctermfg=197 ctermbg=NONE cterm=underline
hi StatusLine ctermfg=231 ctermbg=241 cterm=bold
hi StatusLineNC ctermfg=231 ctermbg=241 cterm=NONE
hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE
hi PmenuSel ctermfg=NONE ctermbg=59 cterm=NONE
hi IncSearch ctermfg=235 ctermbg=186 cterm=NONE
" highlight color
hi Search ctermfg=NONE ctermbg=16 cterm=inverse
hi Directory ctermfg=141 ctermbg=NONE cterm=NONE
hi Folded ctermfg=242 ctermbg=235 cterm=NONE
" column in vertical split
hi SignColumn ctermfg=NONE ctermbg=red cterm=NONE
" normal text
hi Normal ctermfg=195 ctermbg=NONE cterm=NONE
hi Boolean ctermfg=141 ctermbg=NONE cterm=NONE
hi Character ctermfg=141 ctermbg=NONE cterm=NONE
hi Comment ctermfg=lightblue ctermbg=NONE cterm=NONE
hi Conditional ctermfg=226 ctermbg=NONE cterm=NONE
hi Constant ctermfg=NONE ctermbg=NONE cterm=NONE
hi Define ctermfg=197 ctermbg=NONE cterm=NONE
hi DiffAdd ctermfg=231 ctermbg=64 cterm=bold
hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE
hi DiffChange ctermfg=NONE ctermbg=NONE cterm=NONE
hi DiffText ctermfg=231 ctermbg=24 cterm=bold
hi ErrorMsg ctermfg=231 ctermbg=197 cterm=NONE
hi WarningMsg ctermfg=231 ctermbg=197 cterm=NONE
hi Float ctermfg=141 ctermbg=NONE cterm=NONE
hi Function ctermfg=40 ctermbg=NONE cterm=NONE
hi Identifier ctermfg=81 ctermbg=NONE cterm=NONE
hi Keyword ctermfg=197 ctermbg=NONE cterm=NONE
hi Label ctermfg=186 ctermbg=NONE cterm=NONE

" the area after the last line
hi NonText ctermfg=NONE ctermbg=NONE cterm=NONE

hi Number ctermfg=141 ctermbg=NONE cterm=NONE
hi Operator ctermfg=197 ctermbg=NONE cterm=NONE
" python imports PreProc
hi PreProc ctermfg=225 ctermbg=NONE cterm=NONE
hi Special ctermfg=231 ctermbg=NONE cterm=NONE
hi SpecialComment ctermfg=242 ctermbg=NONE cterm=NONE
hi SpecialKey ctermfg=59 ctermbg=237 cterm=NONE
" classes and function definitions
hi Statement ctermfg=141 ctermbg=NONE cterm=NONE
hi StorageClass ctermfg=81 ctermbg=NONE cterm=NONE
" color of string
hi String ctermfg=129 ctermbg=NONE cterm=NONE
hi Tag ctermfg=255 ctermbg=NONE cterm=NONE
hi Title ctermfg=231 ctermbg=NONE cterm=bold
hi Todo ctermfg=95 ctermbg=NONE cterm=inverse,bold
" a lot of things are this color especially in vimrc
hi Type ctermfg=117 ctermbg=NONE cterm=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline
hi rubyClass ctermfg=197 ctermbg=NONE cterm=NONE
hi rubyFunction ctermfg=148 ctermbg=NONE cterm=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE
hi rubySymbol ctermfg=141 ctermbg=NONE cterm=NONE
hi rubyConstant ctermfg=81 ctermbg=NONE cterm=NONE
hi rubyStringDelimiter ctermfg=186 ctermbg=NONE cterm=NONE
hi rubyBlockParameter ctermfg=208 ctermbg=NONE cterm=NONE
hi rubyInstanceVariable ctermfg=NONE ctermbg=NONE cterm=NONE
hi rubyInclude ctermfg=197 ctermbg=NONE cterm=NONE
hi rubyGlobalVariable ctermfg=NONE ctermbg=NONE cterm=NONE
hi rubyRegexp ctermfg=186 ctermbg=NONE cterm=NONE
hi rubyRegexpDelimiter ctermfg=186 ctermbg=NONE cterm=NONE
hi rubyEscape ctermfg=141 ctermbg=NONE cterm=NONE
hi rubyControl ctermfg=197 ctermbg=NONE cterm=NONE
hi rubyClassVariable ctermfg=NONE ctermbg=NONE cterm=NONE
hi rubyOperator ctermfg=197 ctermbg=NONE cterm=NONE
hi rubyException ctermfg=197 ctermbg=NONE cterm=NONE
hi rubyPseudoVariable ctermfg=NONE ctermbg=NONE cterm=NONE
hi rubyRailsUserClass ctermfg=81 ctermbg=NONE cterm=NONE
hi rubyRailsARAssociationMethod ctermfg=81 ctermbg=NONE cterm=NONE
hi rubyRailsARMethod ctermfg=81 ctermbg=NONE cterm=NONE
hi rubyRailsRenderMethod ctermfg=81 ctermbg=NONE cterm=NONE
hi rubyRailsMethod ctermfg=81 ctermbg=NONE cterm=NONE
hi erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE
hi erubyComment ctermfg=95 ctermbg=NONE cterm=NONE
hi erubyRailsMethod ctermfg=81 ctermbg=NONE cterm=NONE
hi htmlTag ctermfg=148 ctermbg=NONE cterm=NONE
hi htmlEndTag ctermfg=148 ctermbg=NONE cterm=NONE
hi htmlTagName ctermfg=NONE ctermbg=NONE cterm=NONE
hi htmlArg ctermfg=NONE ctermbg=NONE cterm=NONE
hi htmlSpecialChar ctermfg=141 ctermbg=NONE cterm=NONE
hi javaScriptFunction ctermfg=81 ctermbg=NONE cterm=NONE
hi javaScriptRailsFunction ctermfg=81 ctermbg=NONE cterm=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE
hi yamlKey ctermfg=197 ctermbg=NONE cterm=NONE
hi yamlAnchor ctermfg=NONE ctermbg=NONE cterm=NONE
hi yamlAlias ctermfg=NONE ctermbg=NONE cterm=NONE
hi yamlDocumentHeader ctermfg=186 ctermbg=NONE cterm=NONE
hi cssURL ctermfg=208 ctermbg=NONE cterm=NONE
hi cssFunctionName ctermfg=81 ctermbg=NONE cterm=NONE
hi cssColor ctermfg=141 ctermbg=NONE cterm=NONE
hi cssPseudoClassId ctermfg=148 ctermbg=NONE cterm=NONE
hi cssClassName ctermfg=148 ctermbg=NONE cterm=NONE
hi cssValueLength ctermfg=141 ctermbg=NONE cterm=NONE
hi cssCommonAttr ctermfg=81 ctermbg=NONE cterm=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE

" get out of insert mode
" inoremap jk <Esc>

" set background to black
" hi Normal ctermbg=16

" set comment color
" search  highlight colors
" hi Search ctermbg=LightBlue
" hi Search ctermbg=164
" hi Search ctermfg=Black

" ---------------------------------------
" add and remove items from search patterns
" ---------------------------------------
" search for highlighted string without regex
vnoremap <leader>f yb/\V<C-r>"<Cr>
" search for word under cursor but dont jump to next result
" nnoremap <leader>f viwy:let @/='\<<C-R>"\>'<CR>:set hlsearch<CR>
nnoremap <leader>f viwyb/\<<C-R>"\><CR>
" add a word to to search, searching for multiple words
nnoremap <leader>af viwyb/<C-R>/\\|\<<C-R>"\><CR>
" same thing in visual mode
vnoremap <leader>af yb/<C-R>/\\|\V<C-r>"<CR>
" remove most recently added seach item
" nnoremap <leader>rf :let @/ = '<C-R>/<C-F>F\|hd$a'<ESC><CR>
nnoremap <leader>rf msHmt/<C-P><C-F>F\|hd$<CR>`tzt`s
" set search to previously searched pattern
nnoremap <leader>sp msHmt/<C-p><C-p><CR>`tzt`s


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
nnoremap <leader>nf :NERDTreeFind<CR>

" buffer
nnoremap gb :ls<CR>:b<Space>


fun! CheckEnableSemanticHighLight()

	" first see if semantic color is already on
	if exists('b:semanticOn')
		" semantic highlight is already on
		return
	else
		" check how many lines the file has
		if line('$') < 1000
			" enable semantic highlight
			:execute ":SemanticHighlight"
		endif
	endif


endfun

" auto enter with colors
autocmd bufenter *.py :call CheckEnableSemanticHighLight()
autocmd bufenter *.js :call CheckEnableSemanticHighLight()
autocmd bufenter *.cpp :call CheckEnableSemanticHighLight()
autocmd bufenter *.c :call CheckEnableSemanticHighLight()
autocmd bufenter *.h :call CheckEnableSemanticHighLight()
autocmd BufEnter *.py :call CheckEnableSemanticHighLight()

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

	" mark the current position
	normal! m'

	" if the column is blank, find the first non blank column moving upward
	if col("$") == 1
		while col("$") == 1
			normal! j
		endwhile
	endif

	norm! ^
	let start_col = col(".")
	let col = start_col
	while col >= start_col
		norm! k^
		if getline(".") =~# '^\s*$'
			let col = start_col
		elseif col(".") <= 1
			norm! $
			return
		else
			let col = col(".")
		endif
	endwhile
	norm! $
endfun
nmap <c-p> :call UpByIndent()<cr>

" move to line with same indentation

fun! MoveBySameLevel(direction)
	normal! m`

	" if cursor is on a blank line
	if col("$") == 1
		while col("$") == 1
			if a:direction == "up"
				normal! k
			else
				normal! j
			endif
		endwhile
	else
	" if the cursor is on a line with text

		if a:direction == "down"
			:execute search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')

		elseif a:direction == "up"
			:execute search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')
		endif

	endif



endfun


nnoremap <c-k> :call MoveBySameLevel("up")<cr>
nnoremap  <c-j> :call MoveBySameLevel("down")<cr>


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


" grep-
fun! MyGrep(sargs, pattern)
	" if ignore directories dont exist, create them
	:execute "silent !touch ./.grepignoredir > /dev/null 2>&1"
	:execute "silent !touch ./.grepignorefile > /dev/null 2>&1"
	let s:lines = readfile('.grepignoredir')
	let s:dirs_ignore = ''
	for s:line in s:lines
		let s:dirs_ignore = s:dirs_ignore . s:line . ","
	endfor

	let s:lines = readfile('.grepignorefile')
	let s:files_ignore = ''
	for s:line in s:lines
		let s:files_ignore = s:files_ignore . s:line . ","
	endfor

	let s:commandstr = ':grep '.a:sargs.' --exclude={'.s:files_ignore.'} --exclude-dir={' . s:dirs_ignore.'} '."'".a:pattern."' *"
	" type keys
	call feedkeys(s:commandstr)
	" execute immediately
	" :execute s:commandstr
endfun


fun! MyGrepSilent(sargs, pattern)
	" check if semantic highlighting is set
	let s:set_semantic = 0
	if exists('b:semanticOn')
		if b:semanticOn == 1
			let s:set_semantic = 1
		endif
	endif

	" if ignore directories dont exist, create them
	:execute "silent !touch ./.grepignoredir > /dev/null 2>&1"
	:execute "silent !touch ./.grepignorefile > /dev/null 2>&1"
	let s:lines = readfile('.grepignoredir')
	let s:dirs_ignore = ''
	for s:line in s:lines
		let s:dirs_ignore = s:dirs_ignore . s:line . ","
	endfor

	let s:lines = readfile('.grepignorefile')
	let s:files_ignore = ''
	for s:line in s:lines
		let s:files_ignore = s:files_ignore . s:line . ","
	endfor

	let s:commandstr = ':silent grep '.a:sargs.' --exclude={'.s:files_ignore.'} --exclude-dir={' . s:dirs_ignore.'} '."'".a:pattern."' *"

	" set marks for current screen position
	:execute "normal! msHmt"
	" call grep
	:execute s:commandstr
	" return to the original position
	:execute "normal! \<C-o>`tzt`s"
	" turn on semantic highlight
	if s:set_semantic == 1
		:execute ":SemanticHighlight"
	endif

endfun

nnoremap <leader>gg yiw:call MyGrep('-rIw', "<C-R>"")<cr>

vnoremap <leader>gg y:call MyGrep('-rI', "<C-R>"")<cr>

nnoremap <leader>gr yiw:call MyGrepSilent('-rIw', "<C-R>"")<cr>

vnoremap <leader>gr y:call MyGrepSilent('-rI', "<C-R>"")<cr>

" close split without resizing windows
set noea

" left and right keys in command mode
cmap HH <left>
cmap LL <right>

" diff mode
" enable diff mode
" diffthis
" disable:
" diffoff!
"
nnoremap gc :copen 

fun! JumptoNext(direction, jump_to)
	" save old search
	let old = @/

	" jump to next <++>
	" let cmdstring = a:direction."<++>\<cr>"
	let cmdstring = a:direction.a:jump_to."\<cr>"
	:execute "normal! ".cmdstring

	" restore search
	call histdel('/', -1)
	let @/ = old
endfun

" jump points
inoremap <space><space> <Esc>:call JumptoNext("/", "<++>")<cr>"_c4l

fun! SplitViewMethodOpen()
	:execute ":split"
	" "call UpByIndent()
	" " ! ignores mappings
	:execute ":normal [m"
	:execute "normal! 1\<C-W>_"
	:execute "normal! zz"
	:execute ":normal \<c-w>p"
endfun

fun! SplitViewMethodClose()
	:execute ":normal \<c-w>k"
	if winheight(0) == 1
		" this is a view opened by method function
		:execute ":q"
		return
	endif
endfun

" open method in single line split
nnoremap <leader>mo :call SplitViewMethodOpen()<cr>
" close method
nnoremap <leader>mc :call SplitViewMethodClose()<cr>

" set ctrl + c identica l to ctrl+[
inoremap <c-c> <Esc>
inoremap <c-k> <c-c>

set foldlevelstart=20

fun! BufferSave()
	" save the file if it was modified
	if &modified == 1
		:execute ":w"
	endif
endfun

autocmd BufLeave * :call BufferSave()

" checktime shortcut
nnoremap <leader>ch :checktime<CR>

