filetype plugin indent on	        " required
set nocompatible              	    " required
filetype off                  	    " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/plugins') "Path where Vundle should install plugins

	" let Vundle manage Vundle, required
	Plugin 'gmarik/Vundle.vim'

	" Automatic indent in python
	Plugin 'vim-scripts/indentpython.vim'

	" Auto-complete engine
	Bundle 'Valloric/YouCompleteMe'

	" Check the syntax in each save
	Plugin 'vim-syntastic/syntastic'

	" File browsing
	Plugin 'scrooloose/nerdtree'

	" Searching
	" ctrl + p start the search
	Plugin 'kien/ctrlp.vim'
    
    " Plugin auto-pair brackets
    Plugin 'jiangmiao/auto-pairs'

	" Using powerline statusbar
	" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
    Plugin 'powerline/powerline', {'rtp': 'powerline/powerline/bindings/vim/'}

    " Dracula theme
    Plugin 'dracula/vim', { 'name': 'dracula' }

"python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"    project_base_dir = os.environ['VIRTUAL_ENV']
"    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"    execfile(activate_this, dict(__file__=activate_this))
"EOF

" All of your Plugins must be added before the following line
call vundle#end()                   " required

set number		            	    " Show line number
set cursorline                	    " highlight current line
colorscheme dracula 		        " Defining theme
set mouse=a                         " Enable mouse 
set incsearch                       " Enable real-time search with /

" Powerline status bar
set rtp+=~/.vim/plugins/powerline/powerline/bindings/vim/
set laststatus=2                    " Always display the statusline in all windows
set showtabline=2                   " Always display the tabline, even if there is only one tab
set noshowmode                      " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set t_Co=256                        " Use 256 colours

" Syntax config
let python_highlight_all=1
syntax on

" Auto-complete window goes away when you’re done with it 
let g:ycm_autoclose_preview_window_after_completion=1
" defines a shortcut for goto definition. 
" By default <leader> is \
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Nerd Tree config
" Command to ignore some file types
" let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
map <leader>b :NERDTreeToggle<CR>

" Adding utf-8 support to files
set encoding=utf-8

" Flaggin unecessary whitespace
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Configuring for all files
set tabstop=4
set softtabstop=4
set expandtab

" Configuring python files
au BufNewFile,BufRead *.py
    \ set tabstop=4                 " number of visual spaces per TAB
    \ set softtabstop=4             " number of spaces in tab when editing 
    \ set shiftwidth=4 
    " \ set textwidth=79            " your line length doesn’t go beyond 80 characters
    \ set expandtab                 " tabs are spaces
    \ set autoindent
    \ set fileformat=unix           " store file in the unix mode

" Configuring js files
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" Integrating with virtualenv
" if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
" endif

" There is also a plugin called ftypes that will allow you to have a separate
" file for each filetype you want to maintain settings for, so use that if you see fit.
