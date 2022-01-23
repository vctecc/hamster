set number
set nocompatible
set clipboard=unnamedplus

" turn off swap
set nowritebackup
set noswapfile
set hidden  " Do not clean buffer

" GUI settings
if has("gui_running")
    set guioptions-=m
    set cursorline
    set columns=84
    set guifont=Monospace\ 14
endif

set expandtab
set backspace=2
set softtabstop=4
set shiftwidth=4

set autoindent
set smartindent

" show cursor all time
set ruler
set ttyfast

" smart search
set hlsearch
set incsearch
set smartcase
set ignorecase

" mouse support
set mouse=a
set mousemodel=popup

" turn off bepper
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

set wildmenu
set wcm=<Tab>
menu Encoding.utf-8 :e ++enc=utf8 <CR>
menu Encoding.koi8-r :e ++enc=koi8-r ++ff=unix<CR>
menu Encoding.windows-1251 :e ++enc=cp1251 ++ff=dos<CR>
menu Encoding.cp866 :e ++enc=cp866 ++ff=dos<CR>
menu Encoding.koi8-u :e ++enc=koi8-u ++ff=unix<CR>
map <F8> :emenu Encoding.<TAB>

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'arcticicestudio/nord-vim'
Plugin 'morhetz/gruvbox'
Plugin 'klen/python-mode'
Plugin 'vim-airline/vim-airline'        " nice status bar
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdcommenter'       " smart comments
Plugin 'davidhalter/jedi-vim'           " Python autocomplite
Plugin 'scrooloose/nerdtree'            " dir tree
Plugin 'tpope/vim-surround'             " smart bracket
Plugin 'bash-support.vim'
Plugin 'alvan/vim-closetag'
"Plugin 'airblade/vim-gitgutter'         " git helper
Plugin 'nvie/vim-flake8'
call vundle#end()

filetype on
filetype plugin indent on

"let python_highlight_all = 1

syntax on

:let g:ps1_nofold_blocks = 1
:let g:ps1_nofold_sig = 1

"autocmd BufRead,BufNewFile *.md setlocal spell
"autocmd BufRead,BufNewFile *.txt setlocal spell
"autocmd FileType gitcommit setlocal spell

colorscheme flattened_dark
let g:airline_theme='wombat'

" hotkeys
map <C-n> :NERDTreeToggle<CR>
:imap <F2> <C-^>

" blue cursor with Ru-ru
highlight lCursor guifg=NONE guibg=Cyan
highlight ExtraWhitespace ctermbg=red guibg=red

" show extra spaces
:match ExtraWhitespace /\s\+$/

" function to print first line (interpreter) for scripts
function! AutoPrintInterpreter(interp)
    let localvar = "#!/usr/bin/env " . a:interp
    :call setline(1, localvar)
    " :exe "normal! o#\<cr>\<esc>"
    return
endfunction

augroup newscripts
    autocmd!
    autocmd BufNewFile *.py :call  AutoPrintInterpreter("python3")
augroup END