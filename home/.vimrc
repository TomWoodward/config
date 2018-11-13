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
set backupcopy=yes
set undofile
set undodir=~/.vim/undo

nnoremap <silent> <C-h> :tabprevious<CR>
nnoremap <silent> <C-l> :tabnext<CR>
nnoremap <silent> <C-t> :tabe %:h<CR>

"theme
let g:airline_theme='base16_atelierforest'
let g:airline_powerline_fonts = 1
let g:jsx_ext_required = 0
let g:airline_skip_empty_sections = 1

"file search
let g:ctrlp_prompt_mappings = {'AcceptSelection("e")': [],'AcceptSelection("t")': ['<cr>', '<c-m>'],}
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']

"typescript
let g:tsuquyomi_disable_default_mappings = 1
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tslint', 'tsuquyomi']
let g:syntastic_typescript_tslint_args = ['--fix']
autocmd FileType typescript nnoremap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>
autocmd FileType typescript nnoremap <buffer> <Leader>g :TsuImport<CR>

"java
autocmd Filetype java setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set autoread

let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

function! SyntasticCheckHook(errors)
  checktime
endfunction

"hi Pmenu ctermbg=white ctermfg=black
"hi PmenuSel ctermbg=black ctermfg=white
"hi Folded ctermbg=black ctermfg=white

au BufRead,BufNewFile *.lavender setfiletype jade

execute pathogen#infect()

color basic-dark
