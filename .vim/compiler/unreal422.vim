if exists("current_compiler")
  finish
endif
let current_compiler = "unreal"

let s:cpo_save = &cpo
set cpo&vim

" CompilerSet errorformat=%.%#\ CompilerResultsLog:\ %f:line\ %l
" CompilerSet errorformat=%.%#\ CompilerResultsLog:\ %f
" CompilerSet errorformat=%.%#\ %.%#\rrors:\ %f

" CompilerSet errorformat=%.%#\CompilerResultsLog:\ %f\(%l\)\ %m
" CompilerSet errorformat=%.%#\CompilerResultsLog:\ %f\(%l\):\ %m
CompilerSet errorformat=\%.%#\CompilerResultsLog:\ Error:\ %f\(%l\)%m
CompilerSet errorformat+=\%.%#\CompilerResultsLog:\ %f\(%l\)%m

let &cpo = s:cpo_save
unlet s:cpo_save
