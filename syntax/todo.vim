" Vim syntax file
" Language: Personal todo files
" Maintainer: Andrew Norman <anorman728@gmail.com>

if exists("b:current_syntax")
    finish
endif

" This isn't an actual language, so syntax case is irrelevant.

    syn case ignore

" Create regex matches for types of lines.

    syn match todoTodo          /^\(\s\|\)\+>.*$/
    syn match todoTitle         /^\(.*\|\):\(\s\|\)\+$/
    syn match todoDone          /^\(\s\|\)\++.*$/
    syn match todoWait          /^\(\s\|\)\+\.\.\..*$/
    syn match todoInformation   /^\(\s\|\)\+\*.*$/
    syn match todoCanceled      /^\(\s\|\)\+-.*$/
    syn match todoQuestion      /^\(\s\|\)\+?.*$/
    syn match todoImportant     /^\(\s\|\)\+!.*$/

" Create keywords

"   syn keyword todoCommentTodo TODO

" Create color context.  (:help group-name to see legend)

    highlight link todoTodo         Type
    highlight link todoTitle        Statement
    highlight link todoDone         Constant
    highlight link todoWait         PreProc
    highlight link todoInformation  Identifier
    highlight link todoCanceled     Error
    highlight link todoQuestion     Special
    highlight link todoImportant    Special
"   highlight link todoCommentTodo  Todo


let b:current_syntax = "todo"
