set nocompatible              " be iMproved, required

" Disable match paren (which is slow (c) biggena)
let loaded_matchparen = 1

" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
" across (heterogeneous) systems easier.
if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after

  " source $VIMRUNTIME/vimrc_example.vim
  " source $VIMRUNTIME/mswin.vim
  " behave mswin

  set diffexpr=MyDiff()
  function! MyDiff()
		  let opt = '-a --binary '
		  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
		  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
		  let arg1 = v:fname_in
		  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
		  let arg2 = v:fname_new
		  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
		  let arg3 = v:fname_out
		  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
		  let eq = ''
		  if $VIMRUNTIME =~ ' '
				  if &sh =~ '\<cmd'
						  let cmd = '""' . $VIMRUNTIME . '\diff"'
						  let eq = '"'
				  else
						  let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
				  endif
		  else
				  let cmd = $VIMRUNTIME . '\diff'
		  endif
		  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
  endfunction

endif


if has("gui_running")
    if has ('win32')
        set guifont=Consolas:h11:cANSI
    else
        set guifont=Ubuntu\ Mono\ 12
        " set guifont=Monospace\ Regular\ 11
        " set guifont=Inconsolata\ 11
        " set guifont=Consolas\ 12
    endif
else
" терминал?
  " Enable mouse control in console (selects, clicks etc)
  set mouse=a
endif



filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'


"---------=== Code/project navigation ===-------------
Plugin 'scrooloose/nerdtree' 	    	" Project and file navigation
Plugin 'majutsushi/tagbar'          	" Class/module browser
" Plugin 'goldfeld/vim-seek'              " Seep monition (like f, but it expects two characters to be typed). Use 's'
Plugin 'justinmk/vim-sneak'             " Jump to any location specified by two characters (multi-line)


"------------------=== Other ===----------------------
Plugin 'bling/vim-airline'   	    	" Lean & mean status/tabline for vim
"Plugin 'fisadev/FixedTaskList.vim'  	" Pending tasks list
"Plugin 'rosenfeld/conque-term'      	" Consoles as buffersgvim
Plugin 'tpope/vim-surround'	   	" Parentheses, brackets, quotes, XML tags, and more
Plugin 'scrooloose/nerdcommenter'       " Easy commenting of lines, blockes
Plugin 'kien/ctrlp.vim'                 " Ctrl-P (Fuzzy search by filename)

" Plugin 'xolox/vim-misc'                 " Vim misc (required by Vim Sessions)
" Plugin 'xolox/vim-session'              " Vim Sessions
" Plugin 'jlanzarotta/bufexplorer'        " BufExplorer
" Plugin 'terryma/vim-multiple-cursors'   " Multiple cursors like in SublimeText (use Ctrl+n)
Plugin 'Shougo/vimproc.vim'             " Vimproc plugin (required by Unite.vim)
Plugin 'Shougo/unite.vim'               " Unite.vim plugin
" Plugin 'tsukkee/unite-tag'              " Support searching in tags for Unite.vim (c) it is disabled because it is VEEERY slow

Plugin 'rking/ag.vim'                   " Ag (The Silver Searcher)
"--------------=== Snippets support ===---------------
" Plugin 'garbas/vim-snipmate'		" Snippets manager
"Plugin 'MarcWeber/vim-addon-mw-utils'	" dependencies #1
"Plugin 'tomtom/tlib_vim'		" dependencies #2
" Plugin 'honza/vim-snippets'		" snippets repo

