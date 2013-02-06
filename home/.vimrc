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
set autoread
set shortmess+=A
set clipboard=unnamed
set modeline
"set undofile

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

let mapleader = ","

" Options for better searching/moving:
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" Long lines
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=80
:hi ColorColumn ctermbg=lightgrey guibg=#2D2D2D

" NERDTree configuration
let NERDTreeWinPos="right"
nmap <silent> <leader>f :NERDTreeToggle<CR>

" Custom key mappings
imap jk <C-[>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
cabbrev > :vertical resize +30<CR>
cabbrev < :vertical resize -30<CR>

nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Training wheels (disable arrow keys)
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

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

" Ack
nnoremap <leader>a :Ack

" Git
vmap <Leader>g :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

" Sort CSS properties
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" Re-hardwrap paragraphs of text
nnoremap <leader>q gqip

" Re-select previously pasted text
nnoremap <leader>v V`]

" Enable matchit macros
runtime macros/matchit.vim

" Insert <Tab> or complete identifier
" if the cursor is after a keyword character
function MyTabOrComplete()
    let col = col('.')-1
    if !col || getline('.')[col-1] !~ '\k'
        return "\<tab>"
    else
        return "\<C-N>"
    endif
endfunction
inoremap <Tab> <C-R>=MyTabOrComplete()<CR>

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

" Rainbows!
nmap <leader>R :RainbowParenthesesToggle<CR>

" Shouldn't need shift
nnoremap ; :


set laststatus=2
set statusline=%-3.3n\ %#keyword#%{fugitive#statusline()}\ %#todo#%f%*\ %y\ format:\ %{&ff};\ [%c,%l]\ %P
