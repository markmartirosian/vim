map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l map <c-h> <c-w>h
" nn ; :
cm WQ wq
cm wQ wq
cm Tabe tabe
cm w!! w !sudo tee % >/dev/null

noremap 0 ^
noremap ^ 0

nnoremap <expr> n (v:searchforward ? 'n' : 'N')
nnoremap <expr> N (v:searchforward ? 'N' : 'n')

nnoremap <Up> n
nnoremap <Down> N
