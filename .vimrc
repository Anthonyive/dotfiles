" Comments in Vimscript start with a `"`.

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" color theme
Plug 'morhetz/gruvbox' 
" status bar theme
Plug 'vim-airline/vim-airline'
" comments
Plug 'tpope/vim-commentary'
" vim git wrapper
Plug 'tpope/vim-fugitive'
" vim auto-pair brackets
Plug 'jiangmiao/auto-pairs'
" surround quotes/brackets/...
" useful shortcuts:
" ysiw": 'yank surround inside word', add double quotes to a word
Plug 'tpope/vim-surround'
" nnn file explorer
Plug 'mcchrish/nnn.vim'
" code completion coc: Use release branch (recommend)
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Check syntax in Vim asynchronously and fix files, with Language 
" Server Protocol (LSP) support
Plug 'dense-analysis/ale'
" nerdtree
Plug 'preservim/nerdtree'
"nerdtree icons
Plug 'ryanoasis/vim-devicons'
" neovim lsp (require neovim 5.0)
" Plug 'neovim/nvim-lspconfig'

call plug#end()

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" disable deleting brackets, quotes in pair
let g:AutoPairsMapBS = 0

" set encodings
set encoding=UTF-8

" nerdtree keymappings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" coc config
" let g:coc_global_extensions = ['coc-pairs', 'coc-tsserver', 'coc-eslint', 'coc-prettier', 'coc-json', 'coc-pyright', 'coc-sh']

" nnn Floating window (neovim latest and vim with patch 8.2.191)
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }

" vim-airline show git branch
" let g:airline#extensions#branch#enabled=1

" Automatically displays all buffers when there's only one tab open.
" let g:airline#extensions#tabline#enabled = 1

" Set the keybinding for starting omnicompletion to <C-N> instead of <Ctrl-Space>
let g:jedi#completions_command = "<C-N>"

" Vim can be configured for each file type independently. For example, 
" Vim can be configured to use four spaces for a tab when it opens a Python 
" file but two spaces when it opens an R file. To enable file-specific 
" settings put the following line in the .vimrc file:
" https://towardsdatascience.com/getting-started-with-vim-and-tmux-for-python-707ec5ff747f
filetype plugin indent on

" Set color scheme
colorscheme gruvbox

" If you open this file in Vim, it'll be syntax highlighted for you.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible

" Leave # of lines at the bottom
set scrolloff=6

" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" move cursor in Insert Mode 
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l

" spell checking
set spelllang=en_us
set spell

" --- INDENTATION OPTIONS BEGIN ---

" New lines inherit the indentation of previous lines.
set autoindent

" Convert tabs to spaces.
set expandtab

" Enable indentation rules that are file-type specific.
" set filetype indent on

" When shifting lines, round the indentation to the nearest multiple of “shiftwidth.”
set shiftround

" When shifting, indent using four spaces.
set shiftwidth=4

" Insert “tabstop” number of spaces when the “tab” key is pressed.
set smarttab

" Indent using four spaces.
set tabstop=4

" --- INDENTATION OPTIONS END ---


" --- USER INTERFACE OPTIONS BEGIN ---

" Set the window’s title, reflecting the file currently being edited.
set title

" --- USER INTERFACE OPTIONS END ---

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
