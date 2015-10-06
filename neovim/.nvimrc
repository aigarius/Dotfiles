scriptencoding=utf-8

" Required.
filetype off

" Loads vim-plug.
call g:plug#begin('~/.vim/plugged')

" Optional plugins.
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'DavidEGx/ctrlp-smarttabs'
Plug 'Raimondi/delimitMate'
Plug 'Z1MM32M4N/vim-superman'
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'guns/vim-clojure-static'
Plug 'haya14busa/incsearch.vim'
Plug 'honza/vim-snippets'
Plug 'hynek/vim-python-pep8-indent'
Plug 'justinmk/vim-sneak'
Plug 'kchmck/vim-coffee-script'
Plug 'lilydjwg/colorizer'
Plug 'luochen1990/rainbow'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'mxw/vim-jsx'
Plug 'nelstrom/vim-visual-star-search'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdtree'
Plug 'sjl/gundo.vim'
Plug 'suan/vim-instant-markdown'
Plug 'tacahiroy/ctrlp-funky'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-leiningen'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'ujihisa/neco-look'
Plug 'vim-scripts/SQLUtilities'
Plug 'vim-scripts/gitignore'
Plug 'wellle/targets.vim'
Plug 'ervandew/supertab'
Plug 'benekastah/neomake'
Plug 'mhinz/vim-grepper'

" Required by vim-plug.
call plug#end()

" Sets how indentation works.
func! ResetIndentation()
    setlocal et
    setlocal ts=4
    setlocal sw=4
    setlocal sts=4
endfunc

syntax on

call ResetIndentation()

" Disables folds.
set nofoldenable

" Disables swap-files.
set noswapfile

" Show some special chars, well, specially.
set list
set listchars=tab:→\ ,trail:·,nbsp:·

" Shown at the start of wrapped lines.
let &showbreak = '↳ '

" Enables 'g' flag for search by default.
set gdefault

" Ignore case when searching unless you type uppercase and lowercase letters.
set ignorecase
set smartcase

" Highlights line where cursor is.
set cursorline

" Highlights search.
set hlsearch

" Highlights next found match.
func! HighlightNext(blinktime)
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'), col - 1), @/))
    let target_pat = '\c\%#'.@/
    let ring = matchadd('HighlightNext', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 400) . 'm'
    call matchdelete(ring)
    redraw
endfunc
nmap <silent> n n:call HighlightNext(0.2)<CR>
nmap <silent> N N:call HighlightNext(0.2)<CR>

" Set line-numbers to start from 0 based on current position.
set relativenumber

set colorcolumn=100

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=20

" Don't update the display while executing macros.
set lazyredraw

set wildmode=longest,full

" Startup message is irritating.
set shortmess+=I

" The completion menu will show only when there is more than one match.
set completeopt=menuone

" Enables Vim built-in completion.
set omnifunc=syntaxcomplete#Complete

" Map leader to <Space>.
let mapleader = "\<Space>"

" Go to next/prev tab.
nmap - gT
nmap = gt

" Move tabs. Idiomatic <S-{-,=}>.
nmap _ :tabm -1<CR>
nmap + :tabm +1<CR>

" Maps <M-1> to go to the first tab and so until <M-9>.
let i = 1
while i < 10
    execute 'nmap <M-' . i . '> :tabnext ' . i . '<CR>'
    execute 'nmap <Leader>' . i . ' :tabnext ' . i . '<CR>'
    let i += 1
endwhile

" Allows to switch back to tab you were before.
let g:last_tab = 1
nmap <Space><Space> :execute "tabn " . g:last_tab<CR>
au TabLeave * let g:last_tab = tabpagenr()

" Mappings for controlling splits.
nmap <M-h> <C-w>h
nmap <M-j> <C-w>j
nmap <M-k> <C-w>k
nmap <M-l> <C-w>l

" Maps Y to yank line from current position til the end.
nmap Y y$

" Wrap-friendly <j> and <k> keys.
nmap j gj
nmap k gk

nmap <M-q> :q!<CR>

nmap H ^
vmap H ^
nmap L $
vmap L $

