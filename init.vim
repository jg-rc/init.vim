" Directorio de plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'joshdick/onedark.vim' "Color scheme inspirado por el tema One Dark de Atom.
Plug 'tpope/vim-surround' "surround plugin
Plug 'scrooloose/nerdtree' "proyect tree and structure
Plug 'tpope/vim-fugitive'
Plug 'xuyuanp/nerdtree-git-plugin' "nerd tree git status
Plug 'ctrlpvim/ctrlp.vim'  "files autocomplete for vim
Plug 'mattn/emmet-vim' " emmet para escribir un poco mas rapidin
Plug 'mattn/webapi-vim' " emmet custom snippets need this plugin in order to work
Plug 'easymotion/vim-easymotion' "movamonos un poco mas rapidin con este easymotion
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'  " Temas para airline la barra en la parte baja
Plug 'airblade/vim-gitgutter' " muestra los cambios en archivos en la parte izquierda donde estan los numeros de linea
Plug 'jiangmiao/auto-pairs' " automaticamente cierra comillas o llaves
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'vue',
    \ 'lua',
    \ 'php',
    \ 'python',
    \ 'ruby',
    \ 'html',
    \ 'swift' ] }
Plug 'mileszs/ack.vim' " ack for vim NEEDS $ brew install ack to be installed in mac
Plug 'kana/vim-arpeggio' " permite JK para entrar en insert mode 
Plug 'w0rp/ale' " analizador static asincrono
Plug 'tpope/vim-sensible' " algunas configuraciones por defecto para vim por tpope
Plug 'pangloss/vim-javascript' "Vastly improved Javascript indentation and syntax support in Vim
Plug 'mxw/vim-jsx' " coloreado de sintaxis e identacion
Plug 'tpope/vim-sleuth' " ajusta la identacion y los espacios basados en el archivo :O
Plug 'ycm-core/YouCompleteMe'  " auto completer to the game
Plug 'scrooloose/syntastic' " check sintaxi en tiempo real :O :O
Plug 'majutsushi/tagbar'  "ver todas las funciones y definiciones en un panel lateral para leer codigo :O
Plug 'terryma/vim-multiple-cursors' " vim multiple cursors same as sublime
Plug 'SirVer/ultisnips' " snnipets in vim  need python support in vim
Plug 'honza/vim-snippets' " ultisnips come without any snippets so here they are 
Plug 'leshill/vim-json' " vim json syntax highlight and other things not sure
Plug 'ervandew/supertab' " supertab is needed  for YCM and UltiSnnipets integration
Plug 'kana/vim-textobj-user' "vim-textobj-user - Create your own text objects for vim in an easy way
Plug 'kana/vim-textobj-function' " vim text objects for functions C language Java Vim script 
Plug 'haya14busa/vim-textobj-function-syntax' "extends previous one vim-textobj-function-syntax provides heuristic text-objects for function by using syntax definitions.
Plug 'scrooloose/nerdcommenter' " comment lines of code using this plugin 
Plug 'hail2u/vim-css3-syntax' "CSS3 syntax (and syntax defined in some foreign specifications) support for Vim's built-in syntax/css.vim
Plug 'groenewege/vim-less' "This vim bundle adds syntax highlighting, indenting and autocompletion for the dynamic stylesheet language LESS.  
Plug 'alvan/vim-closetag' "Auto close (X)HTML tags
Plug 'xolox/vim-misc' " vim-sessions require this one plugin in order to work :/
Plug 'xolox/vim-session' " vim sessions who wants to close his config and start setting up his workflow again :(
Plug 'lumiliet/vim-twig' " twig syntax highlighting
call plug#end()

" Luego de esta línea puedes agregar tus configuraciones y mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Hide pointless junk at the bottom, doesn't work in .vimrc for some reason?
:set laststatus=0
:set noshowmode "don't show --INSERT--
:set noruler "don't show line numbers/column/% junk

" guicolors styles for every mode
:set termguicolors 
:hi Cursor guifg=green guibg=green
:hi Cursor2 guifg=red guibg=red
:set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor50

" Vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
   set termguicolors
endif

"vimR only configurations
if has("gui_vimr")
  " Font for vimR
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keep the error column always visible (jumpy when linter runs on input)
:set signcolumn=yes

" Indent using spaces instead of tabs
set expandtab

" tagbar necesita que esto este activado
filetype on

" The number of spaces to use for each indent
set shiftwidth=2

