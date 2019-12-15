call plug#begin("~/.vim/plugged")
  " Go
  Plug 'fatih/vim-go'
  " C
  Plug 'vim-scripts/c.vim'
  " Rust
  Plug 'rust-lang/rust.vim'
  " Flutter
  Plug 'dart-lang/dart-vim-plugin'
  Plug 'thosakwe/vim-flutter'
  " Latex
  Plug 'lervag/vimtex'
  " Pandoc Markdown
  Plug 'vim-pandoc/vim-pandoc'
  Plug 'vim-pandoc/vim-pandoc-syntax'
  " Git
  Plug 'tpope/vim-fugitive'
  " (J|T)SX?
  " Plug 'mxw/vim-jsx'
  " Plug 'ianks/vim-tsx'
  " Plug 'leafgarland/typescript-vim'

  " Language Client
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

  " Snippets
  Plug 'SirVer/ultisnips'

  " Prettier
  " Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
  " let g:prettier#autoformat = 1

  " Tree File View
  Plug 'scrooloose/nerdtree'

  " Fuzzy Search
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  " Airline
  Plug 'vim-airline/vim-airline'

  " for writing, to toggle, type :Goyo
  Plug 'junegunn/goyo.vim'
  
  " Vim surround
  Plug 'tpope/vim-surround'

  " Themes
  Plug 'dracula/vim'
  Plug 'cormacrelf/vim-colors-github'

call plug#end()


" _  __          _                         _ 
"| |/ /___ _   _| |__   ___   __ _ _ __ __| |
"| ' // _ \ | | | '_ \ / _ \ / _` | '__/ _` |
"| . \  __/ |_| | |_) | (_) | (_| | | | (_| |
"|_|\_\___|\__, |_.__/ \___/ \__,_|_|  \__,_|
"          |___/                             

" remap leader from '/'
let mapleader=";"

" Use ;; as Escape
" http://vim.wikia.com/wiki/Avoid_the_escape_key
inoremap ;; <Esc>

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
" start terminal in insert mode

au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open new split panes to right and below
set splitright
set splitbelow

" open terminal on ctrl+;
" uses zsh instead of bash
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>


" _                                             
"| |    __ _ _ __   __ _ _   _  __ _  __ _  ___ 
"| |   / _` | '_ \ / _` | | | |/ _` |/ _` |/ _ \
"| |__| (_| | | | | (_| | |_| | (_| | (_| |  __/
"|_____\__,_|_| |_|\__, |\__,_|\__,_|\__, |\___|
"                  |___/             |___/      
" ____                           
"/ ___|  ___ _ ____   _____ _ __ 
"\___ \ / _ \ '__\ \ / / _ \ '__|
" ___) |  __/ |   \ V /  __/ |   
"|____/ \___|_|    \_/ \___|_|   

" C-space forces completion
inoremap <silent><expr> <c-space> coc#refresh()
" Use [g and ]g to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" K shows documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" goto mappings
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Space mappings
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" \rn to rename value
nmap <leader>rn <Plug>(coc-rename)
" Leaving cursor over symbol causes all occurences to highlight
autocmd CursorHold * silent call CocActionAsync('highlight')

"  ____ _   _ ___ 
" / ___| | | |_ _|
"| |  _| | | || | 
"| |_| | |_| || | 
" \____|\___/|___|

" Style preferences
set tabstop=2 shiftwidth=2 expandtab number relativenumber hidden nobackup nowritebackup cmdheight=2 updatetime=300 shortmess+=c signcolumn=yes

" Enable theming support
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme dracula

function! Light()
  set bg=light
  let g:airline_theme = "github"
  colorscheme github
  set list
endfunction

function! Dark()
  set bg=dark
  let g:airline_theme = "dracula"
  colorscheme dracula
  set nolist
endfunction

function! ToggleTheme()
  if &bg ==# "light"
    call Dark()
  else
    call Light()
  endif
endfunction

nmap <leader>tl :call Light()<CR>
nmap <leader>td :call Dark()<CR>
nmap <leader>tt :call ToggleTheme()<CR>

" NerdTree ignored files and keyboard shortcut
let NERDTreeIgnore = ['\.pyc$', '\.class$', 'Test\.java']
nnoremap <silent> <c-b> :NERDTreeToggle<CR>

" FZF key bindings
nnoremap <C-f> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-v': 'vsplit' }

" Airline
let g:airline_extensions = ['coc']
let g:airline_skip_empty_sections = 1
let g:airline_section_z = airline#section#create(['linenr'])
let g:airline_powerline_fonts = 1

" _   _       _            
"| \ | | ___ | |_ ___  ___ 
"|  \| |/ _ \| __/ _ \/ __|
"| |\  | (_) | ||  __/\__ \
"|_| \_|\___/ \__\___||___/
                          
" Latex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_compiler_latexmk = {
  \ 'build_dir' : 'output',
\}

" Automatically save files on change
autocmd TextChanged,TextChangedI <buffer> silent update

" Spell check
set spelllang=en_gb

" Automatically enable spell check in the given file types
autocmd FileType latex,tex,md,markdown,txt setlocal spell

" Automatically compile markdown files
autocmd BufWritePost *.md silent execute "!pandoc % -o %:r.pdf"
command PandocPDF silent execute "!pandoc % -o %:r.pdf"
map <F6> :PandocPDF<CR>
" For opening markdown files in zathura
command Zathura execute "!zathura %:r.pdf"
map <F5> :Zathura<CR>
