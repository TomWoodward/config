syntax on

set modeline
set cursorline
set number
set expandtab
set ignorecase
set smartcase
set foldmethod=syntax
set foldlevelstart=1
set encoding=utf-8

set tabstop=2
set shiftwidth=2
set softtabstop=2

set undofile
set undodir=~/.vim/undo

autocmd Filetype java setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

nnoremap <silent> <C-h> :tabprevious<CR>
nnoremap <silent> <C-l> :tabnext<CR>
nnoremap <silent> <C-t> :tabe %:h<CR>

let g:airline_theme='base16_atelierforest'
let g:airline_powerline_fonts = 1
let g:jsx_ext_required = 0
let g:airline_skip_empty_sections = 1
let g:ctrlp_prompt_mappings = {'AcceptSelection("e")': [],'AcceptSelection("t")': ['<cr>', '<c-m>'],}

"hi Pmenu ctermbg=white ctermfg=black
"hi PmenuSel ctermbg=black ctermfg=white
"hi Folded ctermbg=black ctermfg=white

au BufRead,BufNewFile *.lavender setfiletype jade

execute pathogen#infect()

color basic-dark
