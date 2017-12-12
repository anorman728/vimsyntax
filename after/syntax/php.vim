" Highlight unwanted whitespace.  (May want to refactor into a toggle function later-- ATM, not needed.)
syn match unwantedWhitespace /\(\s\|\s\+\)$/ containedin=ALL
hi unwantedWhitespace ctermbg=Black
