"--- vim ---
"set encofing UTF-8
set encoding=utf-8
set fenc=utf-8
"do not generate backup file like ~hoge.py set nobackup "do not generate swap file like hoge.py.swp set noswapfile "reflect changes if the opened file is changed by another person or processes. 
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
set tabstop=2
set shiftwidth=2
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
"move pre row
set bs=2

"activate syntax
syntax enable


"--- vim-plugin ---
call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'fatih/molokai'
Plug 'SirVer/ultisnips'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" vim-lsp
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
call plug#end()


"--- golang---
" formatting golang source
let g:go_fmt_command = "goimports"
" checking code
let g:go_metalinter_enabled =['vet','golint']
let g:go_metalinter_autosave = 1
let g:go_metalinter_deadline = "5s"
"auto hilights for identifier
let g:go_auto_sameids = 1
set autowrite
"keymap
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
"for :GoAlternate
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

" deopelete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

"--- vim-lsp ---
let g:lsp_async_completion = 1
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1

"--- UltiSnips(for glang) ---
let g:UltiSnipsExpandTrigger="<tab>"


"--- NERDTree ---
nnoremap <silent><C-e> :NERDTreeToggle<CR>


"--- control buffer ---
nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>


"--- vim-terraform ---
let g:terraform_align=1
let g:terraform_fmt_on_save=1


"--- vim-airline ---
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
