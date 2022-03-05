" Highlight unwanted whitespace.  (May want to refactor into a toggle function later-- ATM, not needed.)
syn match unwantedWhitespace /\(\s\|\s\+\)$/ containedin=ALL
hi unwantedWhitespace ctermbg=Blue

" Highlight a line in blue by adding //;; to the end of it.
syn match highlightedLine /^.*\/\/;;$/ containedin=ALL
hi highlightedLine ctermbg=Blue

" Highlight debug code marker in red.
syn match debugCode /\/\/dmz\(\d\|\d\+\)$/ containedin=ALL
hi debugCode ctermbg=Red

