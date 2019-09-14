source $vimruntime/vimrc_example.vim
"source $vimruntime/mswin.vim

set spell spelllang=en_us
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $vimruntime =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let L:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $vimruntime . '\diff"'
    else
      let cmd = substitute($vimruntime, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $vimruntime . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('L:shxq_sav')
    let &shellxquote=L:shxq_sav
  endif
endfunction

"================================================================================
" Vundle 
"================================================================================
filetype off    "required
set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
call vundle#begin('$VIM/vimfiles/bundle/')
"let Vundle manage vundle, required
Plugin 'VundleVim/Vundle.vim'
"my bundle plugin
Plugin 'altercation/vim-colors-solarized' "solarized color scheme
" Plugin 'jnurmine/zenburn' "zenburn color scheme
" Plugin 'scrooloose/nerdtree' "tree-view file manager
" Plugin 'jistr/vim-nerdtree-tabs'
" Plugin 'xuyuanp/nerdtree-git-plugin' "add git status to nerdtree
Plugin 'valloric/youcompleteme' "complete codes
Plugin 'w0rp/ale' "check syntax
Plugin 'tpope/vim-fugitive' "integrate git command
Plugin 'plasticboy/vim-markdown'
Plugin 'godlygeek/tabular' " for TableFormat command in vim-markdown plugin

" R related plugins
Plugin 'jalvesaq/Nvim-R' " swissknife for vim and R communication
" Plugin 'Shougo/unite.vim' " for citation using citation.vim
Plugin 'jalvesaq/zotcite'   " for citation integration with zotero used in rmarkdown
" Plugin 'rafaqz/citation.vim' " for citation used anywhere in md or rmd files
Plugin 'chrisbra/csv.vim' " for viewing data directly in vim R (Nvim-R)
Plugin 'junegunn/goyo.vim' " for nice zoom effect when editing
"  snippet framework 
Plugin 'ncm2/ncm2' " snippet engine
Plugin 'roxma/nvim-yarp' " dependency
Plugin 'gaalcaras/ncm-R' " snippets
Plugin 'ncm2/ncm2-ultisnips' " ncm and ultisnips integration
Plugin 'sirVer/Ultisnips' " snippet engine
Plugin 'roxma/vim-hug-neovim-rpc' " for Vim8
Plugin 'lervag/vimtex' " for better Rnoweb support (LaTeX complition)

call vundle#end()
filetype plugin indent on

"================================================================================
" Plugin specific setting
"================================================================================
"nerdtree: tree view file manager
" map <leader>t :NERDTreeToggle<cr>    
" let NERDTreeShowLineNumbers=1       " show row number
" let NERDTreeAutoCenter=1
" let NERDTreeShowHidden=1            " whether show hidden files
" let NERDTreeWinSize=35              " set width
" let g:nerdtree_tabs_open_on_console_startup=1  " when run vim in terminal, share nerdtree
" let NERDTreeIgnore=['\.pyc','\~$','\.swp']     " ignore file types
" let NERDTreeShowBookmarks=1                    " show bookmarks

"youcompleteme
let g:ycm_autoclose_preview_window_after_completion=1 "the window will not hidden when operation finished
"shortcut for jump to definition
map <leader>g :ycmcompleter GoToDefinitionElseDeclaration<cr> 

"w0rp/ale
let g:ale_fix_on_save=1
let g:ale_completion_enabled=1
let g:ale_sign_column_always=1
let g:airline#extensions#ale#enabled=1

"vim-markdown
let g:vim_markdown_folding_disabled = 1 " disable the default folding
let g:vim_markdown_new_list_item_indent = 0 " disable the auto-indent of the bullet
let g:vim_markdown_toc_autofit = 1 " auto-fit the size of toc.
let g:vim_markdown_math = 1 " enable the $ for math content
let g:vim_markdown_frontmatter = 1 " highlight YAML front matter as used by Jekyll or Hugo
let g:vim_markdown_autowrite = 1 " auto save the file when use `ge` to follow a link
let g:vim_markdown_no_extensions_in_markdown = 1 " do not require '.md' in the link name when using `ge` to follow a linked markdown file. For GitLab and GitHub wiki repository.
let g:vim_markdown_edit_url_in = 'tab' " open a linked file in a new tab instead of current buffer


"================================================================================
" Basic setting
"================================================================================
" set encoding method
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936

" deal with garbled menu of vim
source $vimruntime/delmenu.vim
source $vimruntime/menu.vim

" deal with garbled in vim message
language messages zh_cn.utf-8

" interface setting
set background=dark
if has('gui_running')
  let g:solarized_termcolors=256
else
  let g:solarized_termcolors=16
endif
colorscheme solarized

set helplang=en               "set english help
set history=500               "reserve 500 history records
set guifont=consolas:h10      "font
set tabstop=4                 "tab jumping space
set expandtab
set backspace=2               "enable backspace key
set nu!                       "show row numbers
set wrap                      "wrap words inside window
"set nowrap
set linebreak                 "don't break word when setting as wrap
"set list                     "show tabula symbol
set autochdir                 "set editing directory as current dir
"set hidden                   "hide no saved buffer, don't show 'save current buffer' when switching buffer
set scrolloff=5               "when curse getting close to botom/top, automatically scroll down/up
set showtabline=2             "show tab list
set autoread                  "if file is modified external, automatically reread the file
set mouse=a                   "enable mouse under all modes
set nobackup                  "don't generate backup file
set go=                       "drop graphical buttons

"toggle menu and toolbar
set guioptions-=m            "hide menu
set guioptions-=t            "hide toolbar

" searching and substitute
set hlsearch                  "highlight searching results
set incsearch                 "incremental searching
set path+=**                  "enable to search all children pathes
set wildmenu                  "Disply all matching files when we tab complete

"coding
syntax enable                 "highlight syntax
syntax on                     "turn on syntax highlight
set showmatch                 "show matched brackets, quotes
" set smartindent               "smartly indent
set cursorline                "using cursor line
"set cursorcolumn             "using cursor column
set guicursor+=a:blinkon0     "set cursor do not blink
"set fdm=indent                "automatically toggle coding region according to indentation

"================================================================================
" File type specific setting
"================================================================================
filetype on

" R
" Automatically start R when .R or .Rmd file open and only starts once
autocmd FileType r if string(g:SendCmdToR) == "function('SendCmdToR_fake')" | call StartR("R") | endif
" Make R vertical split at start
let R_rconsole_width = 57
let R_min_editor_width = 18

" RMarkdown
au BufNewFile,BufRead *.Rmd set filetype=rmd

autocmd FileType markdown 
  nmap <leader>p :call mdip#MarkdownClipboardImage()
  nmap sc RDSendChunk
  
"JavaScript
au BufRead *.js 
  set makeprg=jslint\ %
au FileType javascript
  setlocal shiftwidth=2
  setlocal tabstop=2
  setlocal softtabstop=2
  setlocal expandtab

" Markdown
au BufNewFile,BufRead *.md
  setlocal shiftwidth=2
  setlocal softtabstop=2
  setlocal tabstop=2
  setlocal expandtab
" leader + p to paste image into markdown
autocmd FileType rmd nmap <leader>p :call mdip#MarkdownClipboardImage()

" HTML
au FileType html,xhtml,xml,css
  setlocal expandtab
  setlocal shiftwidth=2
  setlocal softtabstop=2
  setlocal tabstop=2

"python coding setting (pep8)
au FileType python 
  setlocal expandtab
  setlocal shiftwidth=4
  setlocal softtabstop=4
  setlocal tabstop=4
  setlocal smartindent
  setlocal foldmethod=indent
  setlocal fileformat=unix
  setlocal textwidth=79
"mark unnecessary spaces in file
au BufNewFile,BufRead *.py,*.pyw,*.c,*.h match badwhitespace /\s\+$/
"python with virtualenv support
py3 << eof
import os
import sys
if 'virtual_env' in os.environ:
    project_base_dir = os.environ['virtual_env']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
eof
"highlight python syntax
let python_highlight_all=1

"================================================================================
" Debug setting
"================================================================================
"automatically run code with f5
map <f5> :call CompileRunGcc()<cr>
func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'cpp'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'java'
                exec "!javac %"
                exec "!time java %<"
        elseif &filetype == 'sh'
                :!time bash %
        elseif &filetype == 'python'
                exec "!clear"
                exec "!time python3.7 %"
        elseif &filetype == 'html'
                exec "!firefox % &"
        elseif &filetype == 'go'
                " exec "!go build %<"
                exec "!time go run %"
        elseif &filetype == 'mkd'
                exec "!~/.vim/markdown.pl % > %.html &"
                exec "!firefox %.html &"
        endif
endfunc

"set breakpoint in python code with shortcut / + b
map <leader>b oimport ipdb;ipdb.set_trace()<esc>

"Set netrw
let g:netrw_banner=0     "disable banner
let g:netrw_browse_split=4 "open in prior window
let g:netrw_altv=1         "open splits to the right
let g:netrw_liststyle=3    "tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
