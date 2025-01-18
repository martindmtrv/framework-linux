let &t_SI = "\<esc>[6 q"  " blinking I-beam in insert mode
let &t_SR = "\<esc>[4 q"  " blinking underline in replace mode
let &t_EI = "\<esc>[2 q"  " default cursor (usually blinking block) otherwise

syntax on

set clipboard=unnamedplus
vnoremap <C-c> "+y
map <C-p> "+p
set autoindent
set number relativenumber
set incsearch
set hlsearch
set wildmode=longest,list,full
set splitbelow splitright

set ignorecase
set smartcase

" shortcut S to find-replace
nnoremap S :%s//g<Left><Left>

" newtab with ctrl t
nnoremap <silent> <C-t> :tabnew<CR>

" tabclose with ctrl w
nnoremap <silent> <C-w> :tabclose<CR>

" set words to not wrap broken
set linebreak

" map c-left and c-right to switch tabs
nnoremap <silent> <C-Left> :tabprevious<CR>
nnoremap <silent> <C-Right> :tabnext<CR>

set whichwrap+=<,>,[,],h,l

highlight Normal guibg=black guifg=white
set background=dark
