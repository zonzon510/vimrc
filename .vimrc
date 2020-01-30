set nocompatible
filetype off
call plug#begin('~/.vim/plugged')

Plug 'jaxbot/semantic-highlight.vim'
" semantic highlighting
let g:semanticTermColors = [1, 2, 3, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15]

" vim surround
Plug 'tpope/vim-surround'

" Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim'}
Plug 'vim-airline/vim-airline'
" let g:airline_section_a = ''
let g:airline_section_x = ''
let g:airline_section_b = ''
let g:airline_section_warning = ''
let g:airline_section_z = '%3p%% %3l/%L %4c c'

Plug 'tpope/vim-fugitive'

Plug 'airblade/vim-gitgutter'
set updatetime=100

Plug 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

" vim indent guides
" toggle indent guide: 
" <leader>ig
Plug 'nathanaelkane/vim-indent-guides'

" HTML tag highlight
Plug 'gregsexton/MatchTag'
" HTML navigation (without plugin)


" vim dispatch
Plug 'tpope/vim-dispatch'

Plug 'dense-analysis/ale'

Plug 'Valloric/YouCompleteMe'
let g:ycm_auto_trigger = 0
let g:ycm_autoclose_preview_window_after_insertion = 0
let g:ycm_show_diagnostics_ui = 0
" error checking with pylint

" fzf
set rtp+=~/.fzf
Plug 'junegunn/fzf.vim'
" change name so ag.vim doesnt overwrite this command
:command -bang -nargs=* Agf call fzf#vim#ag(<q-args>, <bang>0)

" Plug 'neoclide/coc.nvim'

Plug 'rking/ag.vim'

call plug#end()

set laststatus=2
set encoding=utf-8


" define functions
fun! CheckEnableSemanticHighLight()

	" first see if semantic color is already on
	if exists('b:semanticOn')
		" semantic highlight is already on
		return
	else
		" check how many lines the file has
		if line('$') < 4000
			" enable semantic highlight
			:execute ":SemanticHighlight"
		endif
	endif


endfun
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
	call feedkeys("\<c-f>"."0ci'")
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
fun! OpenFileBrowser()
	let current_dir = expand("%:p:h")
	let file_name = expand("%:t")
	:execute ":e ".current_dir
	:call JumptoNext("/", "\\V".file_name)
endfun
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
fun! BufferSave()
	" save the file if it was modified
	if &modified == 1
		:silent! execute ":w"
	endif
endfun
fun! OpenTerm()
	let current_dir = expand("%:p:h")
	:execute ":term"
	call feedkeys("acd \"".current_dir."\"\<CR>")
	call feedkeys("clear"."\<CR>")
endfun
fun! QuickFixBufferListedOnly()
	let qfitems = getqflist()

	for i in qfitems
		if i['valid'] == 1
			" check if buffer is listed
			" (already has been opened)
			if buflisted(i['bufnr']) == 0
				" echo i
				" echo bufname(i['bufnr'])
				let i['text'] = bufname(i['bufnr']).' '.i['lnum'].' '.i['text']
				let i['bufnr'] = 0
				let i['lnum'] = 0
				let i['valid'] = 0
			endif
		endif
	endfor

	call setqflist(qfitems, 'r')
endfun
fun! QFSigns()
	" clear all qf signs
	call sign_unplace('qfsign_group')
	let qfitems = getqflist()

	let index = 0
	for i in qfitems
		if i['valid'] == 1
			call sign_place(index, 'qfsign_group', 'qfsign', bufname(i['bufnr']), {'lnum':i['lnum'], 'priority':11})
			let index = index + 1
		endif
	endfor

	" call setqflist(qfitems, 'r')

endfun
fun! ProcessQF()
	" add quickfix signs
	call QuickFixBufferListedOnly()
	call QFSigns()


endfun
fun! KillTerminals()
	" kill all open terminal buffers
	let buffers = filter(range(1, bufnr('$')), 'bufexists(v:val)')
	for i in buffers
		if stridx(bufname(i), "term\:") == 0
			:silent! execute ":bd! ".i
		endif
	endfor

