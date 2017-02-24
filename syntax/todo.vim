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

" Specially-colored regions

    " Will probably update this as-needed.
    
    " Can't get this to work.  Commenting out for now.

"   " PHP
"       syntax include @Php syntax/php.vim
"       syntax region phpRegion matchgroup=Delimiter start="\[php\]" end="\[/php\]" contains=@php keepend
"
"   " SQL
"       syntax include @Sql syntax/sql.vim
"       syntax region sqlRegion matchgroup=Delimiter start="\[sql\]" end="\[/sql\]" contains=@Sql keepend
"   
"   " JS
"       syntax include @Javascript syntax/javascript.vim
"       syntax region myJavascript start="\[js\]" end="\[/js\]" keepend contains=@Javascript

" Regions
    
    syn match todoHideMe        /`/
    syn region todoUnderline start='`' end='`' keepend contains=todoHideMe
    syn region todoExample start='^\(\s\+\)\?\(Ex\|Example\):$' end='^\(\s\+\)\?End\(Ex\|\(\s\+\)\?Example\)' keepend

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
    highlight link todoHideMe       Ignore
    highlight link todoExample      Normal


let b:current_syntax = "todo"