nmap * g*<C-o>
nmap # g#<C-o>

" Default Q is very annoying. Maps it to something useful.
nmap Q @q

" TODO: What should I do know?
nmap <C-q> <Nop>

" Reselect text when indenting.
vmap < <gv
vmap > >gv

" Indent all the things!
nmap + gg=G2<C-o>

" Copy/pasting from/to system clipboard.
vmap <C-c> "+y
nmap <C-v> "*p
imap <C-v> <C-o>"*P
cmap <C-v> <C-r>+
cmap <S-Insert> <C-r>+

" Type 123<CR> to go to 123rd line.
nnoremap <CR> G
nnoremap <BS> gg

" Auto-closes that window when using q: instead of :q for mistake.
map q: :q

" Jump to next/previous class.
nmap <Home> [[
nmap <End> ]]

" Jump to next/previous function.
nmap <PageUp> [m
nmap <PageDown> ]m

" Always go to exact position of the mark.
nmap ' `

" Quick access to yank register.
nmap "" "0

"
" Commands.
"

command! -nargs=* ResetIndentation call ResetIndentation()

"
" Auto-commands.
"

" Enables Vim built-in completion.
au FileType css,sass,scss setlocal omnifunc=csscomplete#CompleteCSS
au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
au FileType javascript,javascript.jsx,coffee setlocal omnifunc=javascriptcomplete#CompleteJS
au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

au filetype python setlocal makeprg=python\ %
au filetype clojure setlocal makeprg=lein\ exec\ %

" Languages in which completion that includes `-` symbol makes sense.
au filetype html,htmldjango,css,scss,sass,javascript,coffee,sh,gitcommit setlocal iskeyword+=-

au filetype man setlocal nowrap

func! AuFtMarkdown()
    setlocal spell
    setlocal cc=80
    setlocal tw=80
endfunc
au filetype markdown call AuFtMarkdown()

func! AuFtVim()
    setlocal cc=78
    setlocal tw=78
endfunc
au filetype vim call AuFtVim()

func! AuFtPo()
    setlocal commentstring=#~\ %s
    setlocal cc=80
endfunc
au filetype po call AuFtPo()

func! AuFtSql()
    setlocal commentstring=--\ %s
endfunc
au filetype sql call AuFtSql()

func! AuFtGitCommit()
    setlocal colorcolumn=50
    setlocal spell
endfunc
au filetype gitcommit call AuFtGitCommit()

func! AuFtQuickFix()
    setlocal nowrap

    " Fixes <CR> not working in Ack.vim quickfix-list
    " when <CR> is mapped globally.
    " nmap <buffer> <CR> o
endfunc
au filetype qf call AuFtQuickFix()

func! AuFtHtmlDjango()
    set ft=html
endfunc
au filetype htmldjango call AuFtHtmlDjango()

func! ShouldDisableBlingBling()
    let ext = expand('%:e')

    let should = 0
    if (ext == "css" || ext == "js") && getfsize(expand("%")) > 20 * 1024
        let should = 1
    endif

    return should
endfunc

func! AuBufReadPre()
    if ShouldDisableBlingBling()
        setlocal nowrap
        setlocal nohlsearch
    endif
endfunc
au BufReadPre * call AuBufReadPre()

func! AuBufReadPost()
    " Restore last cursor position.
    if &ft != "gitcommit" && line("'\"") > 1 && line("'\"") <= line("$")
        exe "normal! g'\""
    endif
endfunc
au BufReadPost * call AuBufReadPost()

