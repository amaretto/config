"ATTENSION"
"If you change this file, you should cp this file to ~/work/misc and commit

"set encofing UTF-8
set fenc=utf-8
"do not generate backup file like ~hoge.py
set nobackup
"do not generate swap file like hoge.py.swp
set noswapfile
"reflect changes if the opened file is changed by another person or processes. 
set autoread
"allow change buffers without any saves
set hidden
"show all command
set showcmd
"show line numbers
set number
"show cursored line
hi LineNr ctermbg=0 ctermfg=258
"hi CursorLineNr ctermfg=11 term=bold
set cursorline
"hi clear CursorLine
"show cursored column
set cursorcolumn
"allow cursor next to eol
set virtualedit=onemore
"use smart indent
set smartindent
"visualize beep
set visualbell
"show coresspond brackets
set showmatch
"show always status line 
set laststatus=2
"complete commands
set wildmode=list:longest
"visualize tab and eol
hi SpecialKey ctermfg=darkmagenta
set list
set listchars=eol:¬,tab:▸\ 
"set tabstop size
set tabstop=4
set shiftwidth=4
set expandtab
"ignore uppercase and lowercase when searching
set ignorecase
"take uppercase if user use uppercase when searching
set smartcase
"allow incremental search
set incsearch
"repeat search result
set wrapscan
"highlight searched words
set hlsearch

"activate syntax
syntax enable

"vim-plugin
call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go'
Plug 'fatih/molokai'
Plug 'SirVer/ultisnips'
call plug#end()

"--- golang---
" formatting golang source
let g:go_fmt_command = "goimports"
" checking code
let g:go_metalinter_enabled =['vet','golint','errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_deadline = "5s"
"Unfortunatory, vim-go hilights doesn't work on iTerm...
"let g:go_hilight_function = 1
"let g:go_hilight_methods = 1
"let g:go_hilight_structs = 1
"let g:go_hilight_types = 1
"let g:go_hilight_operators = 1
set autowrite
"keymap
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

"--- UltiSnips ---
let g:UltiSnipsExpandTrigger="<tab>"