"---------------=== Languages support ===-------------
" --- Python ---
Plugin 'klen/python-mode'	        " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
" Plugin 'davidhalter/jedi-vim' 		" Jedi-vim autocomplete plugin (Edit:
" this plugin has performance issue. It makes VIM slow because it adds itself
" to autocmd CursortMovedI many times)
Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim

Plugin 'matze/vim-ini-fold'         " Fold expression for ini-like files

"Plugin 'pangloss/vim-javascript'    " Javascript syntax and formatting (it seems this plugin causes issue with VIM, mode cannot be changed (c) biggena. Or may be this is the next plugin?)
Plugin 'nathanaelkane/vim-indent-guides'  " Visually display indent levels (use <leader>ig to toggle)

" --- CSS, LESS ---
Plugin 'groenewege/vim-less'       " Syntax highlight for LESS
" Plugin 'skammer/vim-css-color'     " Display CSS color inline

" --- Javascript ---
" Plugin 'wookiehangover/jshint.vim'  " Javascript syntax checker (Edit: it doesn't work. When throws VIM error 'Function call depth is higher than 'maxfuncdepth'' (c) biggena
" Plugin 'Shutnik/jshint2.vim'          " (Edit: it doesn't work on Windows because it incorrectly calls shell commands)
Plugin 'scrooloose/syntastic.git'


" All of your Plugins must be added before the following line
call vundle#end()            " required



filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line




"=====================================================
" General settings
"=====================================================
" Vim will change into the folder of the file of the buffer
" set autochdir

set backspace=indent,eol,start
"aunmenu Help.
"aunmenu Window.
let no_buffers_menu=1
set mousemodel=popup

set autoread         " Automatically re-load file if it was changed outside of VIM (and there are no non-saved changes in VIM). This works only in GUI version.

" -----------------------------------------
" Display invisible characters.
" -----------------------------------------
" Usage:
"   :set list 
"   :set list!
" Enter the Pilcrow mark by pressing Ctrl-k then PI
" Enter the middle-dot by pressing Ctrl-k then .M
" Enter the right-angle-quote by pressing Ctrl-k then >>
" set listchars=eol:¶,tab:,trail:~,extends:>,precedes:<
set listchars=eol:¶,tab:»·,trail:·,extends:>,precedes:<
" set listchars=eol:¶,tab:>-,trail:~,extends:>,precedes:<

" Resolving perfomance problems (edit: it seems it has no effect)
" SRC: http://vim.wikia.com/wiki/Highlight_unwanted_spaces
" if version >= 702
  " autocmd BufWinLeave * call clearmatches()
" endif


" ------------------
" Auto wrap
" ------------------
set textwidth=0     " Disable auto wrap of text on 80 column
set wrapmargin=0

" -----------------------------------------
" Map <leader> character to comman (,)
" -----------------------------------------
let mapleader=","
noremap \ ,

" Bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" map <c-j> <c-w>j
" map <c-k> <c-w>k
" map <c-l> <c-w>l
" map <c-h> <c-w>h
" nnoremap <C-Up> :m .-2<CR>==
" nnoremap <C-Down> :m .+1<CR>==
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j
" Use Ctrl+Tab to move between windows
map <C-Tab> <c-w>w

" -----------------------------------------
" Unite configuration
" -----------------------------------------
" let g:unite_source_history_yank_enable = 1
" let g:unite_winheight = 10
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#filters#matcher_default#use(['matcher_fuzzy'])
" nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
" nnoremap <leader>t :<C-u>Unite -buffer-name=files   -start-insert file_rec/async:!<cr>
" nnoremap <leader>f :<C-u>Unite -buffer-name=files   -start-insert file_rec/async<cr>
" nnoremap <leader>f :<C-u>Unite -buffer-name=files   -start-insert file_rec<cr>
" nnoremap <leader>f :<C-u>Unite -buffer-name=files   -start-insert buffer file_rec<cr>
" nnoremap <leader>r :<C-u>Unite -buffer-name=mru     -start-insert file_mru<cr>
" nnoremap <leader>o :<C-u>Unite -buffer-name=outline -start-insert outline<cr>
" nnoremap <leader>y :<C-u>Unite -buffer-name=yank    history/yank<cr>
nnoremap <leader>b :<C-u>Unite -buffer-name=buffer  buffer<cr>

" Search recursively in files (super search)
" nnoremap <space>/ :Unite -silent -auto-preview vimgrep:**:<CR>
" nnoremap <silent> <leader>ss :Unite -silent vimgrep:**:<CR>
" nnoremap <silent> <leader>ss :Unite -silent grep:**:<CR>
" nnoremap <silent> <leader>ss :Unite -no-split -toggle -silent -auto-preview -buffer-name=filesearch grep:.<CR>
nnoremap <silent> <leader>ss :Unite -no-quit -toggle -silent -auto-highlight -buffer-name=filesearch grep:.<CR>

nnoremap <silent> <leader>sv :Unite -silent vimgrep:\c**:<CR>

" Search in current file (search local)
nnoremap <silent> <leader>sl :Unite -no-quit -silent -toggle -auto-resize -auto-highlight -buffer-name=search vimgrep:%:<CR>

" Use ag for search
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--line-number --smart-case --nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
endif

" Src: https://github.com/Shougo/vimproc.vim/issues/150
" let g:unite_source_rec_async_command = 'ag --follow --nocolor --nogroup --hidden -g ""'

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  " let b:SuperTabDisabled=1

  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)

  " Use <C-x>, <C-v> to open file in horizontall or vertical split
  " Use <C-t> to open file in new tab
  imap <silent><buffer><expr> <C-x> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
  
  " Toggle preview window when press <C-r>
  nnoremap <silent><buffer><expr> <C-p>
	          \ empty(filter(range(1, winnr('$')),
	          \ 'getwinvar(v:val, "&previewwindow") != 0')) ?
	          \ unite#do_action('preview') : ":\<C-u>pclose!\<CR>"

  " Use ESC to close Unite window
  nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction

" =============================================
" CtrlP configuration
" =============================================
"
let g:ctrlp_match_window = 'bottom,order:ttb,min:3,max:10,result:10'
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_extensions = ['tag', 'buffertag']
" Search in tags
nnoremap <leader>t :<C-u>CtrlPTag<cr>
" Search in tags of all opened buffers
nnoremap <leader>st :<C-u>CtrlPBufTagAll<cr>

" On Windows copy/paste directly to system clipboard instead of * register
set clipboard=unnamed

set ruler
set completeopt-=preview
set gcr=a:blinkon0
" if has("gui_running")
  set cursorline
" endif
set ttyfast

" включить подсветку кода
syntax on
if has("gui_running")
" GUI? устаналиваем тему и размер окна
  "set lines=50 columns=125
  "colorscheme molokai
" раскомментируйте эти строки, если хотите, чтобы NERDTree/TagBar автоматически отображались при запуске vim
" autocmd vimenter * TagbarToggle
" autocmd vimenter * NERDTree
" autocmd vimenter * if !argc() | NERDTree | endif

  set background=dark
  colorscheme solarized 
  let g:solarized_contrast = "high"

else
" терминал?
  "colorscheme myterm
  " colorscheme molokai

  if has ('unix')
    " This assumes that terminal emulator itself uses theme solarized
	" Otherwise it will not work
    set background=dark
    let g:solarized_contrast = "high"
    " set t_Co=256
    " let g:solarized_termcolors=256
    colorscheme solarized 
  else
    colorscheme molokai
  endif

"  colorscheme desert
endif

"tab sball
set switchbuf=useopen

" отключаем пищалку и мигание
set visualbell t_vb= 
set novisualbell       

set enc=utf-8	     " utf-8 по дефолту в файлах
set ls=2             " всегда показываем статусбар
set incsearch	     " инкреминтируемый поиск
set hlsearch	     " подсветка результатов поиска
set ignorecase       " Ignore case in search
set smartcase        " ignore case in search if there are no CAPITAL letter in search term
set nu	             " показывать номера строк
set scrolloff=5	     " 5 строк при скролле за раз

" отключаем бэкапы и своп-файлы
set nobackup 	     " no backup files
set nowritebackup    " only in case you don't want a backup file while editing
set noswapfile 	     " no swap files

" прячем панельки
set guioptions-=m   " меню
set guioptions-=T    " тулбар
"set guioptions-=r   "  скроллбары

" настройка на Tab
set smarttab
set tabstop=4

"  при переходе за границу в 80 символов в Ruby/Python/js/C/C++ подсвечиваем на темном фоне текст
" augroup vimrc_autocmds
"     autocmd!
"     autocmd FileType ruby,python,javascript,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
"     autocmd FileType ruby,python,javascript,c,cpp match Excess /\%80v.*/
"     autocmd FileType ruby,python,javascript,c,cpp set nowrap
" augroup END

" указываем каталог с настройками SnipMate
" let g:snippets_dir = "~/.vim/vim-snippets/snippets"

" настройки Vim-Airline
set laststatus=2
let g:airline_theme='badwolf'
if has("gui_running")
		let g:airline_powerline_fonts = 0 
else
		let g:airline_powerline_fonts = 0 
endif
let g:airline#extensions#tabline#enabled = 0
" let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#whitespace#enabled = 0

" TagBar настройки
map <F4> :TagbarToggle<CR>
" let g:tagbar_autofocus = 0 " автофокус на Tagbar при открытии
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0 "tagbar shows tags in order of they created in file
let g:tagbar_foldlevel = 0 "close tagbar folds by default

" NerdTree настройки
" показать NERDTree на F3
map <F3> :NERDTreeToggle<CR>
"игноррируемые файлы с расширениями
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']  

" TaskList настройки
" map <F2> :TaskList<CR> 	   " отобразить список тасков на F2

" Работа буфферами
map <C-q> :bd<CR> 	   " CTRL+Q - закрыть текущий буффер

" By pressing * highlight all occurances of the current word instead of
" jumping to the next. Jumping is possible with 'n'
" nnoremap * *N

" These work like * and g*, but do not move the cursor and always set hls.
map <Leader>* :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<C-M>
map <Leader>g* :let @/ = expand('<cword>')\|set hlsearch<C-M>

" User Ctrl+F8 for switching OFF the highlight
nnoremap <C-F8> :nohlsearch<CR>

" The following mappings in your vimrc provide a quick way to move lines of text up or down. 
" nnoremap <C-Up> :m .-2<CR>==
" nnoremap <C-Down> :m .+1<CR>==
" inoremap <C-Down> <Esc>:m .+1<CR>==gi
" inoremap <C-Up> <Esc>:m .-2<CR>==gi
" vnoremap <C-Down> :m '>+1<CR>gv=gv
" vnoremap <C-Up> :m '<-2<CR>gv=gv

""" NERDCommenter
"let NERDCreateDefaultMappings=0 " disable default mappings
let NERDMenuMode=0              " disable menu
let NERDSpaceDelims=1           " place spaces after comment chars
let NERDDefaultNesting=0        " don't recomment commented lines


let NERDTreeIgnore=['^__pycache__$[[dir]]']


" Quickly Traverse Vim's Lists (from https://github.com/tpope/vim-unimpaired
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>
nnoremap <silent> [Q :cfirst<CR>
nnoremap <silent> ]Q :clast<CR>

nnoremap <silent> [l :lprevious<CR>
nnoremap <silent> ]l :lnext<CR>
nnoremap <silent> [L :lfirst<CR>
nnoremap <silent> ]L :llast<CR>

nnoremap <silent> [t :tprevious<CR>
nnoremap <silent> ]t :tnext<CR>
nnoremap <silent> [T :tfirst<CR>
nnoremap <silent> ]T :tlast<CR>

" Vim Sessions (use :SaveSession <name> and :OpenSession <name>)
:let g:session_autosave = 'yes'

" Ctags
:nnoremap <f5> :!ctags -R<CR>


"=====================================================
" Python-mode settings
"=====================================================
let g:pymode_python = 'python3' 
" отключаем автокомплит по коду (у нас вместо него используется jedi-vim)
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

" документация
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'
" проверка кода
let g:pymode_lint = 1
let g:pymode_lint_checker = "pylint,pep8"
let g:pymode_lint_ignore="E501,W601,C0110,E712,W391,W0401"
" Show error message if cursor placed at the error line
let g:pymode_lint_message = 0
" провека кода после сохранения
let g:pymode_lint_write = 1

" поддержка virtualenv
let g:pymode_virtualenv = 1

" установка breakpoints
let g:pymode_breakpoint = 0
" let g:pymode_breakpoint_key = '<leader>b'

" подстветка синтаксиса
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" отключить autofold по коду
let g:pymode_folding = 0

" возможность запускать код
let g:pymode_run = 0

" Disable choose first function/method at autocomplete
let g:jedi#popup_select_first = 0


"=====================================================
" Syntastic settings
"=====================================================
" Note, it requires node.js + jshint installed globally
"   Install jshint globally: 'npm install jshint -g'
let g:syntastic_jslint_checkers=['jshint']
" let g:syntastic_check_on_open=1
" let g:syntastic_enable_signs=1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5

" Disable Syntastic on python files because 'pymode' checks the syntax
autocmd FileType python let g:syntastic_check_on_wq = 0


"=====================================================
" Languages support
"=====================================================
"
" Tab/spaces help
" :set expandtab       - VIM will insert space characters whenevr the tab key is pressed
" :set tabstop=4       - The number of spaces that will be inserted when Tab key is pressed
" :set shiftwidth=4    - The number of space characters inserted for indentation
"
" Helpful commands:
" :retab          - Change all existing tab characters to spaces
"
"
set wildignore+=*.so,*.a,*.o,*.pyc


set autoindent

" --- Python ---
"autocmd FileType python set completeopt-=preview " раскомментируйте, в случае, если не надо, чтобы jedi-vim показывал документацию по методу/классу
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 textwidth=0
\ formatoptions+=croq softtabstop=4 cindent
\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
" autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with


" --- JavaScript ---
let javascript_enable_domhtmlcss=1
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType javascript setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd BufNewFile,BufRead *.json setlocal ft=javascript

" --- HTML ---
" autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" --- VIM ---
autocmd FileType vim setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" --- CPP ---
autocmd FileType cpp setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" ---- automake ---
autocmd FileType automake setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4


" --- template language support (SGML / XML too) ---
autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako,less,css setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd bufnewfile,bufread *.rhtml setlocal ft=eruby
autocmd BufNewFile,BufRead *.mako setlocal ft=mako
autocmd BufNewFile,BufRead *.tmpl setlocal ft=htmljinja
autocmd BufNewFile,BufRead *.py_tmpl setlocal ft=python
let html_no_rendering=1
let g:closetag_default_xml=1
let g:sparkupNextMapping='<c-l>'
autocmd FileType html,htmldjango,htmljinja,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako source ~/.vim/scripts/closetag.vim

" --- CSS ---
" autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" --- MiaRec trace files ---
au BufRead,BufNewFile *.log setfiletype miarec_trace
