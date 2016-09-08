set nocompatible
set encoding=utf-8
syntax enable
syntax on
filetype plugin indent on
colorscheme torte
set hlsearch
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set expandtab
inoremap <S-Tab> <C-D>
set showmatch

set guifont=Source\ Code\ Pro\ 10
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Source\ Code\ Pro\ 10
  elseif has("gui_macvim")
    set guifont=Source\ Code\ Pro:h14
  elseif has("gui_win32")
    set guifont=Source\ Code\ Pro:h9
  endif
endif

"To auto save & load folds
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview
set directory=$HOME\vswaps//

iab <expr> dts strftime("%FT%T%z")
iab <expr> dte strftime("%Y-%m-%dT%H:%M:%S-06:00")
"iab <expr> dts strftime("%a, %d %b %Y %H:%M:%S %Z")

"au BufRead,BufNewFile *.hbt set filetype=html syntax=html
"au BufRead,BufNewFile *.hbt set syntax=mustache
au  BufNewFile,BufRead *.handlebars,*.hbs,*.hbt set filetype=html.handlebars syntax=mustache | runtime! ftplugin/mustache.vim ftplugin/mustache*.vim ftplugin/mustache/*.vim
"
au BufRead,BufNewFile *.md set filetype=markdown

"runtime macros/matchit.vim

map ,v :w<CR>:!node index.js<CR>

" vim-plug (https://github.com/junegunn/vim-plug)
call plug#begin('~/.vim/plugged')

" vim-mustache-handlebars syntax+
Plug 'https://github.com/mustache/vim-mustache-handlebars.git'

Plug 'godlygeek/tabular'
Plug 'https://github.com/plasticboy/vim-markdown.git'

"Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'reedes/vim-pencil'
Plug 'reedes/vim-wordy'
"Plug 'reedes/vim-colors-pencil'

" Using my customization colors for pencil instead:
Plug 'patdavid/vim-colors-pencil'

" Include Solarized colorscheme
Plug 'https://github.com/altercation/vim-colors-solarized.git'

Plug 'https://github.com/othree/html5.vim.git'

" Fullscreen experiments
"Plug 'lambdalisue/vim-fullscreen'
Plug 'ruedigerha/vim-fullscreen'

Plug 'nelstrom/vim-markdown-folding'

" Loading html-autoclosetag from my repo:
Plug 'https://gitlab.com/patdavid/vim-html-autoclosetag.git'

" Testing CSApprox for GVim colors in a terminal (tmux)
Plug 'https://github.com/godlygeek/csapprox.git'

" XML.vim
Plug 'https://github.com/othree/xml.vim.git'


call plug#end()

" Distraction-free writing mode:
"   based on advice from: http://tlattimore.com/blog/distraction-free-writing-in-vim/

" :Goyo (https://github.com/junegunn/goyo.vim)
" :SoftPencil (https://github.com/reedes/vim-pencil)
" to remove vert scrollbar: set guioptions-=r

" to set pencil color scheme: colorscheme pencil
"       to toggle light/dark: set background=(light|dark)
" (https://github.com/reedes/vim-colors-pencil)

" to follow url under cursor: 'gx'

" Limelight to focus on current writing
" `Limelight [0.0 ~ 1.0] - Turn it on
" `Limelight! - turn it off
" `Limelight!! [0.0 ~ 1.0] - toggle Limelight

function! s:goyo_enter()
    SoftPencil
    " set linespace=3
    set linespace=5
    set guifont=Cousine:h14
    if has("gui_running")
      if has("gui_gtk2")
        set guifont=Cousine\ 14
      elseif has("gui_macvim")
        set guifont=Cousine:h14
      elseif has("gui_win32")
        set guifont=Cousine:h9
      endif
    endif
    set guioptions-=r
    colorscheme pencil
    let g:vim_markdown_frontmatter = 1
    let g:vim_markdown_folding_disabled = 1
    "Limelight 0.7
    if has("gui_running")
        " Hide menu bar 
        set guioptions-=m
        " Hide toolbar
        set guioptions-=T
    endif
    edit
endfunction

function! s:goyo_leave()
    set linespace=0
    set guifont=Source\ Code\ Pro:h12
    set guifont=Source\ Code\ Pro\ 10
    if has("gui_running")
      if has("gui_gtk2")
        set guifont=Source\ Code\ Pro\ 10
      elseif has("gui_macvim")
        set guifont=Source\ Code\ Pro:h14
      elseif has("gui_win32")
        set guifont=Source\ Code\ Pro:h9
      endif
    endif
    colorscheme torte
    Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" vim-mustache-handlebars
let g:mustache_abbreviations = 1

" If you really want your head to explode
" try setting line numbers + relative numbers:
"
" set number
" set relativenumber
"
" you'll thank me later on...
