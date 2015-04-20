" Vim syntax file
" Language:     MiaRec Trace file
" Maintainer: MiaRec, Inc.
"

if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "miarec_trace"

" syn keyword logError ERROR
syn region logError start=+.*\cERROR+ end=+$+
syn region logFailed start=+.*\cFAILED+ end=+$+
syn region logCouldNot start=+.*\cCOULD NOT+ end=+$+

" This creates a match on the date and puts in the highlight group called logDate.  The
" nextgroup and skipwhite makes vim look for logTime after the match
syn match logDate /^\d\{4}\/\d\{2}\/\d\{2}/ nextgroup=logTime skipwhite

" This creates a match on the time (but only if it follows the date)
syn match logTime /\d\{2}:\d\{2}:\d\{2}\.\d\{3}/


syn region logCall start=+[a-zA-Z]*Call\[+ end=+\]+
syn region logRtpStream start=+RtpStream\[+ end=+\]+


hi link logError Error
hi link logFailed Error
hi link logCouldNot Error
" hi def logDate guibg=yellow guifg=blue
" hi def logTime guibg=green guifg=white
hi link logDate Comment
hi link logTime Comment

hi link logCall Function
hi link logRtpStream Function
