"map s <Plug>(easymotion-prefix)

map f <Plug>(easymotion-s)
map t <Plug>(easymotion-t)
map T <Plug>(easymotion-T)
map w <Plug>(easymotion-w)
map W <Plug>(easymotion-W)
map b <Plug>(easymotion-b)
map B <Plug>(easymotion-B)
map e <Plug>(easymotion-e)
map E <Plug>(easymotion-e)
map ge <Plug>(easymotion-ge)
map gE <Plug>(easymotion-gE)

" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" Gif config
map l <Plug>(easymotion-lineforward)
map j <Plug>(easymotion-j)
map k <Plug>(easymotion-k)
map h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_upper = 1
let g:EasyMotion_use_smartsign_us = 1
