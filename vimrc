" Moj .vimrc

set t_Co=256

" <Space> is the leader character
let mapleader = " "

set encoding=utf-8

" let me switch between modified buffers freely
set hidden

" use Vim default settings, not Vi's
set nocompatible

" wrap words, no new lines
set formatoptions=l
set lbr

filetype plugin indent on " Enable filetype-specific indenting and plugins

set autoindent smartindent

set number

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  autocmd BufRead *.cc,*.hh set ai sw=4 sts=4 et
  autocmd FileType ruby,eruby,yaml,cucumber,javascript,html,css,coffee set ai sw=2 sts=2 et
  autocmd BufRead,BufNewFile *.html.erb set ft=html.eruby
augroup END

" * User Interface

au GUIEnter * set lines=40 columns=164

" font
set guifont=*
set guifont=DejaVu\ Sans\ Mono\ 9

" have syntax highlighting in terminals which can display colours:
if has('syntax') && (&t_Co > 2)
  syntax on
endif

" pick a color scheme
if has("gui_running")
  colorscheme desertedoceanburnt
else
  colorscheme mrpink
endif

" have command-line completion <Tab> (for filenames, help topics, option names)
" first list the available options and complete the longest common part, then
" have further <Tab>s cycle through the possibilities:
set wildmode=list:longest,full

" use "[RO]" for "[readonly]" to save space in the message line:
set shortmess+=r

" display the current mode and partially-typed commands in the status line:
set showmode
set showcmd

" * Text Formatting -- General

" normally don't automatically format `text' as it is typed, IE only do this
" with comments, at 78 characters:
set formatoptions-=t
set textwidth=78

" * Text Formatting -- Specific File Formats

" enable filetype detection:
filetype on

"Set to auto read when a file is changed from the outside
set autoread

" * Search & Replace

" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase

" show the `best match so far' as search strings are typed:
set incsearch

" assume the /g flag on :s substitutions to replace all matches in a line:
set gdefault

"""""""""""""""""""""

" Use Alt-right/left to navigate through buffers
map <Leader><Right> <ESC>:bn<CR>
map <Leader><Left> <ESC>:bp<CR>

" prevent indentation madness when pasting in vim running inside terminal
" do this before and after pasting
set pastetoggle=<F2>

" QuickBuf shortcut
let g:qb_hotkey = "<Leader><Backspace>"
