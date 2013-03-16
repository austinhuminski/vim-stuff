call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

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
highlight SpellBad term=underline gui=undercurl guisp=Blue

let g:pathogen_disabled = ['pyflakes']

"let g:flake8_builtins="_,apply"

"Inset new line without entering isert mode
map <S-Enter> O<Esc>
map <CR> o<Esc>

set cc=81
hi ColorColumn ctermbg=lightblue guibg=lightblue
