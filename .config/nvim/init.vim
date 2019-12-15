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

  " for writing, to toggle, type :Goyo
  Plug 'junegunn/goyo.vim'
  
  " Vim surround
  Plug 'tpope/vim-surround'

  " Themes
  Plug 'mhartington/oceanic-next'
  Plug 'Rigellute/shades-of-purple.vim'
  Plug 'kaicataldo/material.vim'
  Plug 'dracula/vim'

call plug#end()

" Language Client
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

nmap <leader>rn <Plug>(coc-rename)
autocmd CursorHold * silent call CocActionAsync('highlight')
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Latex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_compiler_latexmk = {
  \ 'build_dir' : 'output',
\}

" Nerd File Config
let NERDTreeIgnore = ['\.pyc$', '\.class$', 'Test\.java']

" Enable theming support
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme dracula

" FZF key bindings
nnoremap <C-f> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-v': 'vsplit' }

" Language Client
"let g:LanguageClient_serverCommands = {
"  \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"  \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
"  \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
"  \ 'python': ['/usr/local/bin/pyls'],
"\ }

"nnoremap <F8> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
"nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
"nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" Automatically update on change
autocmd TextChanged,TextChangedI <buffer> silent update

" Style preferences
set tabstop=2 shiftwidth=2 expandtab number relativenumber hidden

" Spell check
set spelllang=en_gb
" Automatically enable spell check in the given file types
autocmd FileType latex,tex,md,markdown setlocal spell
" Automatically compile markdown files
autocmd BufWritePost *.md silent execute "!pandoc % -o %:r.pdf"
command PandocPDF silent execute "!pandoc % -o %:r.pdf"
map <F6> :PandocPDF<CR>
" For opening markdown files in zathura
command Zathura execute "!zathura %:r.pdf"
map <F5> :Zathura<CR>
