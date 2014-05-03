scripte utf-8
set nocp
filetype off
if has('vim_starting')
    set rtp+=~/.vim/bundle/neobundle.vim/
    call neobundle#rc(expand('~/.vim/bundle/'))

    if filereadable(expand("~/.vim/vim-bundles"))
      source ~/.vim/vim-bundles
    endif
endif

NeoBundleFetch 'Shougo/neobundle.vim'


filetype plugin indent on
syntax enable

let mapleader=","
let maplocalleader="\\"

nn <C-H> <C-W>h
nn <C-J> <C-W>j
nn <C-K> <C-W>k
nn <C-L> <C-W>l
nn <SPACE> :bn<cr>
nn \ :bp<cr>
nn ; :
cm W w
cm WQ wq
cm wQ wq
cm Q q
cm Tabe tabe
cm w!! w !sudo tee % >/dev/null
im jj <Esc>

set fenc=utf8 enc=utf8 secure list so=5 shm=atI vb t_vb= novb noeb
set dir=~/.vim/tmp/sessions bdir=~/.vim/tmp/backup udir=~/.vim/tmp/undo
set nosol tf nonu ru sc sb spr nofen ve=onemore undofile backup
set gcr=a:blinkon0 ls=2 cot=longest,menuone cc=+1 hi=5000
set hls is ws ic scs so=3 sj=5 siso=7 ss=1 fo-=o sw=4 sts=4 et ai hid
set cpt+=kspell cpt-=t bs=indent,eol,start vi+=! vi='250,<0,r/tmp
set lcs=eol:¬,trail:· shm+=filmnrxoOtT ww=<,>,h,l noswf mat=2 ar
set ruf=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) wmnu wim=list:longest,full
set wig+=*/.git/*,*/.hg/*,*/.svn/*,*.aux,*.out,*.toc,*.jpg,*.bmp,*.gif
set wig+=*.luac,*.o,*.obj,*.exe,*.dll,*.manifest,*.spl,*.py[co] "sbr=↪
set clipboard=unnamedplus rnu nuw=10

colo solarized

let vimsyn_noerror = 1

"Mnemonics: motion
let g:EasyMotion_leader_key = '<Leader>m'

"Mnemonics: query
let g:ctrlp_map = '<leader>q'
let g:ctrlp_mru_files = 1
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 1
let g:ctrlp_custom_ignore = '\.pyc$\|\.git$\|\.hg$\|\.svn$'

"Mnemonics: tag
nn <leader>t :TagbarToggle<CR>
let g:tagbar_width = 25

"Mnemonics: yank
nn <leader>y :UndotreeToggle<CR>

"Mnemonics: fix
nn <leader>f :SyntasticToggleMode<CR>

"Mnemonics: undo
nn <leader>u :UndotreeToggle<CR>

if exists('$ISCONSOLE')
    set bg=dark term=linux
else
    set bg=light
    hi NonText ctermbg=white ctermfg=5
    hi SpecialKey ctermbg=white ctermfg=5
    hi LineNr ctermbg=white ctermfg=69
    hi CursorLineNr ctermbg=white ctermfg=7
    let g:airline_left_sep = '▙'
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = '▟'
    let g:airline_right_alt_sep = ''
    let g:airline_fugitive_prefix = ' '
    let g:airline_readonly_symbol = ''
    let g:airline_linecolumn_prefix = '·'
    let g:airline_powerline_fonts = 1
    let g:airline_theme='solarized'
endif

hi clear SignColumn
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_max_list = 10
let g:neocomplcache_auto_completion_start_length = 3
let g:neocomplcache_force_overwrite_completefunc = 1
let g:acp_enableAtStartup = 1
"let g:neocomplcache_enable_auto_select = 1
let g:pymode_lint_write = 0
let g:SuperTabCrMapping = 0
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]
let g:syntastic_auto_jump=0
let g:syntastic_auto_loc_list=0
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_enable_signs=0
let g:bufferline_echo=0

let g:indent_guides_auto_colors = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

aug cline
    au!
    au WinLeave * set nocursorline
    au WinEnter * set cursorline
    au InsertEnter * set nocursorline
    au InsertLeave * set cursorline
aug END

aug trailing
    au!
    au InsertEnter * :set listchars-=trail:·
    au InsertLeave * :set listchars+=trail:·
    au InsertEnter * :set listchars-=eol:¬
    au InsertLeave * :set listchars+=eol:¬
aug END

au BufEnter * :syntax sync fromstart
au BufEnter * :IndentGuidesEnable
au BufWinLeave * call clearmatches()
au BufWritePre * :%s/\s\+$//e
au SwapExists * let v:swapchoice = 'e'
au FileType * let b:delimitMate_autoclose = 1
au FileType xml,html,xhtml let b:delimitMate_matchpairs = "(:),[:],{:}"
au FileType python set omnifunc=pythoncomplete#Complete
au FileType help,qf setl nowrap nofen nospell nocul nolist
au FileType help,qf setl stl=\ %n\ \ %f%=%L\ lines
au VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=187
au VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=7
