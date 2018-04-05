# Set theme
colorscheme Tomorrow-Night

# Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Show “invisible” characters
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

" Respect modeline in files
set modeline
set modelines=4

set laststatus=2                      " Always show status line
set guifont=Menlo:h14                 " choose larger/nicer looking font for macvim
set expandtab                         " convert tabs to spaces
set showmatch                         " show matching parenthesis
set ruler                             " Show the cursor position
set title                             " Show the filename in the window titlebar
set hidden                            " hide buffers when opening new files, don't close them
set hlsearch                          " Highlight search terms
set incsearch                         " Highlight dynamically as pattern is typed
set ignorecase                        " Ignore case of searches
set autoindent                        " enable auto-indenting
set number                            " show line numbers
set tabstop=2                         " tab is 2 spaces
set shiftwidth=2                      " autoindent 2 spaces
set backspace=indent,eol,start        " Allow backspace in insert mode
set history=1000                      " Remember more history
set undolevels=1000                   " Allow more undo
set nowrap                            " Don't wrap lines
set visualbell                        " don't beep
set noerrorbells                      " don't beep

syntax on                             " Enable syntax highlighting
let mapleader=","                     " Change mapleader

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif
