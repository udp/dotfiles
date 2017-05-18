
set shell=bash\ --login

set nocompatible
filetype off

set encoding=utf-8

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

filetype off

Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdtree'
Plugin 'marijnh/tern_for_vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-abolish'
Plugin 'flazz/vim-colorschemes'


Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'Shougo/vimproc.vim'
Plugin 'Valloric/YouCompleteMe'


"Plugin 'clausreinke/typescript-tools.vim'
Plugin 'digitaltoad/vim-jade'

call vundle#end()

filetype plugin indent on
syntax on

if !exists("g:ycm_semantic_triggers")
   let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

set noswapfile nobackup             " disable annoying swap files
set nowrap nolbr                    " disable text wrapping
set autowrite                       " autosave when switching file
set modeline                        " enable modeline support
set scrolloff=5                     " minimum lines visible above/below current
set formatoptions-=cro              " disable automatic comment continuation
set number                          " line numbers
set cursorline                      " highlight current line
set colorcolumn=80                  " color column 80
set guicursor+=a:blinkon0           " disable cursor blink
set laststatus=2                    " always show the status line

" use system clipboard for yanking and pasting
"
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    set clipboard+=unnamed
  else
    set clipboard+=unnamedplus
  endif
else
  set clipboard+=unnamedplus
endif

" keep our place in files in the ~/.viminfo cache
"
set viminfo='10,\"100,:20,%,n~/.viminfo

" indent options
"
set expandtab          " use spaces instead of tabs
set ts=4 sw=4 sts=4    " default to four space tab
"set cinkeys-=0#        " do not move # to column zero (cindent)

" do not move # to column zero (smartindent)
"
"inoremap # X^H#

" don't use soft tabs for makefiles or jade templates
"
autocmd FileType make setlocal noexpandtab
autocmd FileType jade setlocal noexpandtab

" F5 for :make
"
nnoremap <F5> :make<CR>

" F6 for :make clean all
"
nnoremap <F6> :make clean all<CR>

" hide GUI toolbar and menu
"
if has("gui_running")
    set guioptions-=T
    set guioptions-=m
endif

" disable the middle mouse button (I have a habit of clicking while scrolling)
"
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>
map <2-MiddleMouse> <Nop>
imap <2-MiddleMouse> <Nop>
map <3-MiddleMouse> <Nop>
imap <3-MiddleMouse> <Nop>
map <4-MiddleMouse> <Nop>
imap <4-MiddleMouse> <Nop>

" Ctrl + arrow keys to move between splits (command mode)
"
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j

" Ctrl + arrow keys to move between splits (insert mode)
"
inoremap <silent> <C-Right> <Esc><c-w>l
inoremap <silent> <C-Left> <Esc><c-w>h
inoremap <silent> <C-Up> <Esc><c-w>k
inoremap <silent> <C-Down> <Esc><c-w>j

" Ctrl + shift + arrow keys to move splits (command mode)
"
nnoremap <silent> <C-S-Right> <C-W>L
nnoremap <silent> <C-S-Left> <C-W>H
nnoremap <silent> <C-S-Up> <C-W>K
nnoremap <silent> <C-S-Down> <C-W>J

" Ctrl + shift + arrow keys to move splits (insert mode)
"
inoremap <silent> <C-S-Right> <Esc><C-W>L
inoremap <silent> <C-S-Left> <Esc><C-W>H
inoremap <silent> <C-S-Up> <Esc><C-W>K
inoremap <silent> <C-S-Down> <Esc><C-W>J

" NERDTree settings
"
let g:NERDTreeChDirMode=2         " make NERDTree dir the working directory
let g:NERDTreeMouseMode=3         " single click to open nodes
let g:NERDTreeDirArrows=1         " use unicode arrows instead of + and -
let g:NERDTreeMinimalUI=1         " hide help text
let g:NERDTreeIgnore=['\.o$']     " ignore object files

" Taken from https://github.com/carlhuda/janus/blob/master/janus/vim/tools/janus/after/plugin/nerdtree.vim
" Pins NERDTree to the left hand side
"
augroup AuNERDTreeCmd
autocmd AuNERDTreeCmd FocusGained * call s:UpdateNERDTree()
augroup END

function! s:UpdateNERDTree(...)
  let stay = 0

  if(exists("a:1"))
    let stay = a:1
  end

  if exists("t:NERDTreeBufName")
    let nr = bufwinnr(t:NERDTreeBufName)
    if nr != -1
      exe nr . "wincmd w"
      exe substitute(mapcheck("R"), "<CR>", "", "")
      if !stay
        wincmd p
      end
    endif
  endif
endfunction

autocmd FileType qf wincmd J

" GUI font setting
"
"set guifont=9x15:h15
"set guifont=Monaco:h11

"colorscheme mustang
colorscheme desert

"if matchstr(&guifont, "Powerline") == "Powerline"
    "let g:airline_powerline_fonts=1
"else
    "set guifont=Menlo:h11
"endif

let g:airline#extensions#fugitive#enabled = 1
let g:airline#extensions#syntastic#enabled = 0


" YCM settings
"
let g:ycm_confirm_extra_conf=0
let g:ycm_enable_diagnostic_signs=0                                             
let g:ycm_enable_diagnostic_highlighting=0                                      
"let g:ycm_always_populate_location_list=0    


"set conceallevel=2

" vim-javascript settings
"
"let g:javascript_conceal=1
"let g:javascript_conceal_function="ƒ"

autocmd! AuNERDTreeCmd FocusGained

set nospell





