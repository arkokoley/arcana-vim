set nocompatible

source $HOME/.arcana-vim/plugins.vim

" General Settings

" These lines setup the environment to show graphics and colors correctly.
set t_Co=256

syntax on
"set background=dark
colorscheme molokai
" Line endings should be Unix-style unless the file is from someone else.
set fileformat=unix
au BufNewFile * set fileformat=unix
au BufNewFile,BufRead *.rs set filetype=rust
au VimEnter * set term=$TERM

" Tabs converted to 2 spaces
set shiftwidth=2
set tabstop=2
set expandtab
set smarttab
set backspace=indent,eol,start

set autoindent
set smartindent
set autoread " reload files when changed on disk, i.e. via `git checkout`
set backupcopy=yes " see :help crontab
set clipboard=unnamed " yank and paste with the system clipboard
set directory-=. " don't store swapfiles in the current directory
set encoding=utf-8
set ignorecase " case-insensitive search
set incsearch " search as you type
" Highlight tabs and trailing spaces
set list                    " Make whitespace characters visible
set listchars=tab:▸\ ,trail:•
" Show line numbers
set relativenumber
set number

set nohidden                    " Don't allow buffers to exist in the background
set ttyfast                     " Indicates a fast terminal connection
set shortmess+=I                " No welcome screen
set shortmess+=A                " No .swp warning
set history=200                 " Remember the last 200 :ex commands

set mouse=a                 " Enable mouse support
set wildmenu                " Command completion
set wildmode=list:longest   " List all matches and complete till longest common string

" My command line autocomplete is case insensitive. Keep vim consistent with
" that. It's a recent feature to vim, test to make sure it's supported first.
if exists("&wildignorecase")
    set wildignorecase
endi

" Buffer Area Visuals
set scrolloff=7             " Minimal number of screen lines to keep above and below the cursor.
set visualbell              " Use a visual bell, don't beep!
set cursorline              " Highlight the current line
set wrap                    " Soft wrap at the window width
set linebreak               " Break the line on words
set textwidth=79            " Break lines at just under 80 characters

" show fold column, fold by markers
set foldcolumn=0            " Don't show the folding gutter/column
set foldmethod=marker       " Fold on {{{ }}}
set foldlevelstart=20       " Open 20 levels of folding when I open a file

" Open folds under the following conditions
set foldopen=block,hor,mark,percent,quickfix,search,tag,undo,jump


" Splits
set splitbelow              " Open new splits below
set splitright              " Open new vertical splits to the right

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <tab> %
vnoremap <tab> %

"C compiler
let g:clang_complete_auto = 1
let g:clang_use_library = 1
let g:clang_library_path = '/usr/lib/llvm-3.5/lib/libclang.so.1'
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_c_check_header = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_tex_checkers = ['lacheck', 'text/language_check']
"Airline take off
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme = 'molokai'
let g:airline#extensions#tabline#enabled = 1
" Rainbow Parenthesis colors
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16

let g:gitgutter_sign_removed_first_line = "^_"

let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"keyboard shortcuts
let mapleader = ','
nnoremap <leader><space> :noh<CR>
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>r :RainbowParenthesesToggle<CR>
nnoremap <leader>m :VimShellPop<CR>
nnoremap <leader>t :TagbarToggle<CR>
nnoremap <leader>hn :HackerNews<CR>
nnoremap <leader>clean :PluginClean<CR>
nnoremap <leader>update :PluginUpdate<CR>

" Spell Check Functionality
nnoremap <leader>s :set spell spelllang=en_us ! nospell?<CR>
nnoremap <leader>f 1z=<CR>
" MultiCursor key mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
let g:multi_cursor_start_key='<F3>'
"tab keys
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-t> :tabnew<CR>
map  <C-w> :close<CR>
nnoremap ; :
inoremap jk <Esc>
nnoremap ! :!
nnoremap zs :w<CR>
nnoremap zz :wq<CR>
nnoremap zq :q<CR>

nnoremap  <C-s> :vsp<CR>
nnoremap  <leader>l :wincmd l<CR>
nnoremap  <leader>h :wincmd h<CR>
"nnoremap j gj
"nnoremap k gk

" Fugitive Git commands
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
" Mnemonic _i_nteractive
nnoremap <silent> <leader>gi :Git add -p %<CR>
nnoremap <silent> <leader>gg :SignifyToggle<CR>


"Wordprocessing capabilities
func! WordProcessorMode()
  setlocal formatoptions=t1
  setlocal textwidth=80
  map j gj
  map k gk
  setlocal smartindent
  setlocal spell spelllang=en_us
  setlocal noexpandtab
endfu
com! WP call WordProcessorMode()

function! g:UltiSnips_Complete()
   call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
let g:UltiSnipsExpandTrigger="<c-j>"
let g:minBufExplForceSyntaxEnable = 1

let g:polyglot_disabled = ['latex']

if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme

" CTRL-P loader #skip .gitignore files
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

set guifont=Inconsolata\ for\ Powerline\ 12
if ! has('gui_running')
  set ttimeoutlen=10
         augroup FastEscape
            autocmd!
            au InsertEnter * set timeoutlen=0
            au InsertLeave * set timeoutlen=1000
         augroup END
endif

" vimwiki settings
let g:vimwiki_global_ext = 1
let g:vimwiki_hl_headers = 1
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_list = [
  \{'path': '~/notes/'},
\]
" Use local vimrc if available {
  if filereadable(expand("~/.vimrc.local"))
      source ~/.vimrc.local
  endif
" }

" Use local gvimrc if available and gui is running {
  if has('gui_running')
      if filereadable(expand("~/.gvimrc.local"))
          source ~/.gvimrc.local
      endif
  endif
" }
