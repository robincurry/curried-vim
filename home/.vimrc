call pathogen#runtime_append_all_bundles()

syntax on
filetype plugin indent on
set hidden
set tabstop=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab
set number
set cursorline
set list
set history=1000
set wildmenu
set wildmode=list:longest
set scrolloff=3
set visualbell

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

let mapleader = ","

" NERDTree configuration
let NERDTreeWinPos="right"
nmap <silent> <leader>f :NERDTreeToggle<CR>

" Custom key mappings
imap jk <C-[>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Remap tabs to Command+# (i.e. like Firefox/Chrome)
nmap <D-1> 1gt
nmap <D-2> 2gt
nmap <D-3> 3gt
nmap <D-4> 4gt
nmap <D-5> 5gt
nmap <D-6> 6gt
nmap <D-7> 7gt
nmap <D-8> 8gt
nmap <D-9> :tablast<CR>

" Useful function for calling commands and preserving search/cursor postiion
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" Cleanup (indent, remove spaces, etc)
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap _= :call Preserve("normal gg=G")<CR>

autocmd BufWritePre *.rb,*.rake,*.js,*.css :call Preserve("%s/\\s\\+$//e")

set laststatus=2
set statusline=%-3.3n\ %#keyword#%{fugitive#statusline()}\ %#todo#%f%*\ %y\ format:\ %{&ff};\ [%c,%l]\ %P