" Line numbers
:set number

" Don't wrap lines
:set nowrap
" split new panels down and below
:set splitbelow
:set splitright

"JK for insert mode using vim arpeggio
call arpeggio#map('i','',0,'jk','<ESC>') 

" set a map leader for more key combos
let mapleader = " "

" open a new terminal  in aplit of the current tab
nmap <leader>st :12sp term://zsh<CR>I
nmap <leader>t :tabnew term://zsh<CR>I

" no mostrar numeros de linea cuando se abre una terminal :O :O
autocmd TermOpen * setlocal nonumber norelativenumber

"Number of spaces to use for a <Tab> during editing operations
set softtabstop=2"

" tema y apariencia 
set termguicolors  " Activa true colors en la terminal
"Enable syntax highlighting and set colorscheme
syntax enable
colorscheme onedark  " Activa tema onedark

" run prettier when leaving insert mode or when saving
" when running at every change you may want to disable quickfix
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0
autocmd BufWritePre,TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

"" NerdTree configs
let g:NERDTreeChDirMode = 2  " Cambia el directorio actual al nodo padre actual
let NERDTreeWinSize = 35  "estado por defecto del ancho de la barra de nerdtree
"Toggle file drawer in/out
nmap <leader>m :NERDTreeFind<CR>
nmap <leader>n :NERDTreeToggle<CR>

" so I can go up an down wrapped lines
map j gj
map k gk

" limpiar la busqueda usando shift enter 
nnoremap <leader><CR> :noh<CR>

" abrir vim.init en un ventana nueva love it
nnoremap <leader>y :tabnew $MYVIMRC<CR>

" Usar <líder> + y para copiar al portapapeles
vnoremap <leader>c "+y
nnoremap <leader>c "+y

" Usar <líder> + d para cortar al portapapeles
vnoremap <leader>x "+d
nnoremap <leader>x "+d

" Usar <líder> + p para pegar desde el portapapeles
nnoremap <leader>v "+p
vnoremap <leader>v "+p
nnoremap <leader>v "+P
vnoremap <leader>v "+P

" Cerrar el buffer actual con <líder> + q
nnoremap <leader>q :q<CR>

" pestanaiguiente  y pesana anterior
nnoremap <leader>r gt
nnoremap <leader>e  gT
" map  HLM  to leader
" ir al inicio de la zona visible
nnoremap  <leader>k H
vnoremap  <leader>k H
" ir con el curso a l medio de la zona visible
nnoremap  <leader>l M
vnoremap  <leader>l M
" ir con el cursor al fina de la zona visible
nnoremap  <leader>j L
vnoremap  <leader>j L
" center cursor vertically
nnoremap  <leader>h zz
vnoremap  <leader>h zz

" moverme entre los diferentes paneles
nmap <leader>w <C-w>w

if has('nvim')
  " Terminal mode:
  tnoremap <M-h> <c-\><c-n><c-w>h
  tnoremap <M-j> <c-\><c-n><c-w>j
  tnoremap <M-k> <c-\><c-n><c-w>k
  tnoremap <M-l> <c-\><c-n><c-w>l
  " Insert mode:
  inoremap <M-h> <Esc><c-w>h
  inoremap <M-j> <Esc><c-w>j
  inoremap <M-k> <Esc><c-w>k
  inoremap <M-l> <Esc><c-w>l
  " Visual mode:
  vnoremap <M-h> <Esc><c-w>h
  vnoremap <M-j> <Esc><c-w>j
  vnoremap <M-k> <Esc><c-w>k
  vnoremap <M-l> <Esc><c-w>l
  " Normal mode:
  nnoremap <M-h> <c-w>h
  nnoremap <M-j> <c-w>j
  nnoremap <M-k> <c-w>k
  nnoremap <M-l> <c-w>l
  "some terminal mappings
  tnoremap <Esc> <C-\><C-n>
  tnoremap <M-[> <Esc>
  tnoremap <C-v><Esc> <Esc>
  " simulare <C-R>
  tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
endif

" terminal emulator exit
" configuracion para airline
let g:airline#extensions#syntastic#enabled = 1 "syntastic esta activado 
let g:airline#extensions#branch#enabled = 1 "TBH not sure what this means
let g:airline#extensions#tabline#enabled = 1  " Mostrar buffers abiertos (como pestañas)
let g:airline#extensions#tabline#fnamemod = ':t'  " Mostrar sólo el nombre del archivo
let g:airline#extensions#tagbar#enabled = 1 "" muestra el nombre de la funcion en la que estoy :O
" Cargar fuente Powerline y símbolos (ver nota)
let g:airline_powerline_fonts = 1

set noshowmode  " No mostrar el modo actual (ya lo muestra la barra de estado)

" Configuracion para gitgutter
" Actualizar barra cada 250 mili segundos
set updatetime=250

"configuracion para ctrlp 
" Archivos ignorados
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|node_modules)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" ctrlp use .gitignore
" https://github.com/kien/ctrlp.vim/issues/174
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

