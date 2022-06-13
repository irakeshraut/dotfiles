set nocompatible              " be iMproved, required
filetype off                  " required
set shell=/bin/bash

" it will yank to clipboard, easier for copy paste
set clipboard=unnamed
" set Leader Key to space
let mapleader = " "

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vim Ruby
Plugin 'vim-ruby/vim-ruby'
" Show all indetation
Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'AndrewRadev/splitjoin.vim'
" Plugin specically for working with Rails project
Plugin 'tpope/vim-rails'

" Ruby Test
Plugin 'skalnik/vim-vroom'

" Plugin to refactor Ruby code
Plugin 'ecomba/vim-ruby-refactoring'

" Plugin for checking syntax error
Plugin 'scrooloose/syntastic'

" dependies for snipmate Plugin
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'

" provide support for different snippets 
Plugin 'garbas/vim-snipmate'
" provide snippets for different languages
Plugin 'honza/vim-snippets'
 
" Plugin to Autopare brackets [{( )}]
Plugin 'jiangmiao/auto-pairs'

" Plugin to surround text with comman, brackets
Plugin 'tpope/vim-surround'

" Plugin for Tab completions of code
Plugin 'ervandew/supertab'

" Fuzzy finder for Vim (CTR + P)
Plugin 'kien/ctrlp.vim'

" Bundle command inside vim
Plugin 'tpope/vim-bundler'

" Plugin to add end after def if do
Plugin 'tpope/vim-endwise'

" Status bar at bottom of Vim
Plugin 'bling/vim-airline'

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" let you comment/uncomment the come
Plugin 'tomtom/tcomment_vim'

" Plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" Plugin for Git changes
Plugin 'airblade/vim-gitgutter'

" Plugin to read docs online
Plugin 'lucapette/vim-ruby-doc'

" Molokai Theme
Plugin 'tomasr/molokai'

" Plugin to switch between Vim and Tmux
" Plugin 'christoomey/vim-tmux-navigator'

" Plugin to toggle between Ruby block syntax
Plugin 'jgdavey/vim-blockle'

" Plugin for NerdTree
Plugin 'scrooloose/nerdtree'

" Plugin for tagbars
Plugin 'majutsushi/tagbar'

" Plugin to swap window without effecting layout
Plugin 'wesQ3/vim-windowswap'

" Plugin 'easymotion/vim-easymotion'

Plugin 'szw/vim-maximizer'
" Other plugins from Command line
" Ctags    brew install ctags
" Ag       brew install the_silver_searcher

" Plugin for Javascript
Plugin 'pangloss/vim-javascript'

" Plugin for React
Plugin 'maxmellon/vim-jsx-pretty'

" Plugin for Slim syntx highlight
Plugin 'slim-template/vim-slim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Ruby Stuff
syntax on
"filetype Plugin intent on

augroup myfiletypes
	" Clear old autocmds in group
	autocmd!
	" autoindent with two spaces, always expand tabs
	autocmd FileType ruby,eruby,yaml,markdown,html,js,css set ai sw=2 sts=2 et
augroup END

" Auto reload .vimrc file when ever changes are applied to it
augroup reload_vimrc " {
	autocmd!
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" Syntax highlighting and theme
syntax enable
" Configs to make Molokai look great
set background=dark
" let g:molokai_original=1
let g:rehash256=1
set t_Co=256
colorscheme molokai

" Settings for syntastic plugin
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_eruby_ruby_quiet_messages =
    \ {"regex": "possibly useless use of a variable in void context"}

" chain together different style checkers
let g:syntastic_ruby_checkers=['rubocop', 'mri']

" Setting for vim-ruby-doc
let g:ruby_doc_command='open'
let g:ruby_doc_rails_mapping='ee'

" show linenumber
set nu

" don't create backup files
set nobackup

" don't create swap files
set noswapfile

" highlight the current line
set cursorline

" highlight the matching brackets
set showmatch

" search as characters are entered
set incsearch

" highlight search matches
set hlsearch

set wildmenu

set ignorecase
set smartcase

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  " use regex by default to find files
  let g:ctrlp_regexp = 1
endif

" press ff to grep word under cursor
nnoremap ff :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Key Mappings
" ----------------

" press jj insdead of ESC to change mode
imap jj <Esc>

" Opening .vimrc and .zshrc from vim
map <leader>v :e $MYVIMRC<CR>
map <leader>z :e ~/.zshrc<CR>

" Source VIMRC file(useful to change vimrc and load it)
map <leader>l :so $MYVIMRC<CR>

" remove highlights
map no :noh<CR>

" Easy navigation between split windows
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Delete trailing white space
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" auto reload changed files
set autoread

" show where is starting and end of block using % do end
runtime macros/matchit.vim

" settings for NerdTree
map <leader>n :NERDTreeToggle<CR>
" open current file in NerdTree explorer
map <F1> :NERDTreeFind<CR>

" setting for indentation guide
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3
nmap <leader>i ::IndentGuidesToggle<CR>

" mapping for tagbar
nmap <leader>t :TagbarToggle<CR>

" Rotate windows (useful to swap two widows by pressing ss)
noremap ss <C-w>R

" mapping for vim-swapwindow
map <leader>ss <leader>ww

" vertical increase/decrease size of window
map + :vertical resize +5<CR>
map = :vertical resize +5<CR>
map - :vertical resize -5<CR>

" make all split window equal size
map \ <C-w>=

" bind \ (backward slash) to grep shortcut
" command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
" nnoremap <leader>f :Ag<SPACE>
"
" vim airline setting (show buffers)
let g:airline#extensions#tabline#enabled = 1
" show buffer number as well
let g:airline#extensions#tabline#buffer_nr_show = 1

" mapping for vim-blockle
" let g:blockle_mapping = '<leader>b'
" mapping for Ctrl-P
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>m :CtrlPMRUFiles<CR>
" nnoremap <leader>t :CtrlPTag<CR>

"mapping for split join
" let g:splitjoin_split_mapping = ''
" let g:splitjoin_join_mapping = ''

nmap <Leader>j :SplitjoinJoin<cr>
nmap <Leader>s :SplitjoinSplit<cr>

" Vim rails abbresations
:cabbrev c Econtroller
:cabbrev m Emodel
:cabbrev h Ehelper
:cabbrev v Eview
:cabbrev ma Emailer
:cabbrev l Elayout
:cabbrev e Extract
:cabbrev mi Emigration<cr>
:cabbrev gems e Gemfile<cr>
:cabbrev s Eschema<cr>
:cabbrev db Console<cr>
:cabbrev g Generate
:cabbrev d Destroy
:cabbrev tags Ctags<cr>
:cabbrev r Einit<cr>
:cabbrev mig Rake db:migrate<cr>
:cabbrev roll Rake db:rollback<cr>

" Toogle paste using leader f2
" set pastetoggle=<F2>

map <F2> :set paste<CR>i
" Leave paste mode on exit
 au InsertLeave * set nopaste

nnoremap <F3> :set spell!<CR>
" format code
nnoremap <F4> ggvG=

" quickly open irb
map <F12> :w!<cr>:!irb<cr>
map <leader>irb :w!<cr>:!irb<cr>
" ruby code
map <F10> :w!<cr>:!ruby %:p<cr>
map <leader>run :w!<cr>:!ruby %:p<cr>
