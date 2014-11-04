function CheckConsole()

    let l:isconsole = 0

    if exists('$ISCONSOLE')
        let l:isconsole = 1
    else
        let l:isconsole = 0
    endif

    if exists('$SSH_CLIENT')
        let l:isconsole = 0
    elseif exists('$SSH_TTY')
        let l:isconsole = 0
    endif

    if !empty(glob("/.dockerinit"))
        let l:isconsole = 0
    endif

    return l:isconsole
endfunction

if CheckConsole() == 1
    set bg=dark term=linux
    colo slate
    syntax on
else
    set mouse=nv
    colo solarized
    set bg=dark
    hi NonText ctermfg=magenta
    hi SpecialKey ctermfg=magenta
    " hi LineNr ctermbg=white ctermfg=69
    " hi CursorLineNr ctermbg=white ctermfg=7
    let g:airline_left_sep = '▙'
    " let g:airline_left_alt_sep = ''
    let g:airline_right_sep = '▟'
    " let g:airline_right_alt_sep = ''
    " let g:airline_fugitive_prefix = ' '
    " let g:airline_readonly_symbol = ''
    " let g:airline_linecolumn_prefix = '·'
    " let g:airline_powerline_fonts = 1
    let g:airline_theme='solarized'
    au BufEnter * :IndentGuidesEnable
    " au VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=187
    " au VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=7
endif

hi clear SignColumn
let g:bufferline_echo=0

au FileType help,qf setl nowrap nofen nospell nocul nolist
au FileType help,qf setl stl=\ %n\ \ %f%=%L\ lines
