"             _           
"  _ ____   _(_)_ __ ___  
" | '_ \ \ / / | '_ ` _ \ 
" | | | \ V /| | | | | | |
" |_| |_|\_/ |_|_| |_| |_|
"                         

" NOTE: Highly recommend to switch Caps Lock and Esc

" ============================================================
" Auto load for the first time
" ============================================================

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !proxychains -q curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ============================================================
" Create a _machine_specific.vim file to adjust machine
" specfic stuff, like python interpreter location
" ============================================================

let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
  let has_machine_specific_file = 0
  silent! exec "!cp ~/.config/nvim/template/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source ~/.config/nvim/_machine_specific.vim

" ============================================================
" System
" ============================================================

" system clipboard
" set clipboard=unnamedplus

" terminal emulator config
let &t_ut=''

" auto change current working directory
set autochdir

" default encoding
set encoding=utf-8

" ============================================================
" Editor behavior
" ============================================================

" line number
set number
set relativenumber

" highlight the screenline
set cursorline

" allow unsaved file stay in buffer
" (coc.nvim) textedit might fail if hidden is not set
set hidden

" tabstop
set expandtab
set smartindent
set cindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
let g:rust_recommended_style = 0

" show unvisible characters
set list

" minimal screen lines to keep above or below
set scrolloff=5

" fast response
set ttimeoutlen=0
set notimeout
set updatetime=100
set ttyfast
set lazyredraw

" auto wrap when overflow in line
set nowrap

" auto fold settings
set foldmethod=manual
set foldlevel=99
set foldenable

" split default
set splitright
set splitbelow

" don't show mode message on the last line
" (airline)
set noshowmode

" show command
set showcmd

" better search experience (smart case)
set ignorecase
set smartcase

" shortmess
" (coc.nvim)
set shortmess+=c

" show opt results in a preview window if necessary
set inccommand=split

" show visual bell when error
set visualbell

" useful to align text
" set colorcolumn=100

" show signcolumn
set signcolumn=yes

" remember the position edited last time
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ============================================================
" Basic mappings
" ============================================================

" set <LEADER> as <SPACE>, ; as :
let mapleader = " "
noremap ; :

" save & quit
noremap S :w<CR>
noremap Q :q<CR>
noremap <C-q> :qa<CR>
noremap R :source $MYVIMRC<CR>

" open vimrc anytime
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>

" make Y to copy till the end of the line (Normal)
nnoremap Y y$

" copy to system clipboard (Visual)
vnoremap Y "+y

" indent (Normal)
nnoremap < <<
nnoremap > >>

" search
noremap <silent> <LEADER><CR> :nohlsearch<CR>

" auto tab to space
nnoremap <LEADER>ts :%s/\t/  /g
vnoremap <LEADER>ts :s/\t/  /g

" fast navigation
noremap J 5j
noremap K 5k

" noremap 1 30j
" noremap 2 30k

" fast navigation in line
noremap H 5h
noremap L 5l
noremap W 5w
noremap B 5b
noremap E 5E

" go to the start/end of the line
noremap <silent> <C-h> 0
noremap <silent> <C-l> $

" move up/down without moving the cursor
noremap <C-j> 5<C-e>
noremap <C-k> 5<C-y>

" insert mode cursor movement
inoremap <C-a> <ESC>A

" command mode cursor movement
cnoremap <C-a> <Home>
cnoremap <C-d> <End>
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>

" search next / prev
noremap n nzz
noremap N Nzz

" window management
" use <LEADER> + arrowkeys for moving the cursor around windows
noremap <LEADER>h <C-w>h
noremap <LEADER>j <C-w>j
noremap <LEADER>k <C-w>k
noremap <LEADER>l <C-w>l

" disable the default s key
noremap s <nop>

" split the screens to up/down/left/right
noremap sh :set nosplitright<CR>:vsplit<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sk :set nosplitbelow<CR>:split<CR>
noremap sl :set splitright<CR>:vsplit<CR>

" resize splits with arrowkeys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize -5<CR>
noremap <right> :vertical resize +5<CR>

" disable ZZ & ZQ
noremap ZZ <nop>
noremap ZQ <nop>

" tab management
noremap Zz :tabe<CR>
noremap Zl :+tabnext<CR>
noremap Zh :-tabnext<CR>
noremap ZL :+tabmove<CR>
noremap ZH :-tabmove<CR>

