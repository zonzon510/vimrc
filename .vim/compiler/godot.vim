if exists("current_compiler")
  finish
endif
let current_compiler = "godot"

let s:cpo_save = &cpo
set cpo&vim

" CompilerSet errorformat=%.%#\CompilerResultsLog:\ %f:%l:%c:\ %m
CompilerSet errorformat=
	\%E%.%#SCRIPT\ ERROR:\ GDScript::reload:\ %.%#1m%m,%Z%>%.%#res://%f:%l%.%#

CompilerSet makeprg=godot\ --script\ %\ --check-only

let &cpo = s:cpo_save
unlet s:cpo_save
