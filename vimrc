" Forked from https://github.com/Remchi/dotfiles
"                      VUNDLE
" =============================================================

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-abolish'
Plugin 'mattn/emmet-vim'

Plugin 'rbgrouleff/bclose.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Lokaltog/vim-easymotion'

Plugin 'SirVer/ultisnips'

Plugin 'pangloss/vim-javascript'
Plugin 'mustache/vim-mustache-handlebars'

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tomtom/tcomment_vim'
Plugin 'machakann/vim-textobj-delimited'
Plugin 'gorkunov/smartpairs.vim'

" Test Run
Plugin 'terryma/vim-expand-region'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'mxw/vim-jsx'
Plugin 'kana/vim-textobj-user'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-vinegar'

" Colour Themes
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'joshdick/onedark.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'gosukiwi/vim-atom-dark'
Plugin 'GertjanReynaert/cobalt2-vim-theme'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'https://github.com/gorodinskiy/vim-coloresque.git'
Plugin 'itchyny/lightline.vim'

Plugin 'wincent/command-t'
Plugin 'Valloric/YouCompleteMe'

" Linters
Plugin 'w0rp/ale'

call vundle#end()
filetype plugin indent on
syntax on

runtime macros/matchit.vim

" =============================================================
"                 GENERAL SETTINGS
" =============================================================

set backspace=indent,eol,start
set history=1000
set ruler
set showcmd
set autoindent
set smartindent
set showmatch
set nowrap
set autoread
set autowrite
set backupdir=~/.tmp
set directory=~/.tmp
set viminfo+=!
set guioptions-=T
set laststatus=2
set scrolloff=3
set sidescrolloff=4
set hidden
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set relativenumber
set number
set wrap
set linebreak
set hlsearch
set incsearch
set ignorecase
set smartcase
set mouse=a
set shell=bash
set clipboard=unnamed
set winwidth=100
set winheight=5
set winminheight=5
set winheight=999
set noswapfile
set wildmenu
set nostartofline
" (Hopefully) removes the delay when hitting esc in insert mode
set noesckeys
set ttimeout
set ttimeoutlen=1
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set guioptions-=L  "remove left-hand scroll bar
" =============================================================
"                    AUTOCOMMANDS
" =============================================================

if has("autocmd")
  augroup vimrcEx
    au!

    autocmd BufRead *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif

    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
    autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

    autocmd BufRead,BufNewFile *.asc setfiletype asciidoc

    au BufNewFile,BufReadPost *.md set filetype=markdown
  augroup END
endif

" =============================================================
"                      MAPPINGS
" =============================================================

map <left> <nop>
map <right> <nop>

let mapleader = ","

" insert mode
imap <c-e> <esc>A

" Quick open most used files
nnoremap <leader>em :!open -a 'Marked 2.app' '%:p'<cr>
nnoremap <leader>ev :tabnew ~/.vimrc<cr>
nnoremap <leader>es :split<cr>:UltiSnipsEdit<cr>

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-l>"

" create/open file in current folder
map <Leader>ee :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>

nnoremap <silent> <space> :nohl<Bar>:echo<CR>
nnoremap <leader>m mzyyp`zj
nnoremap <leader>v :set invpaste paste?<CR>
nnoremap <leader>V V`]
nmap k gk
nmap j gj
nnoremap H ^
nnoremap E $
inoremap <C-n> <C-j>

noremap <Leader>d :Bclose<CR>
noremap <Leader>D :bufdo bd<CR>

cnoremap %% <C-R>=expand("%:p:h") . "/" <CR>