" toggle between split / vsplit
noremap <LEADER>sh <C-w>t<C-w>H
noremap <LEADER>sv <C-w>t<C-w>K

" call figlet
noremap tx :r !figlet<space>

" search & replace
noremap <LEADER>sr :%s//g<left><left>

" allow mouse
set mouse=a

" ============================================================
" Placeholder
" ============================================================

" press <LEADER>g to insert a '<++>'
nnoremap <LEADER>g a<++><Esc>

" press <LEADER> twice to jump to the next '<++>' and edit it
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" ============================================================
" Markdown Preview
" ============================================================

" load markdown snippets
source ~/.config/nvim/markdown.vim

" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell

" ============================================================
" Compile & Run
" ============================================================

noremap r :call CompileRun()<CR>
noremap T :call OpenTerminal()<CR>

function! OpenTerminal()
  set splitbelow
  :sp
  :res -5
  :term
endfunction

function! CompileRun()
  exec "w"
  if &filetype == 'c'
    set splitbelow
    exec "!gcc % -Wall -o %< -g"
    :sp
    :res -10
    :term ./%<
  elseif &filetype == 'cpp'
    set splitbelow
    exec "!g++ % -Wall -o %< -g"
    :sp
    :res -10
    :term ./%<
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    set splitbelow
    :sp
    :res -5
    :term python3 %
  elseif &filetype == 'html'
    silent! exec "!".g:mkdp_browser." % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'rust'
    set splitbelow
    exec "!cargo build"
    :sp
    :res -5
    :term cargo run
  endif
endfunction

" ============================================================
" Install plugins with Vim-Plug
" ============================================================

call plug#begin('~/.config/nvim/plugged')

" Pretty dress
Plug 'connorholyday/vim-snazzy'

" Statusline
Plug 'vim-airline/vim-airline'

" General highlighter (OK)
Plug 'RRethy/vim-illuminate'

" File navigation (OK)
Plug 'junegunn/fzf.vim'
Plug 'kevinhwang91/rnvimr'

" Taglist (OK)
Plug 'liuchengxu/vista.vim'

" Auto complete (OK)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Undo tree (OK)
Plug 'mbbill/undotree'

" Markdown (OK)
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }

call plug#end()

let g:SnazzyTransparent = 1
colorscheme snazzy

" ============================================================
" vim-illuminate
" ============================================================

let g:Illuminate_delay = 150
hi illuminatedWord cterm=undercurl gui=undercurl

" ============================================================
" fzf.vim
" ============================================================

noremap <silent> <LEADER>ff :FZF<CR>

" ============================================================
" rnvimr
" ============================================================

nnoremap <silent> <LEADER>ra :RnvimrToggle<CR>

" ============================================================
" vista.vim
" ============================================================

noremap <LEADER>v :Vista coc<CR>
let g:vista_default_executive = 'ctags'

" ============================================================
" coc.nvim
" ============================================================

" coc extensions
let g:coc_global_extensions = [
  \ 'coc-actions',
  \ 'coc-css',
  \ 'coc-explorer',
  \ 'coc-gitignore',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-marketplace',
  \ 'coc-snippets',
  \ 'coc-translator',
  \ 'coc-tsserver',
  \ 'coc-rls',
  \ 'coc-vimlsp',
  \ 'coc-yaml']

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-o> to trigger completion.
inoremap <silent><expr> <c-o> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `<LEADER>-` and `<LEADER>+` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <LEADER>d to show documentation in preview window.
nnoremap <silent> <LEADER>d :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Symbol renaming.
nmap <LEADER>rn <Plug>(coc-rename)

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

" coc.nvim: coc-explorer
nnoremap tt :CocCommand explorer<CR>

" coc.nvim: coc-translator
nnoremap ts :CocCommand translator.popup<CR>

" coc.nvim: coc-snippets
let g:snips_author = 'Richard Acosta'

" ============================================================
" undotree
" ============================================================

nnoremap tu :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24

" ============================================================
" vim-table-mode
" ============================================================

noremap <LEADER>tm :TableModeToggle<CR>

" ============================================================
" vim-markdown-toc
" ============================================================

noremap <LEADER>toc :GenTocGFM<CR>
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'