func! PatchColors()
    hi HighlightNext guibg=#F2777A

    if g:colors_name == "slate"
        hi def link HighlightNext WarningMsg
    endif

    if g:colors_name == "base16-eighties"
        set background=dark

        " let g:airline_theme = "base16"

        hi Comment guifg=#A09F93
        hi StatusLine guifg=#F2F0EC guibg=#515151
        hi Wildmenu guifg=#2D2D2D guibg=#6699CC

        hi Cursor guibg=#6699CC
        " " 8
        " hi CursorLine ctermbg=9

        " Completion menu.
        hi Pmenu guifg=#F2F0EC guibg=#515151
        hi PmenuSel guifg=#2D2D2D guibg=#6699CC
        " Blends out right sidebar.
        hi PmenuThumb guibg=#2D2D2D
        hi PmenuSbar guibg=#2D2D2D

        hi HighlightNext guibg=#F2777A

        hi SneakPluginTarget guifg=black guibg=#A09F93 ctermfg=black ctermbg=white

        hi SyntasticErrorSign guibg=#F2777A guifg=#393939
        hi SyntasticStyleErrorSign guibg=#FFCC66 guifg=#2D2D2D

        hi GitGutterAdd guifg=#99CC99
        hi GitGutterChange guifg=#FFCC66
        hi GitGutterDelete guifg=#F2777A
        hi GitGutterChangeDelete guifg=#F99157
    endif

    if g:colors_name == "flatlandia"
        hi HighlightNext guibg=#aa2915
        hi Comment guifg=#798188
        hi SignColumn guibg=#3b3e40
        hi SneakPluginTarget guifg=black guibg=#aa2915 ctermfg=black ctermbg=red
    endif
endfunc

func! AuColorScheme()
    call PatchColors()
endfunc
au ColorScheme * call AuColorScheme()

