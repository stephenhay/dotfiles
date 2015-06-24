" I don't remember where I learned about a lot of these settings.
" Some I just figured out by reading :help. Several can be attributed to
" Derek Wyatt and Steve Losh.

" Vimscript file settings {{{
augroup filetype_vim
  au!
  au FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Pathogen {{{
set sessionoptions-=options
execute pathogen#infect()
call pathogen#helptags() " generate helptags for everything in 'runtimepath'
"}}}

" Basic settings {{{
set nobackup
set noswapfile
filetype plugin indent on
syntax on

set nocompatible
set encoding=utf-8
set nobomb
set wrap linebreak textwidth=0
set showbreak=>>>\ 
set display=lastline
set foldcolumn=2
"set foldmethod=marker
set relativenumber
"set transparency=2
set clipboard=unnamed

set ts=4
set sts=4
set sw=4
set expandtab
set title

" let g:neocomplete#enable_at_startup = 1
" }}}

" Filetype/syntax {{{
augroup filetype_syntaxes
  au BufRead,BufNewFile *.adoc,*.asciidoc set ft=asciidoc
  au BufRead,BufNewFile *.md set ft=markdown
  au BufRead,BufNewFile *.scss set ft=css
  " for Krijn Hoetmer
  " au FileType html setlocal ts=1 sw=1 sts=1 expandtab
  au FileType php setlocal ts=2 sw=2 sts=2 expandtab
  au FileType css setlocal ts=4 sw=4 sts=4 expandtab
augroup END
" }}}

let g:UltiSnipsSnippetsDir=['snippets']

" Syntastic
let g:syntastic_scss_checkers=['sass']
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_php_checkers=['php']
let $JS_CMD='node'

if has("autocmd")
  let pandoc_pipeline  = "pandoc --from=html --to=markdown"
  let pandoc_pipeline .= " | pandoc --from=markdown --to=html"
  autocmd FileType html let &formatprg=pandoc_pipeline
    au BufReadPost *.rkt,*.rktl set filetype=scheme
endif

" Mappings {{{
let mapleader = ","
let g:mapleader = ","
nnoremap <leader>0 :set ft=mail<cr>
nnoremap <leader>1 :set syntax=xhtml<cr>
nnoremap <leader>2 :set syntax=css<cr>
nnoremap <leader>3 :set syntax=php<cr>
nnoremap <leader>4 :set ft=javascript<cr>

" Move line down
nnoremap - ddp

" Move line up
nnoremap _ ddkP

" close xml/html tags
inoremap <leader>/ </<C-X><C-O>

" open netrw to directory of current file
noremap <leader>- :Vex<cr>
" }}}

" Make GUI File Open use current directory
set browsedir=buffer                 

" Invisible Characters {{{
" Shortcut to rapidly toggle `set list`
nnoremap <leader>i :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
" }}}

"automatically make and load views
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview

let Grep_Skip_Dirs = '.svn'

" File Explorer {{{
"Split vertically
let g:explVertical=1

"Window size
let g:explWinSize=40

let g:explSplitLeft=1
let g:explSplitBelow=1

"Hide some files
let g:explHideFiles='^\.,.*\.class$,.*\.swp$,.*\.pyc$,.*\.swo$,\.DS_Store$'

"Hide the help thing..
let g:explDetailedHelp=0
" }}}

" Omni completion {{{
augroup omnicompletion
  au!
  autocmd FileType python set omnifunc=pythoncomplete#Complete
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
  autocmd FileType php set omnifunc=phpcomplete#CompletePHP
augroup END

set completeopt+=longest

"simpler omnicompletion combo
inoremap <c-space> <c-x><c-o>
" }}}

set grepprg=grep\ -nH\ $*

" Make command line two lines high
set ch=2

" Make the 'cw' and like commands put a $ at the end instead of just deleting
" the text and replacing it
"set cpoptions=ces$

" Search {{{
set hlsearch
set incsearch
set ignorecase
set smartcase
hi Search guibg=LightBlue guifg=DarkBlue
" }}}

" Status line {{{
set statusline=%F%m%r%h%w%{fugitive#statusline()}\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2
" }}}

" set visual bell 
set vb

" Don't update the display while executing macros
set lazyredraw

" Show the current command in the lower right corner
set showcmd

" Show the current mode
set showmode

" Hide the mouse pointer while typing
set mousehide

" GUI cursor (via Derek Wyatt) {{{
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
" }}}

" set gui options
set guioptions=em

" Allow buffers to be hidden
set hidden

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" Allow the cursor to go in to "invalid" places
set virtualedit=all

" Make the command-line completion better
set wildmenu

" get rid of the silly characters in window separators
set fillchars=""

" Add ignorance of whitespace to diff
set diffopt+=iwhite

"spelling config
set spelllang=en_us,nl
set spellsuggest=9

" Window and colors {{{
set t_Co=256
set background=dark
colorscheme gruvbox
if has("gui_running")
  set antialias linespace=2 guifont="DejaVu Sans Mono":h14
  colorscheme gruvbox
  if !exists("g:vimrcloaded")
    winpos 0 0
    if ! &diff
      winsize 130 90
    else
      winsize 227 90
    endif
    let g:vimrcloaded = 1
  endif
endif
" }}}

" Color adjustments for spelling {{{
hi clear SpellBad
hi SpellBad guibg=Red guifg=White
hi clear SpellCap
hi SpellCap guibg=Red guifg=White
hi clear SpellRare
hi SpellRare guibg=Red guifg=White
hi clear SpellLocal
hi SpellLocal guibg=Red guifg=White
" }}}

" navigate buffers with ctrl-arrow {{{
noremap <C-right> <ESC>:bn<CR> 
noremap <C-left> <ESC>:bp<CR>
noremap <S-right> <ESC>:tabn<CR>
noremap <S-left> <ESC>:tabp<CR>
" }}}

" Calculate sum of numbers in column {{{
function! CalculateSum(column) range
  let total = 0
  let i = 0
  for i in range(a:firstline, a:lastline)
    let j = 0
    let line = getline(i)
    while j < a:column
      let line = substitute(getline(i),"^[^\t]*\t","", "")
      let j += 1
    endwhile
    let total += line
  endfor
  echo total
  return total
endfunction
" }}}

" TwitVim config {{{
let twitvim_force_ssl = 1
let twitvim_login = "$TWITTERUSER:$TWITTERPASS"
let twitvim_browser_cmd = 'google-chrome'
" }}}

"Invisible character colors 
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

"Highlight current line and mark it
nnoremap <silent> <Leader>m ml:execute 'match Search /\%'.line('.').'l/'<CR>

" {{{ Windows
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" }}}

"encryption
set cm=blowfish

" Edit and source vimrc
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

" Abbreviations
iabbrev @@  stephen@zerointerface.nl

" Save and run Dexy
function! DexySave()
  !dexy
endfunction
:nnoremap <leader>dw :w<cr>:call DexySave()<cr>

" Thanks to Drew Neil
vnoremap . :norm.<CR>

" Have line completion refine as I type
inoremap <C-x><C-l> <C-x><C-l><C-n>

" Remove right scrollbar
set guioptions-=r

" ctags
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

" Meta viewport
iabbr metavw <meta name="viewport" content="width=device-width,initial-scale=1">

" Treat all numbers as decimal
set nrformats=
