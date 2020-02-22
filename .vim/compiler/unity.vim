if exists("current_compiler")
  finish
endif
let current_compiler = "unity"

let s:cpo_save = &cpo
set cpo&vim

" CompilerSet errorformat=%.%#\ CompilerResultsLog:\ %f:line\ %l
" CompilerSet errorformat=%.%#\ CompilerResultsLog:\ %f
" CompilerSet errorformat=%.%#\ %.%#\rrors:\ %f
" CompilerSet errorformat=%.%#\CompilerResultsLog:\ %f:%l:%c:\ %m

" need two back slashed before comma in pattern
CompilerSet errorformat=%f(%l\\,%c):\ %m

let &cpo = s:cpo_save
unlet s:cpo_save
