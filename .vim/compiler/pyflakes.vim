if exists("current_compiler")
  finish
endif
let current_compiler = "pyflakes"

" CompilerSet makeprg=pyflakes\ %

let s:cpo_save = &cpo
set cpo&vim

CompilerSet errorformat=
	\%-G%.%#\ assigned\ to\ but\ never\ used%.%#,
	\%-G%.%#\ imported\ but\ unused%.%#,
	\%f:%l:%c\ %m,
	\%f:%l:%c:\ %m


CompilerSet makeprg=pyflakes\ %

let &cpo = s:cpo_save
unlet s:cpo_save