" CtrlP plugin
" nnoremap <leader>f :CtrlP<cr>
" nnoremap <leader>w :CtrlP app/assets/javascripts<cr>
" nnoremap <leader>. :CtrlPBuffer<cr>
" nnoremap <leader>p :CtrlPClearCache<cr>
" nnoremap <leader>gc :CtrlP app/controllers<cr>
" nnoremap <leader>gv :CtrlP app/views<cr>
" nnoremap <leader>gm :CtrlP app/models<cr>
" nnoremap <leader>gs :CtrlP app/services<cr>
" nnoremap <leader>gr :CtrlP spec<cr>
" nnoremap <leader>gt :CtrlP ~/Dropbox/gollum<cr>
" nnoremap <leader>gp :CtrlP <C-R>=expand("%:p:h") . "/"<cr><cr>

" Command-T
nnoremap \f :CommandT<cr>
nnoremap \r :CommandTFlush<cr>
nnoremap <leader>. :CommandTBuffer<cr>

nnoremap <leader>z :Gstatus<CR><C-w>20+

nnoremap <leader>1 1gt<cr>
nnoremap <leader>2 2gt<cr>
nnoremap <leader>3 3gt<cr>
nnoremap <leader>4 4gt<cr>

let g:CommandTWildIgnore=&wildignore . ",*/node_modules"

" inc search for range commands
cnoremap $t <CR>:t''<CR>
cnoremap $T <CR>:T''<CR>
cnoremap $m <CR>:m''<CR>
cnoremap $M <CR>:M''<CR>
cnoremap $d <CR>:d<CR>``

" saves cursor after yanking in visual mode
vnoremap y myy`y
vnoremap Y myY`y
" =============================================================
"                 PLUGINS CONFIGURATION
" =============================================================

" NERDTree
nnoremap \q :NERDTreeToggle<cr>
let NERDTreeMinimalUI=1
let NERDTreeShowLineNumbers=1

" Easymotion
nmap s <Plug>(easymotion-s)
omap s <Plug>(easymotion-bd-t)
vmap s <Plug>(easymotion-bd-t)

" Airline
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline_theme='PaperColor'

" Markdown
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_fenced_languages = ['html', 'js=javascript', 'ruby']

" CtrlP
let g:ctrlp_working_path_mode='a'
set wildignore+=**/bower_components/*,**/node_modules/*,**/tmp/*,**/assets/images/*,**/assets/fonts/*,**/public/images/*

" JSX
let g:jsx_ext_required = 0
let g:javascript_enable_domhtmlcss = 1
let g:used_javascript_libs = 'underscore,react,chai'
let g:javascript_plugin_jsdoc = 1

" let g:indentLine_noConcealCursor=""
" let g:vim_json_syntax_conceal = 0

" =============================================================
"                      APPEARENCE
" =============================================================

set term=xterm
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

" Making cursor a bar in insert mode
" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_SR = "\<Esc>]50;CursorShape=2\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"

colorscheme atom-dark
set background=dark

if has("gui_running")
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h11
  set linespace=2
  set guioptions-=r
endif

" =============================================================
"                      PROJECTIONS
" =============================================================

" Add projections here...

" =============================================================
"                      CUSTOM FUNCTIONS
" =============================================================

" Create folders on file save
" ===========================

function! s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction

" Remove whitespaces on save saving cursor position
" =================================================

function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" set langmap=йцукенгшщзхъфывапролджэячсмитьбю;qwfpgjluy\\;[]arstdhneio'zxcvbkm\\,.

" abbrevs for Star Wars
iabbrev dgre &#246;
iabbrev dred &#243;
iabbrev dpur &#245;
iabbrev dyel &#244;
iabbrev dfor &#247;
iabbrev dbla &#241;
iabbrev dblu &#242;

iabbrev dlig &#248;
iabbrev ddar &#249;
iabbrev ddes &#250;
iabbrev dadv &#251;
iabbrev dfai &#253;
iabbrev dsuc &#255;
iabbrev dthr &#252;
iabbrev dtri &#254;

let @y=':%s/“/"/g'
let @u=':%s/”/"/g'
let @l=':%s/’/''/g'
let @j=':%s/—/-/g'

" Control P - for finding files in vim
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

