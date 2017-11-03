" Install vim-plug if we don't already have it
if empty(glob("~/.vim/autoload/plug.vim"))
    " Ensure all needed directories exist  (Thanks @kapadiamush)
    silent execute 'mkdir -p ~/.vim/plugged'
    silent execute 'mkdir -p ~/.vim/autoload'
    " Download the actual plugin manager
    execute 'curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Filesystem sidebar
Plug 'scrooloose/nerdtree' | Plug 'jistr/vim-nerdtree-tabs', { 'on':  'NERDTreeToggle' }
Plug 'kien/ctrlp.vim' " Ctrl+P file search and open

" Git plugins
Plug 'airblade/vim-gitgutter'

" Syntax helpers
Plug 'spf13/vim-autoclose' " Autoclose brackets

Plug 'scrooloose/syntastic',{ 'for': ['php', 'python', 'javascript', 'css', 'cpp', 'rust'] } " Syntax checker
Plug 'bling/vim-airline' " System bar
Plug 'terryma/vim-multiple-cursors' " MultiCursor edit
Plug 'scrooloose/nerdcommenter' " Quick commenting and uncommenting
Plug 'kien/rainbow_parentheses.vim' " Color brackets for right brace matching
Plug 'tpope/vim-surround' " Quick Surround manager
Plug 'majutsushi/tagbar' " Class and variable Name -> ,t
Plug 'sheerun/vim-polyglot'

" Themes
Plug 'tomasr/molokai'
Plug 'whatyouhide/vim-gotham'
Plug 'ayu-theme/ayu-vim' 

" AutoComplete and snippets
Plug 'Valloric/YouCompleteMe', { 'for': ['cpp', 'rust', 'javascript'], 'do': './install.py --clang-completer --tern-completer --racer-completer' } 
autocmd! User YouCompleteMe if !has('vim_starting') | call youcompleteme#Enable() | endif

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" For Terminal
Plug 'Shougo/vimshell.vim' | Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" Misc Tools
Plug 'vimwiki/vimwiki' " Keep wiki like notes
Plug 'mhinz/vim-startify' " Vim Startify
Plug 'thaerkh/vim-workspace' " Atom/Sublime like workspaces

filetype plugin indent on
call plug#end()