" ctrlp is very smart and try to guest the proyect dir, but i don't need that
let g:ctrlp_working_path_mode = ""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open a new tab and search for something 
nmap <leader>f :tab split<CR>:Ack! ""<left>

" en modo visual pega laeleccion en un nuevo comando ack :O :O
vnoremap <Leader>f y:Ack <C-R>=fnameescape(@")<CR><CR>
"buscar la palabra que hay bajo el cursor en una nueva pestana
nmap <leader>F :tab split<CR>:Ack! <C-r><C-w><CR>

" ctrp mapping 
nmap <leader>p <C-P>

" necesito mirar como usar control P en modo visual 
vnoremap <Leader>p y:CtrlP<CR><Insert>

" atajo para guardar usando ctrl-s :w que pereza
noremap  <D>s :update<CR>
vnoremap <D>s <C-C>:update<CR>
inoremap <D>s <C-O>:update<CR>

" ultima posision del cursor
nmap <leader>o <C-I>
nmap <leader>i <C-O>

" Allow JSX in .js files
let g:jsx_ext_required=0

" ale configuraciones
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

"navegar entre errores de ale con facilidad usando Alt
nmap <silent> <M-k> <Plug>(ale_previous_wrap)
nmap <silent> <M-j> <Plug>(ale_next_wrap)

" Don't show YCM's preview window [ I find it really annoying ]
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
" you complete me config  for a better completion
"
" Start autocompletion after 4 chars
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_enable_diagnostic_highlighting = 0

" make YCM compatible with UltiSnips (using supertab)
" taken from https://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" emmet leader key to be tab
let g:user_emmet_leader_key=','

"" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"syntastic  configurations for newbies 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" funciones y definiciones de variable usando f8
nmap <F8> :TagbarToggle<CR>

"tag bar width 
let g:tagbar_width = 50
let g:tagbar_compact = 1
let g:tagbar_indent = 1
let g:tagbar_show_visibility = 0

" fugitive git mappings 
nnoremap <silent><leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <silent><leader>gr :Gread<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nmap <silent><leader>gb :Gblame<cr>

" buscar en el documento lo que este visualmente seleccionado
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>

" siempre abre un archivo bajo el cursor en un nuevo tab
nmap gf <c-w>gf
" custom ulti snippets
let g:UltiSnipsSnippetDirectories=["UltiSnips", $HOME.'/.config/nvim/mycoolsnippets']

" emmet vim custom snnipets i really love snippets
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand( $HOME.'/.config/nvim/emmet_custom/snippets.json')), "\n"))
" enable jsdocs syntax highlight
let g:javascript_plugin_jsdoc = 1

"Enables some additional syntax highlighting for NGDocs. Requires JSDoc plugin to be enabled as well.
let g:javascript_plugin_ngdoc = 1

" folding code nice config
if has('folding')
  set foldmethod=indent               " not as cool as syntax, but faster
  set foldlevelstart=99               " start unfolded
endif
" toggle fold of current position Using S-tab 
nnoremap <s-tab> za
"navigate between  close folds OMG taken from https://stackoverflow.com/questions/9403098/is-it-possible-to-jump-to-closed-folds-in-vim
nnoremap <silent> <tab>j :call NextClosedFold('j')<cr>
nnoremap <silent> <tab>k :call NextClosedFold('k')<cr>
function! NextClosedFold(dir)
    let cmd = 'norm!z' . a:dir
    let view = winsaveview()
    let [l0, l, open] = [0, view.lnum, 1]
    while l != l0 && open
        exe cmd
        let [l0, l] = [l, line('.')]
        let open = foldclosed(l) < 0
    endwhile
    if open
        call winrestview(view)
    endif
endfunction

" session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "yes"
let g:session_autosave = "no"
let g:session_command_aliases = 1
