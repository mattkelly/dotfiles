" ---------------------
" Environment
" ---------------------
" Don't care about vi compatibility
set nocompatible

" ---------------------
" Plug
" ---------------------
" Setting up Plug - A minimalist Vim plugin manager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -sfLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source ~/.vimrc
endif

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'                 " Show git diff in the gutter (side column)
Plug 'ericbn/vim-solarized'                   " solarized color scheme
Plug 'bogado/file-line'                       " Open to line num using <filename>:<linenumber>
Plug 'chazy/cscope_maps'                      " cscope maps
Plug 'chrisbra/vim-diff-enhanced'             " Git diffs in vim
Plug 'christoomey/vim-tmux-navigator'         " Seamless vim and tmux
Plug 'ctrlpvim/ctrlp.vim'                     " Fuzzy file, etc finder
Plug 'junegunn/fzf'                           " Fuzzy file, etc finder
Plug 'fatih/vim-go'                           " golang development
Plug 'godlygeek/tabular'                      " Align stuff nicely
Plug 'kern/vim-es7'                           " ES6 + ES7 syntax
Plug 'kmARC/vim-fubitive'                     " Bitbucket integration for vim-fugitive (fork that actually works)
Plug 'moll/vim-node'                          " Node development
Plug 'nathanaelkane/vim-indent-guides'        " Indentation guides
Plug 'ntpeters/vim-better-whitespace'         " Highlight trailing whitespace
Plug 'othree/javascript-libraries-syntax.vim' " Syntax highlighting for js libs
Plug 'rizzatti/dash.vim'                      " Dash for vim
Plug 'rust-lang/rust.vim'                     " Rust support
Plug 'scrooloose/nerdcommenter'               " Commenting
"Plug 'scrooloose/nerdtree'                    " File navigation
Plug 'sheerun/vim-polyglot'                   " Syntax for lots of languages
Plug 'sjl/gundo.vim'                          " Visual undo (undo is a tree in vim, not a stack!)
Plug 'tell-k/vim-autopep8'                    " Automatically apply pep8 to python files
Plug 'tpope/vim-fugitive'                     " Git stuff
Plug 'tpope/vim-rhubarb'                      " GitHub stuff
Plug 'tpope/vim-sleuth'                       " Auto shiftwidth and expandtab based on file contents
Plug 'vim-airline/vim-airline'                " Status / tabline
Plug 'vim-airline/vim-airline-themes'         " Themes for airline
"Plug 'vim-scripts/cscope.vim'                 " cscope
Plug 'mzlogin/vim-markdown-toc'               " Markdown table of contents generator
"Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intellisense engine

call plug#end()

" ---------------------
" Leader
" ---------------------
" Set comma as the leader
let mapleader=","

" ---------------------
" Whitespace
" ---------------------
" Expand all tabs to spaces
"set expandtab
" Set tab width
"set tabstop=4 " number of visual spaces per tab
"set softtabstop=4 " number of spaces in tab when editing
" Expand all existing tab characters to spaces
"retab
" Set number of spaces for indentation
"set shiftwidth=4

"augroup filetype_c
    "autocmd!
    ":autocmd FileType c setlocal tabstop=2 shiftwidth=2 softtabstop=2
"augroup end

" Remove trailing whitespace on write
autocmd BufWritePre * :%s/\s\+$//e

" ---------------------
" Key Mappings
" ---------------------
" jj to Esc
imap jj <Esc>
" :W<CR> to :w<CR> since I can't seem to hit :w accurately
cnoreabbrev W w
" :Q<CR> to :q<CR> since I can't seem to hit :q accurately either...
cnoreabbrev Q q

" ---------------------
" Syntax
" ---------------------
" Enable syntax highlighting
if has("syntax")
  syntax enable
endif
" Set JavaScript Template file syntax highlighting to HTML format
au BufNewFile,BufRead *.ejs set filetype=html
" Set gradle file syntax highlighting to groovy format
au BufNewFile,BufRead *.gradle set filetype=groovy
" scons = python
au BufRead,BufNewFile SConstruct set filetype=python
au BufRead,BufNewFile *.scons set filetype=python

