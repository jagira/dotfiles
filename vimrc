scriptencoding utf-8
set encoding=utf-8

" install vim-plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" plugins
Plug 'preservim/nerdtree'                         " nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'itchyny/lightline.vim'                      " statusline
Plug 'airblade/vim-gitgutter'                     " show sign column for git diff
Plug 'girishji/vimcomplete'                       " autocomplete
Plug 'tpope/vim-commentary'                       " commenting
Plug 'tpope/vim-surround'                         " change surrounding tags / brackets
Plug 'preservim/vim-indent-guides'                " display indent guides
Plug 'tpope/vim-endwise'                          " add end to ruby blocks
Plug 'Raimondi/delimitMate'                       " provide automatic closing of parantheses / quotes
Plug 'vim-ruby/vim-ruby'                          " ruby syntax
Plug 'tpope/vim-markdown'                         " markdown syntax
Plug 'pangloss/vim-javascript'                    " javascript syntax
Plug 'sonph/onehalf', { 'rtp': 'vim' }            " color theme

call plug#end()

syntax on                                         " enable syntax highlighting
set autoindent                                    " automatically indent new line
set tabstop=2                                     " number of spaces in a tab
set shiftwidth=2                                  " number of spaces for indent
set shiftround                                    " indentation: When at 3 spaces, >> takes to 4, not 5
set expandtab                                     " expand tabs into spaces
set nofixeol                                      " do not add emptyline characters at the end of every file
set nowrap                                        " do not wrap words (view)
set nofoldenable                                  " dont fold by default
set visualbell                                    " use visual bell instead of beeping
set hidden                                        " allow switching to a new file without saving the current buffer
set autoread                                      " automatically read file that has been changed outside of vim
set backspace=indent,eol,start                    " standard backspace behavior
set number                                        " precede each line with its line number
set numberwidth=3                                 " number of columns for line numbers
set showcmd                                       " show (partial) command in status line.
set showmatch                                     " show matching brackets.
set cursorline                                    " highlight line where cursor is located
set ruler                                         " line and column number of the cursor position
set wildmenu                                      " enhanced command completion
set belloff=esc                                   " prevent screen from flashing when Esc is pressed
set laststatus=2                                  " always show the status line
set list                                          " display of non-printable characters
set listchars=tab:▷⋅,trail:·                      " display characters for  tab and trailing spaces
set t_Co=256                                      " use 256 colors
set completeopt=menuone,preview                   " completion popup menu
set incsearch                                     " incremental search
set hlsearch                                      " highlight search match
set ignorecase                                    " do case insensitive matching
set smartcase                                     " do not ignore if search pattern has CAPS
set nobackup                                      " do not write backup files
set nowritebackup                                 " do not write backup files
set noswapfile                                    " do not write .swp files
set clipboard=unnamed                             " use system clipboard
set updatetime=100                                " gitgutter waits this long to update hunk markers

runtime macros/matchit.vim                        " extended '%' mapping for if/then/else/end etc

" specify ruby keywords
autocmd FileType ruby setlocal iskeyword+=-,!,?,=

" set termguicolors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" use onehalfdark colorscheme
silent! colorscheme onehalfdark

" lightline colorscheme
silent! let g:lightline = { 'colorscheme': 'onehalfdark' }

" syntastic config
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

" delimitMate config
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 1

" nerdtree config
autocmd vimenter * if !argc() | NERDTree | endif  " start nerdtree when vim is started without any arguments
let NERDTreeIgnore = ['\.dump$']                  " hide .dump files in nerdtree

" indent-guides config
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 5

"  vimcomplete config
let g:vimcomplete_tab_enable = 1

" Set spacebar as leader
let mapleader = " "

" NERDTree mappings
" Ctrl-P to Display the file browser tre
nmap <C-P> :NERDTreeToggle<CR>
" leader+p to show current file in the tree
nmap <leader>p :NERDTreeFind<CR>

" prevent accidentally entering Ex mode
map Q gq

" allow using :Q, :W, or :E instead of :q, :w, or :e, in case of accidental capital letters
command Q q
command -nargs=* -complete=file W w <args>
command -nargs=* -complete=file E e <args>

" keep selection after in/outdent (shifting text)
vnoremap < <gv
vnoremap > >gv

" better navigation of wrapped lines
nnoremap j gj
nnoremap k gk

" local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif