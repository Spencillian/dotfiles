set relativenumber
set nocompatible
set splitbelow
set splitright
set cursorline
set scrolloff=10
set colorcolumn=120

" search
set incsearch
set hlsearch
set showmatch
set ignorecase
set smartcase

" file formatting standarization
set fileformat=unix
set encoding=utf-8
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" wildmenu settings
set wildmenu
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" powerline status
set laststatus=2

" colorschemes
colorscheme molokai

" split navigations in normal mode
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <Leader>t :tab term<CR>

" split navigation in terminal mode
tnoremap <C-J> <C-W><C-J>
tnoremap <C-K> <C-W><C-K>
tnoremap <C-L> <C-W><C-L>
tnoremap <C-H> <C-W><C-H>
tnoremap <A-Right> <C-\><C-n>gt
tnoremap <A-Left> <C-\><C-n>gT

" exit vim with jk
inoremap jk <ESC><Right>

" map leader to space
map <Space> <Leader>

" Using vim-plug for vim packages
call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/indentpython.vim'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plug 'tell-k/vim-autopep8'
Plug 'vim-autoformat/vim-autoformat'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'luochen1990/rainbow'
Plug 'pangloss/vim-javascript'

" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required

syntax on

"auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" cursor shape
if &term =~? 'rxvt' || &term =~? 'xterm' || &term =~? 'st-'
    " 1 or 0 -> blinking block
    " 2 -> solid block
    " 3 -> blinking underscore
    " 4 -> solid underscore
    " Recent versions of xterm (282 or above) also support
    " 5 -> blinking vertical bar
    " 6 -> solid vertical bar
    " Insert Mode
    let &t_SI .= "\<Esc>[6 q"
    " Normal Mode
    let &t_EI .= "\<Esc>[2 q"
endif

" NERDTree keybinds
nnoremap <C-n> :NERDTree<CR>
nnoremap <leader>b :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <A-Right> gt
nnoremap <A-Left> gT

" Coc specific settings
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Rainbow braces
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

" file specific settings
" *.py
au BufNewFile,BufRead *.py
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set expandtab |
	\ set autoindent |
    \ set fileformat=unix
" flag bad whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
let python_highlight_all=1
" setup for powerline
" py3 from powerline.vim import setup as powerline_setup
" py3 powerline_setup()
" py3 del powerline_setup
" Autoformatting settings
let g:autopep8_disable_show_diff=1
let g:autopep8_on_save=1

" *.rs
let g:rustfmt_autosave = 1

" *.ts,tsx
autocmd BufRead,BufNewFile *.ts,*.tsx,*.js,*.jsx setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab autoindent
