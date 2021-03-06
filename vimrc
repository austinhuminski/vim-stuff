source ~/.vim/ftplugin/matchit.vim
syntax on

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Make the backspace button on MAC act as expected
set backspace=indent,eol,start

" I'm lazy and don't want to hit shift
nmap ; :
set cindent
set tabstop=4
set shiftwidth=4
set expandtab

"Sets the file name in the title menu of VIM Screen
let &titlestring = hostname() . "[vim(" . expand("%:t") . ")]"
if &term == "screen"
  set t_ts=k
  set t_fs=\
endif
if &term == "screen" || &term == "xterm"
  set title
endif

"Pyflakes settings
filetype on
filetype plugin on

"Catch whitespace
"highlight ExtraWhitespace ctermbg=red guibg=red
" The following alternative may be less obtrusive.
"highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
"Try the following if your GUI uses a dark background.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
"Show all trailing whitespace
match ExtraWhiteSpace /\s\+$/

"Run pyflakes shortcut
nmap <S-p> <F7>

set tags+=~/development/virtual_environments/clincard/bin

"Eliminate all white space on write
autocmd BufWritePre * :%s/\s\+$//e

"Change color of pyflakes error line background
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline guisp=Orange
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

"let g:flake8_builtins="_,apply"

"Inset new line without entering isert mode
map <S-Enter> O<Esc>
map <CR> o<Esc>

set cc=81
hi ColorColumn ctermbg=lightblue guibg=lightblue

syntax on

set incsearch
set hlsearch

"Use find to search recursivley
set path +=**

set ruler

set modeline
set ls=2

" Comment color
highlight Comment ctermfg=green

" Tern-vim
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'


let g:pymode_lint_on_fly = 0

filetype plugin on
set omnifunc=syntaxcomplete#Complete
=======
" Jumps to search word as you type
set incsearch

" source $MYVIMRC reloads the saved $MYVIMRC
nmap <Leader>s :source $MYVIMRC

" Abbreviations
ab date_ from datetime import date, timedelta
ab _b #!/usr/bin/env python
