let coffee_watch_vert = 1
let coffee_compile_vert = 1
let coffee_run_vert = 1

" autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

augroup CoffeeBufNew
    autocmd User * set wrap
augroup END

au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
