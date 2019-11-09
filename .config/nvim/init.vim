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


" quick ctrl+E / Y
nnoremap <C-A-e> 5<C-e>
nnoremap <C-A-y> 5<C-y>

" " quick move
" nnoremap <A-k> 5k
" nnoremap <A-j> 5j


" rerun terminal command
tnoremap <A-r> <ESC>k<CR><C-\><C-N> :call SetRunBuffer()<CR>a

" terminal for running last command
fun! RunBuffer()

	" echo stridx("term", bufname("%"))
	if stridx(bufname("%"),"term") == -1 && exists("g:run_buffer_number")

		" check if semantic highlighting is set
		let s:set_semantic = 0
		if exists('b:semanticOn')
			if b:semanticOn == 1
				let s:set_semantic = 1
			endif
		endif

		" set marks for current screen position
		:execute ":w"
		:execute "normal! msHmt"

		" switch to buffer
		:execute ":b ".g:run_buffer_number
		" run the last command
		call feedkeys("a")
		call feedkeys("\<ESC>"."k"."\<CR>")

		" go to normal mode
		call feedkeys("\<C-\>"."\<C-N>")

		" return to original position
		call feedkeys("\<C-o>")
		call feedkeys("")
		call feedkeys("`tzt`s")

		if s:set_semantic == 1
			" :execute ":SemanticHighlight"
			call feedkeys(":SemanticHighlight\<CR>")
		endif
	endif


endfun
fun! GetQFFromBuffer()

	" echo stridx("term", bufname("%"))
	if stridx(bufname("%"),"term") == -1 && exists("g:run_buffer_number")

		" check if semantic highlighting is set
		let s:set_semantic = 0
		if exists('b:semanticOn')
			if b:semanticOn == 1
				let s:set_semantic = 1
			endif
		endif

		" set marks for current screen position
		:execute ":w"
		:execute "normal! msHmt"

		" switch to buffer
		:execute ":b ".g:run_buffer_number
		" run the last command
		:execute "normal! G$"
		:execute "normal! ?zompc"."\<CR>"
		:execute "normal! V"
		:execute "normal! ?zompc"."\<CR>"
		call feedkeys(":cgetbuffer"."\<CR>")

		" return to original position
		call feedkeys(":b#\<CR>")
		" call feedkeys("")
		call feedkeys("`tzt`s")
		call feedkeys(":call QuickFixBufferListedOnly()\<CR>")

		if s:set_semantic == 1
			" :execute ":SemanticHighlight"
			call feedkeys(":SemanticHighlight\<CR>")
		endif

	endif


endfun

fun! SetRunBuffer()
	let g:run_buffer_number = bufnr('%')
endfun

nnoremap <A-r> :call RunBuffer()<CR>
nnoremap <leader>qq :call GetQFFromBuffer()<CR>
nnoremap <A-w> :w<cr>
nnoremap <A-c> :SemanticHighlightToggle<cr>
nnoremap <A-C-j> 5j
nnoremap <A-C-k> 5k
inoremap <A-o> <Esc>
" run Make
nnoremap <A-m> :Make<CR>
" run Make silent
nnoremap <A-C-m> :Make!<CR>
