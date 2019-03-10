" post installation hooks{{{
" function! BuildYCM(info)
"     if a:info.status == 'installed' || a:info.force
"         !./install.py
"     endif
" endfunction
" }}} thanks fntlnz

"Install vundle
let shouldInstallBundles = 0

if !filereadable($HOME . "/.vim/autoload/plug.vim")
	echo "~≥ Installing vim-plug \n"
	silent !curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	let shouldInstallBundles = 1
endif

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
" Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
" Plug 'SirVer/ultisnips'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'   " mark modified lines
Plug 'mattn/gist-vim'
Plug 'joonty/vdebug'
Plug 'mattn/webapi-vim'
Plug 'arnaud-lb/vim-php-namespace', { 'for': 'php' }
Plug 'wdalmut/vim-phpunit', { 'for': 'php' }
Plug 'StanAngeloff/php.vim', { 'for': 'php' }
Plug 'shawncplus/phpcomplete.vim', { 'for': 'php' }
Plug 'joonty/vim-phpqa'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'flazz/vim-colorschemes'
Plug 'jiangmiao/auto-pairs'
Plug 'davidhalter/jedi-vim'
Plug 'ervandew/supertab'
Plug 'mileszs/ack.vim'

call plug#end()

if shouldInstallBundles == 1
    echo "~> Installing plugs\n"
    :PlugInstall
endif

if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" Use local vimrc if available
if filereadable(expand("~/.vimrc.local"))
	source $HOME/.vimrc.local
endif

filetype plugin indent on
set number                               " enable line number
set rnu                                 " Relative line number
set secure                              " Enable secure mode
let mapleader = ","                     " Set the <Leader> for combo commands
set autoindent                          " Make sure that unrecognized files are still indented
set showcmd                             " Show (partial) commands (or size of selection in Visual mode) in the status
set showmatch                           " When a bracket is inserted, briefly jump to a matching one
syntax on
set enc=utf-8
set tabstop=4                           " Use 4 spaces for <Tab> and :retab
set expandtab                           " Expand tabs to spaces
set nowrap                              " do not wrap lines by default
set wildmenu                            " Use menu to show command-line completion (in 'full' case)
set incsearch                           " Enable incremental search
set hlsearch                            " Highlight results of a search
set ic                                  " Search ignore case
set smartcase                           " Ignore case only if seach string is all lowercase
set showtabline=2                       " Make sure that tabline is always present
set laststatus=2                        " Always show status line, even for one window
set matchtime=2                         " Jump to matching bracket for 2/10th of a second (works with showmatch)
set backupdir=/tmp
set directory=/tmp                      " Don't clutter my dirs up with swp and tmp files
set ruler                               " Show line, column number, and relative position within a file in the status
set scrolloff=10                       " Scroll when cursor gets within 10 characters of top/bottom edge
set shiftwidth=4                        " Use 4 spaces for (auto)indent
set background=light                     " Background options
set t_Co=256
colorscheme monokai-chris                   " Schema color
set exrc                                " Enable project specific .vimrc
"set spell                               " Enable spell check
set backspace=indent,eol,start

" custom key commands
map <Leader>n :<C-U>NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen = 1

"""""""
" PHP "
"""""""
let g:phpqa_codesniffer_args = "--standard=WordPress"
let g:phpqa_messdetector_autorun = 0
let g:phpqa_codesniffer_autorun = 0

""""""""
" misc "
""""""""
" dismiss highlighted search items on leader+space
nnoremap <leader><space> :noh<cr>
" f9 to turn on/off highlighting of the current line
nnoremap <silent><f9> :set cursorline!<cr>

""""""""""""""""""""""""
" plugin customization "
""""""""""""""""""""""""
" remap ctrl p to <leader> t
let g:ctrlp_map = '<leader>t'
" map `;´ to open ctrl p in buffermode
nnoremap ; :CtrlPBuffer<CR>
" align selected lines on '='
map <leader>9 :Tabularize/=<cr>

