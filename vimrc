set nocompatible " use Vim's default settings, not Vi's
filetype off     " required by vundle

" # Plugins, managed by vundle
"
" https://github.com/gmarik/vundle
"
" installation:
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"
" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install(update) bundles
" :PluginSearch(!) foo - search(or refresh cache first) for foo
" :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'

Plugin 'vim-scripts/QuickBuf'
let g:qb_hotkey = ",," " QuickBuf shortcut
Plugin 'vim-scripts/BufOnly.vim'

Bundle "kien/ctrlp.vim"
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

Plugin 'tpope/vim-rails.git'
Plugin 'renderedtext/vim-bdd'
Plugin 'kchmck/vim-coffee-script'
Plugin 'othree/html5.vim'

Plugin 'markoa/snipmate.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'trevordmiller/nova-vim'

Plugin 'sickill/vim-pasta'

Plugin 'markoa/vim-statline'

Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimfiler.vim'

call vundle#end()
filetype plugin indent on " required for vundle

"set background=dark
colorscheme nova

" # General

set encoding=utf-8

set clipboard+=unnamed " yanks go to clipboard
set pastetoggle=<F2>   " toggle paste mode for sane pasting inside the terminal

set hidden " let me switch between modified buffers freely

set autoread " when a file is changed from the outside

" # Key mappings

let mapleader = " " " set <Space> as <Leader>

" Use Alt-right/left to navigate through buffers
map <Leader><Right> <ESC>:bn<CR>
map <Leader><Left> <ESC>:bp<CR>

" # Custom commands

:command Lighten set background=light
:command Darken set background=dark

" # Formatting

set formatoptions=l  " do not break long lines in insert mode
set formatoptions-=t " do not auto-wrap text using textwidth
set lbr              " wrap text for display only
set textwidth=78

syntax on

set tabstop=2    " set the default tabstop
set softtabstop=2
set shiftwidth=2 " set the default shift width for indents
set expandtab    " make tabs into spaces (set by tabstop)
set smarttab     " smarter tab levels

" Remind me what makes a nice Git commit.
autocmd Filetype gitcommit setlocal spell textwidth=72

" Also for plain text files.
autocmd BufRead,BufNewFile *.md setlocal spell wrap wrapmargin=2 textwidth=80

set autoindent

set wildmode=list:longest,full " cmd line: list and complete longer matches 1st

" # Search & Replace

set ignorecase " make searches case-insensitive
set smartcase  " unless they contain upper-case letters

set incsearch " show the `best match so far' as search strings are typed

set gdefault " assume the /g flag on :s substitutions to replace all matches

" # Visual

set t_Co=256
set number

set shortmess+=r " "[RO]" instead of "[readonly]" in the message line

set showmode " display the current mode
set showcmd  " display partially-typed commands in the status line

" # File type detection
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