endfun

fun! OpenVSCode()
	let full_file_path = expand("%")

	" let current_dir = expand("%:p:h")
	" let file_name = expand("%:t")

	echo full_file_path
	" get current line and column
	let line_num = getcurpos()[1]
	let line_col = getcurpos()[4]
	:execute ":!code --goto ".full_file_path.":".line_num.":".line_col

endfun

fun! SwitchBuffer()

	" remember screen location
	let w:new_switch_buffer_position = line(".")
	:execute "normal! H"
	let w:new_switch_buffer_position_top = line(".")

	" switch to buffer
	:execute ":b#"
	if exists("w:old_switch_buffer_position")
		:execute "normal! "+w:old_switch_buffer_position_top+"gg"
		:execute "normal! zt"
		:execute "normal! "+w:old_switch_buffer_position+"gg"
	endif

	let w:old_switch_buffer_position = w:new_switch_buffer_position
	let w:old_switch_buffer_position_top = w:new_switch_buffer_position_top

endfun

fun! SwitchFileWindow(reset)

	if a:reset == 1
		if exists("w:switch_file_window_set")
			unlet w:switch_file_window_set
		endif
	endif

	" save current view
	:execute ":w"
	let current_win_number = win_getid()
	let new_filename = $HOME."/.vim_views/"."new_view_".current_win_number.".vim"
	let old_filename = $HOME."/.vim_views/"."old_view_".current_win_number.".vim"
	:execute "silent !mkdir ~/.vim_views/ > /dev/null 2>&1"
	set vop=folds,cursor
	:execute ":mkview! ".new_filename

	if(filereadable(old_filename))
		if exists("w:switch_file_window_set")
			:execute "e blank"
			:execute ":source ".old_filename
		endif
	endif
	:execute "silent !mv ".new_filename." ".old_filename

	let w:switch_file_window_set = 1
endfun

fun! DiffThisF()
	diffthis
	setlocal wrap
endfun

fun! AddToInterestingWords()
	echo expand("<cword>")
	let match_pattern = expand("<cword>")
	echo match_pattern
	let match_pattern_word = "\\<".match_pattern."\\>"
	echo match_pattern_word
	let cmdstr = ":call matchadd(\"InterestingWords\", '".match_pattern_word."', -1)"
	echo cmdstr
	:execute cmdstr
endfun

"run 
"PluginUpdate
filetype plugin indent on
syntax on

" ale highlight colors
highlight ALEWarning ctermbg=NONE cterm=inverse
highlight ALEError ctermbg=NONE cterm=inverse
" this isnt working for some reason

" search / highlight settings 
set hlsearch
set cursorline
set wrap

command! Diffthis call DiffThisF()
command! MakeTags !ctags -R .
" command! MakeTags !ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .
" set leader key to space

set background=dark
highlight clear


if exists("syntax_on")
  syntax reset
endif

" autocommands
" auto enter with colors
autocmd bufenter *.py :call CheckEnableSemanticHighLight()
autocmd bufenter *.js :call CheckEnableSemanticHighLight()
autocmd bufenter *.cpp :call CheckEnableSemanticHighLight()
autocmd bufenter *.c :call CheckEnableSemanticHighLight()
autocmd bufenter *.h :call CheckEnableSemanticHighLight()
autocmd BufEnter *.py :call CheckEnableSemanticHighLight()

autocmd BufLeave * :call BufferSave()
autocmd BufWrite * :mksession! ~/.autosave.vim

autocmd QuickfixCmdPost make call ProcessQF()
autocmd QuickfixCmdPost cgetfile call ProcessQF()

au InsertLeave * match ExtraWhitespace /\s\+$/
au InsertLeave *.py :SemanticHighlight
au InsertLeave *.cpp :SemanticHighlight
au InsertLeave *.h :SemanticHighlight
au InsertLeave *.js :SemanticHighlight

" break indent level matching
set breakindent
set showbreak=>>
set display +=lastline

