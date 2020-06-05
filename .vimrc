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

"--- python ---
" デバッグ用設定
let g:lsp_log_verbose = 1  " デバッグ用ログを出力
let g:lsp_log_file = expand('~/.cache/tmp/vim-lsp.log')  " ログ出力のPATHを設定

" 言語用Serverの設定
augroup MyLsp
  autocmd!
  " pip install python-language-server
  if executable('pyls')
    " Python用の設定を記載
    " workspace_configで以下の設定を記載
    " - pycodestyleの設定はALEと重複するので無効にする
    " - jediの定義ジャンプで一部無効になっている設定を有効化
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': { server_info -> ['pyls'] },
        \ 'whitelist': ['python'],
        \ 'workspace_config': {'pyls': {'plugins': {
        \   'pycodestyle': {'enabled': v:false},
        \   'jedi_definition': {'follow_imports': v:true, 'follow_builtin_imports': v:true},}}}
        \})
    autocmd FileType python call s:configure_lsp()
  endif
augroup END
" 言語ごとにServerが実行されたらする設定を関数化
function! s:configure_lsp() abort
  setlocal omnifunc=lsp#complete   " オムニ補完を有効化
  " LSP用にマッピング
  nnoremap <buffer> <C-]> :<C-u>LspDefinition<CR>
  nnoremap <buffer> gd :<C-u>LspDefinition<CR>
  nnoremap <buffer> gD :<C-u>LspReferences<CR>
  nnoremap <buffer> gs :<C-u>LspDocumentSymbol<CR>
  nnoremap <buffer> gS :<C-u>LspWorkspaceSymbol<CR>
  nnoremap <buffer> gQ :<C-u>LspDocumentFormat<CR>
  vnoremap <buffer> gQ :LspDocumentRangeFormat<CR>
  nnoremap <buffer> K :<C-u>LspHover<CR>
  nnoremap <buffer> <F1> :<C-u>LspImplementation<CR>
  nnoremap <buffer> <F2> :<C-u>LspRename<CR>
endfunction
let g:lsp_diagnostics_enabled = 0  " 警告やエラーの表示はALEに任せるのでOFFにする
