" TODO
" fzf -> custom keybindings
" js
" jsx
" better eslint / prettier intigration
" send code to python repl
" terminal stuff
" multiple cursors
" editorconfig
"
" --- HOW TO USE STUFF --
" ## Buffers
" bd - delete buffer
" ls - list buffers
"
" ## FZF
" Files - find files
" GFiles - Git files
" GFiles - Git files /w status
" Colors - Color schemes
" Ag - ag search
" Lines - Lines in buffers
" BLines - Lines in curr buffer
" Commits - Git commits
" Commands

" Plug {{{
call plug#begin('~/.local/share/nvim/plugged')

function! DoRemote(arg)
    UpdateRemotePlugins
endfunction
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

Plug 'ervandew/supertab'
Plug 'zchee/deoplete-jedi'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" JS Plugins
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern', 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mattn/emmet-vim'

"Typescript Plugins
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Quramy/tsuquyomi', { 'do': 'npm install -g typescript' }
Plug 'mhartington/deoplete-typescript'
Plug 'prettier/vim-prettier', {
    \ 'do': 'npm install',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss'] }
"Plug 'Shougo/neosnippet.vim'
"Plug 'Shougo/neosnippet-snippets'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
Plug 'bling/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
"Plug 'scrooloose/syntastic' "replace with neomake
Plug 'neomake/neomake'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'   " mark modified lines
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'janko-m/vim-test'     " :TestNearest, :TestFile, :TestSuite, :TestLast
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'Yggdroot/indentLine'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-obsession'
Plug 'gorodinskiy/vim-coloresque'   " shows CSS colors
Plug 'ryanoasis/vim-devicons'
Plug 'terryma/vim-multiple-cursors'

" Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
"Plug 'SirVur/ultisnips'         " Test to remove
"Plug 'honza/vim-snippets'       " Snippets are separated from the engine --> load separately
Plug 'mattn/gist-vim'
Plug 'joonty/vdebug'
Plug 'mattn/webapi-vim'
"Plug 'arnaud-lb/vim-php-namespace', { 'for': 'php' }
"Plug 'wdalmut/vim-phpunit', { 'for': 'php' }
"Plug 'StanAngeloff/php.vim', { 'for': 'php' }
"Plug 'shawncplus/phpcomplete.vim', { 'for': 'php' }
"Plug 'joonty/vim-phpqa'
"Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'
Plug 'jiangmiao/auto-pairs'
"Plug 'davidhalter/jedi-vim'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'aserebryakov/vim-todo-lists'

call plug#end()

" FZF Config
map ; :Files<CR>

"
" Deoplete Config
"
"let g:deoplete#custom#set('jedi', 'debug_enabled', 1)
let g:deoplete#sources#jedi#debug_server = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]
set completeopt=longest,menuone,preview
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']

let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})

let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
let g:deoplete#sources#tss#javascript_support = 1
let g:tsuquyomi_javascript_support = 1
let g:tsuquyomi_auto_open = 1
let g:tsuquyomi_disable_quickfix = 1

" Emmet config
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" When writing a buffer (no delay).
call neomake#configure#automake('w')
let g:neomake_javascript_enabled_makers = ['eslint']

":PlugInstall
" }}}

if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" Use local vimrc if available
"if filereadable(expand("~/.vimrc.local"))
"	source $HOME/.vimrc.local
"endif

" For ctrlspace
set hidden
let g:CtrlSpaceDefaultMappingKey = "<C-space> "
set showtabline=0
if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif
" end for ctrlspace
set clipboard=unnamedplus
filetype plugin indent on
set number                               " enable line number
set rnu                                 " Relative line number
set secure                              " Enable secure mode
let mapleader = ","                     " Set the <Leader> for combo commands
set autoindent                          " Make sure that unrecognized files are still indented
set showcmd                             " Show (partial) commands (or size of selection in Visual mode) in the status
set showmatch                           " When a bracket is inserted, briefly jump to a matching one
syntax on
set encoding=utf-8
"set guifont=DejaVu\ Serif
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
set background=dark                     " Background options
"set t_Co=256
colorscheme dracula                     " Schema color
"colorscheme monokai-chris                   " Schema color
highlight Comment cterm=italic
highlight String cterm=italic
set exrc                                " Enable project specific .vimrc
"set spell                               " Enable spell check
set backspace=indent,eol,start
" make copy paste work with external applications
vnoremap <C-c> "+y
map <C-p> "+p

""""""""""
" NEOVIM "
""""""""""
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
let $NVIM_TUI_ENABLE_CORSOR_SHAPE = 1

" custom key commands
noremap <Leader>m :<C-U>NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 1
vmap < <gv
vmap > >gv
nnoremap k gk
nnoremap j gj


""""""""
" misc "
""""""""
" dismiss highlighted search items on leader+space
nnoremap <leader><space> :noh<cr>
" f9 to turn on/off highlighting of the current line
nnoremap <silent><f9> :set cursorline!<cr>
" cycling through buffers
nnoremap <C-n> :bnext<CR>:redraw<CR>
nnoremap <C-p> :bprevious<CR>:redraw<CR>
" exit Terminal mode with <ESC>
tnoremap <Esc> <C-\><C-n>

""""""""""""""""""""""""
" plugin customization "
""""""""""""""""""""""""
" remap ctrl p to <leader> t
let g:ctrlp_map = '<leader>t'
" map `;´ to open ctrl p in buffermode
nnoremap ; :CtrlPBuffer<CR>
" align selected lines on '='
map <leader>9 :Tabularize/=<cr>
" config identline
let g:indentLine_char = '¦'
let g:indentLine_enabled = 1
" Ultisnips Trigger config
autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:UltiSnipsExpandTrigger="<C-j>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"let g:UltiSnipsExpandTrigger="<C-l>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" deoplete.nvim, deoplete-jedi
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1

" Tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" Neosnippet config
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


