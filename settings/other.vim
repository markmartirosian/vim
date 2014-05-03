let vimsyn_noerror = 1
au BufEnter * :syntax sync fromstart
au BufWinLeave * call clearmatches()
au BufWritePre * :%s/\s\+$//e
au SwapExists * let v:swapchoice = 'e'

