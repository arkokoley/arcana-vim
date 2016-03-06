set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#rc()
call vundle#begin()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/Vundle.vim'

" My Bundles here:
"
" original repos on github
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'spf13/vim-autoclose'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'rstacruz/sparkup'
Plugin 'tpope/vim-surround'
Bundle 'zenorocha/dracula-theme'
Plugin 'whatyouhide/vim-gotham'
Plugin 'ryanss/vim-hackernews'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'sickill/vim-monokai'
Plugin 'tomasr/molokai'
Plugin 'majutsushi/tagbar'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'rip-rip/clang_complete'
Plugin 'vimwiki/vimwiki'
Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/vimshell.vim'
" Github repos of the user 'vim-scripts'
" => can omit the username part

" non github repos
" ...
call vundle#end()
"" General Settings

syntax on
set background=dark
color gotham256
" Line endings should be Unix-style unless the file is from someone else.
set fileformat=unix
au BufNewFile * set fileformat=unix

" Automatically indent when adding a curly bracket, etc.
" required! by vundle
filetype plugin indent on

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
set list " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
" show line numbers
set relativenumber 
set number 

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
let g:syntastic_c_check_header = 1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"Airline take off
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme = 'gotham256'
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

" These lines setup the environment to show graphics and colors correctly.
set t_Co=256

let g:minBufExplForceSyntaxEnable = 1

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