" set default latex filetype
let g:tex_flavor = "latex"
" incsearch
set incsearch
set t_Co=256

" when saving session, dont save options
set sessionoptions-=options

" close split without resizing windows
set noea
set foldlevelstart=20

" define quickfix signs
call sign_define('qfsign', {"text" : "q>",})

" let g:colors_name = "monokai"
"colors:

" indicate trailing white space
highlight ExtraWhitespace ctermbg=19
match ExtraWhitespace / \+$/

highlight InterestingWords ctermfg=19


hi Cursor ctermfg=235 ctermbg=231 cterm=NONE
hi Visual ctermfg=NONE ctermbg=59 cterm=NONE
hi CursorLine ctermfg=NONE ctermbg=236 cterm=NONE
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
hi Folded ctermfg=242 ctermbg=NONE cterm=NONE
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

let mapleader=" "

" # # # # # # # # # # # # # # # # # # # # # # # #
" #   N O R M A L  M O D E  M A P P I N G S     #
" # # # # # # # # # # # # # # # # # # # # # # # #

" move up one indentation level
nmap <c-p> :call UpByIndent()<cr>
" find
nnoremap <SPACE> <Nop>
" buffer
" nnoremap gb :ls<CR>:b<Space>
nnoremap gb :Buffers<CR>
" move to line with same indentation
nnoremap <c-k> :call MoveBySameLevel("up")<cr>
" move to line with same indentation
nnoremap  <c-j> :call MoveBySameLevel("down")<cr>
" quickfix jump list
nnoremap [q :cprev <CR>
nnoremap ]q :cnext <CR>
nnoremap [Q :cfirst <CR>
nnoremap ]Q :clast <CR>
nnoremap <C-u> 5<C-y>
nnoremap <C-d> 5<C-e>
" half screen movement
nnoremap <leader>d <C-d>
nnoremap <leader>u <C-u>
" fast movement
nnoremap J 5j
" fast movement
nnoremap K 5k
" open quickfix menu
nnoremap gc :copen <CR><C-w>J
" add a word to to search, searching for multiple words
nnoremap <leader>ff viwyb/\<<C-R>"\><CR>
" space key doesnt do anything
nnoremap <leader>fa viwyb/<C-R>/\\|\<<C-R>"\><CR>
" remove most recently added seach item
nnoremap <leader>fr msHmt/<C-P><C-F>F\|hd$<CR>`tzt`s
" set search to previously searched pattern
nnoremap <leader>fp msHmt/<C-p><C-p><CR>`tzt`s
" search add another word to search pattern
nnoremap <leader>fs /<C-p>\\|\c
" grep
nnoremap <leader>gg yiw:call MyGrep('-rIi', "<C-R>"")<cr>
" grep
nnoremap <leader>gr yiw:call MyGrepSilent('-rIw', "<C-R>"")<cr>
" open file browser at folder of current file
nnoremap <leader>cp :call OpenFileBrowser()<CR>
" open method in single line split
nnoremap <leader>mo :call SplitViewMethodOpen()<cr>
" close method
nnoremap <leader>mc :call SplitViewMethodClose()<cr>
" checktime shortcut
nnoremap <leader>ch :checktime<CR>
" open a terminal
nnoremap <leader>te :call OpenTerm()<CR>
" open a terminal
nnoremap <leader>ta :TagbarToggle<CR>
" save session
nnoremap <leader>mk :mksession! .save.vim<CR>
" run Make silent
nnoremap <leader>ms :w<CR>:Make!<CR>
" run Make
nnoremap <leader>ma :w<CR>:Make<CR>
" run get quickfix results from Copen
nnoremap <leader>mC :Copen<CR><C-w>p:cclo<CR>
" filter quickfix results to include only files in a buffer
nnoremap <leader>qb :call QuickFixBufferListedOnly()<CR>
" delete all terminal buffers
nnoremap <leader>kat :call KillTerminals()<cr>
" toggle ale linting
nnoremap <leader>l :ALEToggle <CR>
" command for toggleing line numbers
nnoremap <leader>nu :set invnumber<CR>
" toggle line wrapping
nnoremap <leader>W :set wrap! wrap?<CR>
" toggle line wrapping
nnoremap <leader>w :w<CR>
" toggle semantic highlighting
nnoremap <leader>jc :SemanticHighlightToggle<cr>
" fuzzy finding things
nnoremap <leader>ja  :Tags 
nnoremap <leader>jl :Lines 
nnoremap <leader>jb :BLines 
" move line to end of line above it
nnoremap <leader>J J
" open documentation
nnoremap <leader>K K
" case insensitive search
nnoremap <leader>s /\c
" case insensitive search forward
nnoremap <leader>S ?\c
" case sensitive search backward
" nnoremap <leader>S /
" no highlight
nnoremap <leader>nh :noh<cr>
" close preview window
nnoremap <C-Space> :pc<CR>
" open in vscode
nnoremap <leader>v :w<CR>:call OpenVSCode()<CR><CR>
nnoremap <leader>ic :set ic! ic?<CR>
" change to directory of currently open file
nnoremap <leader>cd :cd %:p:h<CR>

nnoremap <leader>pw :pwd<CR>

" silver searching
nnoremap <leader>aa yiw :Ag! -w <C-R>"<CR><C-w>p
" type the search pattern
nnoremap <leader>ag :Ag! 
" ag fuzzy find search
nnoremap <leader>af :Agf 
" switch to previous buffer
nmap <leader>ph :call SwitchBuffer()<CR>
nmap <leader>b :call SwitchFileWindow(0)<CR>
nmap <leader>B :call SwitchFileWindow(1)<CR>


" yank filename
nnoremap <leader>y :let @"=expand("%")<CR>

nnoremap <leader>h :call AddToInterestingWords()<CR>

" # # # # # # # # # # # # # # # # # # # # # # # #
" #   V I S U A L  M O D E  M A P P I N G S     #
" # # # # # # # # # # # # # # # # # # # # # # # #

" space key does nothing
vnoremap <SPACE> <Nop>
" moving indentation easier
vnoremap < <gv
vnoremap > >gv
" search for highlighted string without regex
vnoremap <leader>ff yb/\V<C-r>"<Cr>
" add word to search pattern
vnoremap <leader>fa yb/<C-R>/\\|\V<C-r>"<CR>
" add key for copying to clipboard
" remember to install : vim-gtk first or it wont work
vnoremap <leader>y "+y
" grep
vnoremap <leader>gg y:call MyGrep('-rI', "<C-R>"")<cr>
" grep
vnoremap <leader>gr y:call MyGrepSilent('-rI', "<C-R>"")<cr>
" send stack trace to quickfix
vnoremap <leader>qq :cgetbuffer<CR> :call ProcessQF()<CR>
" get the stack trace, only filter QuickFixBufferListedOnly
vnoremap <leader>qv :cgetbuffer<CR> :call QuickFixBufferListedOnly()<CR>

" # # # # # # # # # # # # # # # # # # # # # # # #
" #   I N S E R T  M O D E  M A P P I N G S     #
" # # # # # # # # # # # # # # # # # # # # # # # #

" automatic closing brackets
inoremap ;" ""<left>
inoremap ;' ''<left>
inoremap ;[ []<left>
inoremap ;{ {}<left>
inoremap ;( ()<left>
inoremap ;< <><left>
" jump points
inoremap <space><space> <Esc>:call JumptoNext("/", "<++>")<cr>"_c4l
" set ctrl + c identica l to ctrl+[
" inoremap <c-c> <Esc>
" exit insert mode
inoremap <c-k> <c-c>
imap <c-x><c-m> <plug>(fzf-complete-line)

" # # # # # # # # # # # # # # # # # # # # # # # # #
" #   C O M M A N D  M O D E  M A P P I N G S     #
" # # # # # # # # # # # # # # # # # # # # # # # # #

" left and right keys in command mode
cmap HH <left>
cmap LL <right>

cmap <C-w> \<
cmap <C-e> \>





