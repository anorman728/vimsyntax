" Vim syntax file
" Language: Personal todo files
" Maintainer: Andrew Norman <anorman728@gmail.com>

if exists("b:current_syntax")
    finish
endif

" This isn't an actual language, so syntax case is irrelevant.

    syn case ignore

" Create regex matches for types of lines.

    syn match todoTitle         /^\(.*\|\):\(\s\|\)\+$/  contains=todoUnderline
    syn match todoTodo          /^\(\s\|\)\+>.*$/        contains=todoUnderline
    syn match todoDone          /^\(\s\|\)\++.*$/        contains=todoUnderline
    syn match todoWait          /^\(\s\|\)\+\.\.\..*$/   contains=todoUnderline
    syn match todoInformation   /^\(\s\|\)\+\*.*$/       contains=todoUnderline
    syn match todoCanceled      /^\(\s\|\)\+-.*$/        contains=todoUnderline
    syn match todoQuestion      /^\(\s\|\)\+?.*$/        contains=todoUnderline
    syn match todoImportant     /^\(\s\|\)\+!.*$/        contains=todoUnderline

" Create keywords

"   syn keyword todoCommentTodo TODO

" Regions
    
    syn region todoUnderline start='_' end='_' keepend
    syn region todoExample start='^\(\s\+\)\?Example:' end='^\(\s\+\)\?End\(Ex\|\(\s\+\)\?Example\)' keepend

" Create color context.  (:help group-name to see legend)

    highlight link todoTitle        Statement
    highlight link todoTodo         Type
    highlight link todoDone         Constant
    highlight link todoWait         PreProc
    highlight link todoInformation  Identifier
    highlight link todoCanceled     Error
    highlight link todoQuestion     Special
    highlight link todoImportant    Special
"   highlight link todoCommentTodo  Todo
    highlight link todoUnderline    Underlined
    highlight link todoExample      Normal


let b:current_syntax = "todo"
