" Shuyu vim config
" https://github.com/shuyuzheng/Shuyu-vim-config
" General setting
" ================================================================================
" set encoding method
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,GB2312,big5

" set searching
set path+=**  "search subfolders
set hlsearch
set incsearch
set wildmenu

" scheme
syntax enable
set background=dark
colorscheme solarized

" general setting
set helplang=en
set history=500
set tabstop=2
set nu!
set wrap
set linebreak
set autochdir
set scrolloff=5
set showtabline=2
set autoread

" status bar
set statusline=[%f]%y$r%m%*%=[line:%l/%l,colum:%c][%p%%]
set ruler

" coding
syntax enable
syntax on
set showmatch
set smartindent
set cursorline
set expandtab

" file type specific setting
autocmd FileType html,xhtml,xml,css,javascript set
  \ tabstop=2 
  \ shiftwidth=2  
  \ expandtab 
  \ softtabstop=2   

" Python
let python_highlight_all = 1 " enable all python syntax highlighting features
au Filetype python set tabstop=4
au Filetype python set softtabstop=4
au Filetype python set shiftwidth=4
au Filetype python set textwidth=79
au Filetype python set expandtab
au Filetype python set autoindent
au Filetype python set fileformat=unix
autocmd Filetype python set foldmethod=indent
autocmd Filetype python set foldlevel=99

" spell check
set spell

" Plugins

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
" color theme
Plugin 'altercation/vim-colors-solarized'
" Markdown related plugin
Plugin 'godlygeek/tabular' " Required by vim-markdown table format function
Plugin 'plasticboy/vim-markdown'
Plugin 'mattn/emmet-vim'
" JavaScript related
Plugin 'pangloss/vim-javascript'
Plugin 'marijnh/tern_for_vim'
" R related



call vundle#end()
filetype plugin indent on

" NERDTree
map <leader>t :NERDTreeTogglr<cr>
let NERDTreeAutoCenter=1
let NERDTreeShowHidden=1
let NERDTreeWinSize=35
let NERDTreeShowBookmarks=1

" vim-javascript
let javascript_enable_domhtmlcss = 1

inoremap µ <Space>%>%<Space><CR>

"================================================================================
" Using Templates
"================================================================================
nnoremap ,blog :-1read /Users/shuzhe/.vim/templates/pelican.md<CR>jA<C-r>=strftime('%Y-%m-%d<space>%H:%M')<CR><ESC>kA
