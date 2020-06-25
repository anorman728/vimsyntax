" Vim syntax file
" Language: Personal todo files
" Maintainer: Andrew Norman <anorman728@gmail.com>

if exists("b:current_syntax")
    finish
endif

" This isn't an actual language, so syntax case is irrelevant.

    syn case ignore

" Create regex matches for types of lines.

    syn match todoTitle         /^\(.*\|\):\(\s\|\)\+$/ contains=todoUnderline
    syn match todoTodo          /^\(\s\|\)\+>.*$/       contains=todoUnderline
    syn match todoDone          /^\(\s\|\)\++.*$/       contains=todoUnderline
    syn match todoWait          /^\(\s\|\)\+\.\.\..*$/  contains=todoUnderline
    syn match todoInformation   /^\(\s\|\)\+\*.*$/      contains=todoUnderline
    syn match todoInformation   /^\(\s\|\)\+\(\d\+\|\d\)\..*$/      contains=todoUnderline
    syn match todoCanceled      /^\(\s\|\)\+-.*$/       contains=todoUnderline
    syn match todoQuestion      /^\(\s\|\)\+?.*$/       contains=todoUnderline
    syn match todoImportant     /^\(\s\|\)\+!.*$/       contains=todoUnderline

" Create keywords

"   syn keyword todoCommentTodo TODO

" Regions
    
    " Commenting out all of below.  I never use them.
    "syn match todoHideMe        /`/
    "syn region todoUnderline start='`' end='`' keepend contains=todoHideMe
    "syn region todoExample start='^\(\s\+\)\?\(Ex\|Example\):$' end='^\(\s\+\)\?End\(Ex\|\(\s\+\)\?Example\)' keepend

" Create color context.  (:help group-name to see legend)

    highlight link todoTitle        Statement
    highlight link todoTodo         Type
    highlight link todoDone         Constant
    highlight link todoWait         PreProc
    highlight link todoInformation  Comment
    highlight link todoCanceled     Error
    highlight link todoQuestion     Special
    highlight link todoImportant    Special
"   highlight link todoCommentTodo  Todo
"    highlight link todoUnderline    Underlined
"    highlight link todoHideMe       Ignore
"    highlight link todoExample      Normal

" Subregions, i.e., putting code examples into a todo file.
    " This function was yanked (with slight modification) from
    " http://vim.wikia.com/wiki/Different_syntax_highlighting_within_regions_of_a_file
    " If strange behavior is noticed, it probably means that a syntax was called
    " that doesn't exist!  Haven't been able to fix this so far.
    function! TextEnableCodeSnip(filetype,start,end) abort
        let ft=toupper(a:filetype)
        let group='textGroup'.ft
        if exists('b:current_syntax')
            let s:current_syntax=b:current_syntax
            " Remove current syntax definition, as some syntax files (e.g. cpp.vim)
            " do nothing if b:current_syntax is defined.
            unlet b:current_syntax
        endif
        let fileName = 'syntax/'.a:filetype.'.vim'
        execute 'syntax include @'.group.' '.fileName
        execute 'syntax region textSnip'.ft.' matchgroup=SpecialComment start="'.a:start.'" end="'.a:end.'" contains=@'.group
    endfunction


    " Include sh
        call TextEnableCodeSnip('sh','@begin=sh@','@end=sh@')
    " Include PHP
         " Really weird thing to note:  If you don't close the ?>, it won't end the syntax.
        call TextEnableCodeSnip('php', '@begin=php@', '@end=php@')
    " Include JS
        call TextEnableCodeSnip('javascript', '@begin=js@', '@end=js@')
    " Include xml.
        call TextEnableCodeSnip('xml', '@begin=xml@', '@end=xml@')
    " Include JSON.
        call TextEnableCodeSnip('json', '@begin=json@', '@end=json@')
    " Include SQL
        call TextEnableCodeSnip('sql', '@begin=sql@', '@end=sql@')
    " Include CPP
        call TextEnableCodeSnip('cpp', '@begin=cpp@', '@end=cpp@')

    " Include Plaintext (different from others because there's no matching file.)
        syntax region todoPlaintext matchgroup=SpecialComment start="@begin=plain@" end="@end=plain@"
        highlight link todoPlaintext Normal

let b:current_syntax = "todo"