" Show matching brackets
set showmatch

match Type /\w*_t[ ;,]/

set background=dark
colorscheme solarized
set termguicolors

"highlight ColorColumn ctermbg=200 guibg=#2c2d27
let &colorcolumn="80,".join(range(100,999),",")

" Spell checking
set spell

" Make comment reflow and such play nice with Doxygen-style comments
autocmd Filetype c,cpp set comments^=://!
" When joining lines (e.g. J or a reflow), ensure there's only one space after
" a period.
set nojoinspaces

" ---------------------
" Searching
" ---------------------
" Highlight matches in search
set hlsearch
" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" ---------------------
" Folding
" ---------------------
" Enable folding
set foldenable
" Open most folds by default
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax

" ---------------------
" Movement
" ---------------------
" Move vertically by visual line
nnoremap j gj
nnoremap k gk
" Highlight last inserted text
nnoremap gV `[v`]

" ---------------------
" CtrlP
" ---------------------
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob "" --glob "!vendor"'
endif

set wildignore+=*/.git/*,*/tmp/*,*.swp

" ---------------------
" fzf
" ---------------------
command! FZFMru call fzf#run({
\  'source':  v:oldfiles,
\  'sink':    'e',
\  'options': '-m -x +s',
\  'down':    '40%'})

nmap <C-P> :FZF<CR>
nmap <C-B> :FZFMru<CR>

" ---------------------
" Other
" ---------------------
" Show line numbers
set number
" Highlight current line
set cursorline
" Fix backspace, which sometimes doesn't work as expected by default
set backspace=2
" Visual autocomplete for command menu
set wildmenu
" Redraw only when we need to
set lazyredraw
" Line number, displacement in status bar
set ruler
" Automatically save upon running e.g. :write, :GoBuild
set autowrite

" Jump to last position when reopening file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" No sound on errors, visual bell instead
set noerrorbells
set visualbell
" Split new window to right instead of left when :split is used
set splitright

 set diffopt+=iwhite
  set diffexpr=DiffW()
  function! DiffW()
    let opt = ""
     if &diffopt =~ "icase"
       let opt = opt . "-i "
     endif
     if &diffopt =~ "iwhite"
       let opt = opt . "-w " " vim uses -b by default
     endif
     silent execute "!diff -a --binary " . opt .
       \ v:fname_in . " " . v:fname_new .  " > " . v:fname_out
  endfunction

" Toggle paste mode using F2 key
set pastetoggle=<F2>

" Fix split sizes after terminal resized
augroup Misc
autocmd!
    autocmd VimResized * exe "normal! \<c-w>="
augroup END

" Fix vim contents persisting on screen after close
" Behavior seen in OSX Terminal app
if &term =~ "ansi"
  let &t_ti = "\<Esc>[?47h"
  let &t_te = "\<Esc>[?47l"
endif

set maxmempattern=2048

" --------------
" ctags
" --------------
set tags+=tags,./tags,./.git/tags

" --------------
" CtrlP
" --------------
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg|o|d)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" --------------
" Airline
" --------------
" Enable the list of buffers
let g:airline#extensions#tabline#enabled=1

" Show just the filename
let g:airline#extensions#tabline#fnamemod=":t"

" Theme
let g:airline_theme="solarized"

" --------------
" vim-go
" --------------
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)

" --------------
" rust.vim
" --------------
let g:rustfmt_autosave = 1
let g:rust_clip_command = 'xclip -selection clipboard'

" More syntax highlighting
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

" --------------
" Neovim
" --------------
" nvim incremental / live substitute
if has('nvim')
  set inccommand=split
endif

" --------------
" Markdown
" --------------
" Use '-' instead of '*' for markdown TOC leader
let g:vmt_list_item_char = '-'
" Indent by two spaces per level
let g:vmt_list_indent_text = '  '

" Avoid message about adding cscope db every startup
"set nocscopeverbose
" Automatically prepend prefix to db entries to allow use from any dir
"set cscoperelative

" --------------
" coc.nvim
" --------------
"source ~/.vimrc-coc

" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <leader>z :ZoomToggle<CR>
