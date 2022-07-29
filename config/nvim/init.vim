set nocompatible              " be iMproved, required
set encoding=utf-8
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'bling/vim-airline'
Plugin 'Shougo/vimshell.vim'
Plugin 'mileszs/ack.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mhartington/oceanic-next'
Plugin 'sheerun/vim-polyglot'
Plugin 'joshdick/onedark.vim'
Plugin 'francoiscabrol/ranger.vim'
Plugin 'rbgrouleff/bclose.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'lambdalisue/suda.vim'
Plugin 'airblade/vim-gitgutter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

set nobackup		" do not keep a backup file, use versions instead
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r " | 0d_ | diffthis
		  \ | wincmd p | diffthis

endif

" display settings
set nowrap             
set scrolloff=2       
set number              
set showmatch          
set showmode          
set showcmd          
set ruler           
set title          
set wildmenu      
set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn
set laststatus=2       
set matchtime=2       
set matchpairs+=<:>  

" editor settings
set ignorecase         
set smartcase         
set smartindent      
set smarttab        
set magic          
set bs=indent,eol,start

set tabstop=4         
set shiftwidth=4     
set expandtab      

set fileformats=unix,dos    " only detect unix file format, displays that ^M with dos files

" system settings
set lazyredraw          " no redraws in macros
set confirm             " get a dialog when :q, :w, or :wq fails
set nobackup            " no backup~ files.
set viminfo='20,\"500   " remember copy registers after quitting in the .viminfo file -- 20 jump links, regs up to 500 lines'
set hidden              " remember undo after quitting
set history=50 

" color settings (if terminal/gui supports it)
if &t_Co > 2 || has("gui_running")
  syntax on          " enable colors
  set hlsearch       " highlight search (very useful!)
  set incsearch      " search incremently (search while typing)
endif

" paste mode toggle (needed when using autoindent/smartindent)
map <F10> :set paste<CR>
map <F11> :set nopaste<CR>
imap <F10> <C-O>:set paste<CR>
imap <F11> <nop>
set pastetoggle=<F11>

" Use of the filetype plugins, auto completion and indentation support
filetype plugin indent on

" file type specific settings
if has("autocmd")
  " For debugging
  "set verbose=9

  " if bash is sh.
  let bash_is_sh=1

  " change to directory of current file automatically
  autocmd BufEnter * lcd %:p:h

  " Put these in an autocmd group, so that we can delete them easily.
  augroup mysettings
    au FileType xslt,xml,css,html,xhtml,javascript,sh,config,c,cpp,docbook set smartindent shiftwidth=2 softtabstop=2 expandtab
    au FileType tex set wrap shiftwidth=2 softtabstop=2 expandtab

    " Confirm to PEP8
    au FileType python set tabstop=4 softtabstop=4 expandtab shiftwidth=4 cinwords=if,elif,else,for,while,try,except,finally,def,class
  augroup END

  augroup perl
    " reset (disable previous 'augroup perl' settings)
    au!  

    au BufReadPre,BufNewFile
    \ *.pl,*.pm
    \ set formatoptions=croq smartindent shiftwidth=2 softtabstop=2 cindent cinkeys='0{,0},!^F,o,O,e' " tags=./tags,tags,~/devel/tags,~/devel/C
    " formatoption:
    "   t - wrap text using textwidth
    "   c - wrap comments using textwidth (and auto insert comment leader)
    "   r - auto insert comment leader when pressing <return> in insert mode
    "   o - auto insert comment leader when pressing 'o' or 'O'.
    "   q - allow formatting of comments with "gq"
    "   a - auto formatting for paragraphs
    "   n - auto wrap numbered lists
    "   
  augroup END


  " Always jump to the last known cursor position. 
  " Don't do it when the position is invalid or when inside
  " an event handler (happens when dropping a file on gvim). 
  autocmd BufReadPost * 
    \ if line("'\"") > 0 && line("'\"") <= line("$") | 
    \   exe "normal g`\"" | 
    \ endif 

endif " has("autocmd")

set autowrite
au FocusLost * silent! w
set path=$PWD/**
set clipboard+=unnamedplus

set clipboard+=unnamedplus

let mapleader=" "
let NERDTreeMapOpenInTab='\r'
map <Leader>n <plug>NERDTreeTabsToggle<CR>
map <C-_> <Leader>cij
map <C-/> <Leader>cij
noremap <Leader>l :Autoformat<CR>
nnoremap <leader>r :RangerNewTab<CR>
nnoremap <leader><return> :w <bar> :!python %<CR>
nnoremap <Leader><F6> *Ncgn
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :wq<CR>
nnoremap <Leader>d :e .<CR>
nnoremap <Leader><Left> :bprevious<CR>
nnoremap <Leader><Right> :bnext<CR>
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
nmap <Leader>u <Plug>(GitGutterUndoHunk)
vmap <Leader>p "+p
vmap <Leader>P "+P
nmap <Leader><Leader> V
cmap w!! w !sudo tee > /dev/null %

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ackprg = 'ag --nogroup --nocolor --column'

let g:onedark_termcolors=256
let g:onedark_color_overrides = {
\ "black": {"gui": "#000000", "cterm": "255", "cterm16": "0" },
\ "purple": { "gui": "#C678DF", "cterm": "170", "cterm16": "5" }
\}
" Theme
syntax enable
colorscheme onedark


