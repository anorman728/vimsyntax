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
    syn match todoCanceled      /^\(\s\|\)\+-.*$/       contains=todoUnderline
    syn match todoQuestion      /^\(\s\|\)\+?.*$/       contains=todoUnderline
    syn match todoImportant     /^\(\s\|\)\+!.*$/       contains=todoUnderline

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

" Subregions, i.e., putting code examples into a todo file.
    " This function was yanked (with slight modification) from http://vim.wikia.com/wiki/Different_syntax_highlighting_within_regions_of_a_file
    function! TextEnableCodeSnip(filetype,start,end) abort
      let ft=toupper(a:filetype)
      let group='textGroup'.ft
      if exists('b:current_syntax')
        let s:current_syntax=b:current_syntax
        " Remove current syntax definition, as some syntax files (e.g. cpp.vim)
        " do nothing if b:current_syntax is defined.
        unlet b:current_syntax
      endif
      execute 'syntax include @'.group.' syntax/'.a:filetype.'.vim'
      try
        execute 'syntax include @'.group.' after/syntax/'.a:filetype.'.vim'
      catch
      endtry
      if exists('s:current_syntax')
        let b:current_syntax=s:current_syntax
      else
        unlet b:current_syntax
      endif
      execute 'syntax region textSnip'.ft.' matchgroup=SpecialComment start="'.a:start.'" end="'.a:end.'" contains=@'.group
    endfunction


    " Include sh
        call TextEnableCodeSnip('sh','@begin=sh@','@end=sh@')
    " Include PHP
         " Really weird thing to note:  If you don't close the ?>, it won't end the syntax.
        call TextEnableCodeSnip('php', '@begin=php@', '@end=php@')
    " Include JS
        call TextEnableCodeSnip('javascript', '@begin=js@', '@end=js@')

let b:current_syntax = "todo"