func! AuVimEnter()
    set t_Co=256
    set t_AB=^[[48;5;%dm
    set t_AF=^[[38;5;%dm
    let base16colorspace=256
    colorscheme base16-eighties

    call PatchColors()
endfunc
au VimEnter * call AuVimEnter()

func! AuFocusLost()
    exe ":silent! wall"
endfunc
au FocusLost * call AuFocusLost()

func! AuBufLeave()
    exe ":silent! update"
endfunc
au BufLeave * call AuBufLeave()

"
" Leader mappings (leaders).
" They are sorted alphabetically.
"

" Go to start buffer (Startify).
nmap <Leader><Backspace> :Startify<CR>

" Edit history.
nmap <Leader><Tab> :GundoToggle<CR>

" Find in files (alternative grep).
nmap <Leader>a :Ack<Space>

" Blaming is always fun and it's useful for teaching. Be polite tho!
nmap <Leader>b :Gblame<CR>

" Colorize strings that are colors! Disabled by default because it's slow.
nmap <Leader>c :ColorToggle<CR>

" Search for diff markers.
nmap <Leader>d /\v[<>=]{3,}<CR>

" Open file.
nmap <Leader>e :e<Space>

" Reload file.
nmap <Leader>ee :e!<CR>

" Shortcut for setting filetype.
nmap <Leader>f :set ft=

" Restructures text so it doesn't go over `textwidth`.
nmap <Leader>gq mtggvGgq`t

" Don't underestimate Vim help -- it is top notch!
nmap <Leader>h :help<Space>

" Replace word or selected text in current buffer.
nmap <Leader>k yiw:%s/<C-r>0/
vmap <Leader>k y:%s/<C-r>0/

nmap <Leader>m :make<CR>

" Shows registers.
nmap <Leader>r :registers<CR>

" Count occurrences of a pattern in current buffer.
nmap <Leader>n :%s///gn<Left><Left><Left><Left>

nmap <Leader>p :CtrlPSmartTabs<CR>

" Anonymous gists.
nmap <Leader>pg :Gist -a<CR>
vmap <Leader>pg <ESC>:'<,'>Gist -a<CR>

" Save and close buffer.
nmap <Leader>q :wq!<CR>

" Sort everything or selected text in current buffer.
nmap <Leader>s :sort<CR>
vmap <Leader>s :sort<CR>

nmap <Leader>t :tabe<Space>

" Start selecting in visual-block mode.
nmap <Leader>v v<C-v>

nmap <Leader>w :w<CR>

" Sources what you have selected as Vimscript.
vmap <Leader>x y:@"<CR>

" Correct word under the cursor.
map <Leader>z :set spell<CR>z=

"
" Airline configuration.
"

" " Fine-tune tabline.
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#show_buffers = 0
" let g:airline#extensions#tabline#show_tabs = 1
" let g:airline#extensions#tabline#tab_nr_type = 1
" let g:airline#extensions#tabline#formatter = "unique_tail_improved"
" let g:airline#extensions#tabline#show_close_button = 0

"
" Ack configuration.
"

nmap // :'<C-r>/'<C-a><Right><Right><Right><Backspace><Backspace><C-a>Ack<Space><Left>

"
" Syntastic configuration.
"

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

" Linters for Python files.
let g:syntastic_python_checkers = ['python', 'frosted']
let g:syntastic_python_python_exec = 'python2'

" Linters for CoffeeScript files.
let g:syntastic_coffee_checkers = ['coffee', 'coffeelint']
let g:syntastic_coffee_coffeelint_post_args = '--file ~/coffeelint.json'

"
" NERDTree configuration.
"

" Opens NERDTree with <Tab>.
nmap <Tab> :NERDTreeToggle<CR>

" Makes NERDTree more wider.
let NERDTreeWinSize = 50

" Makes NERDTree show hidden files as well.
let NERDTreeShowHidden = 1

"
" Gist configuration.
"

"
" CtrlP configuration.
"

" Use Git to get files. Much faster and it respects .gitignore rules.
let g:ctrlp_user_command = [
            \ '.git/',
            \ 'git --git-dir=%s/.git ls-files -oc --exclude-standard'
            \ ]

" Searches in files, buffers and MRU files at the same time.
let g:ctrlp_cmd = 'CtrlPMixed'

" Don't reload CtrlP cache when opening file outside project.
let g:ctrlp_working_path_mode = 'r'

let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:40'

let g:ctrlp_prompt_mappings = {
            \ "PrtClearCache()": ["<C-r>"],
            \ }

let g:ctrlp_reuse_window  = 'startify'

"
" CtrlPFunky configuration.
"

let g:ctrlp_funky_syntax_highlight = 1

nmap <Backspace> :CtrlPFunky<CR>

"
" CtrlPSmartTabs configuration.
"

let g:ctrlp_smarttabs_modify_tabline = 0

"
" Incsearch configuration.
"

nmap / <Plug>(incsearch-forward)\v
nmap ? <Plug>(incsearch-backward)\v

"
" Expand-region configuration.
"

vmap v <Plug>(expand_region_expand)
vmap <S-v> <Plug>(expand_region_shrink)

"
" Sneak configuration.
"

let g:sneak#prompt = ''

nmap <Enter> <Plug>Sneak_s
nmap <S-Enter> <Plug>Sneak_S

" Replaces `f` with 1-char Sneak.
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
" Replaces `t` with 1-char Sneak.
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T

"
" Rainbow configuration.
"

let g:rainbow_active = 1

"
" Instant Markdown configuration.
"

" Actually don't be instant.
let g:instant_markdown_slow = 1

" Autostart is too of a surprise.
let g:instant_markdown_autostart = 0

" It just makes sense to open preview like this.
func! AuFtMarkdownInstantMarkdown()
    nmap <buffer> <Space>m :InstantMarkdownPreview<CR>
endfunc
au filetype markdown call AuFtMarkdownInstantMarkdown()

"
" Colorized configuration.
"

let g:colorizer_startup = 0

"
" GitGutter configuration.
"

" It should never lag.
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

"
" Startify configuration.
"

let g:startify_files_number = 25

"
" Neomake configuration.
"

let g:neomake_error_sign = {
    \ 'text': 'E>',
    \ 'texthl': 'ErrorMsg',
    \ }

let g:neomake_warning_sign = {
    \ 'text': 'W>',
    \ 'texthl': 'WarningMsg',
    \ }

au BufReadPost,BufWritePost * Neomake

" TODO: Mappings ]q and [q do not work.

"
" Grepper configuration.
"

let g:grepper = {
    \ 'tools': ['ack'],
    \ 'open': 1,
    \ 'switch': 1,
    \ 'jump': 1,
    \ }

command! -nargs=* -complete=file Ack Grepper! -query <args>

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" TODO: Opening files from quicfix list.


let g:base16colorspace=256