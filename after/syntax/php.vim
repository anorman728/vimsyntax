" Highlight unwanted whitespace.  (May want to refactor into a toggle function later-- ATM, not needed.)
syn match unwantedWhitespace /\(\s\|\s\+\)$/ containedin=ALL
hi unwantedWhitespace ctermbg=Black

" Highlight a line in blue by adding //;; to the end of it.
syn match highlightedLine /^.*\/\/;;$/ containedin=ALL
hi highlightedLine ctermbg=Blue

" Workaround-- Don't know why, but Vim has been changing the colors of variables to light blue in PHP.
hi phpIdentifier ctermfg=Brown
