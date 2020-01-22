if exists("current_compiler")
  finish
endif
let current_compiler = "python"

let s:cpo_save = &cpo
set cpo&vim


" set compiler only on first entering buffer
if !exists("b:set_python_compiler_this_buffer")
	CompilerSet errorformat=
	      \%*\\sFile\ \"%f\"\\,\ line\ %l\\,\ %m,
	      \%*\\sFile\ \"%f\"\\,\ line\ %l,
	CompilerSet makeprg=python\ %
endif

let b:set_python_compiler_this_buffer = 1

let &cpo = s:cpo_save
unlet s:cpo_save
