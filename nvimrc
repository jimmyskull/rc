
" Bundle {{{
filetype off                  " required
set rtp+=~/.nvim/bundle/Vundle.vim
call vundle#begin("~/.nvim/bundle/")
Plugin 'VundleVim/Vundle.vim'
" Themes
Plugin 'w0ng/vim-hybrid'
Plugin 'sjl/badwolf'
Plugin 'altercation/vim-colors-solarized'
Plugin 'endel/vim-github-colorscheme'
" Addons
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
"Plugin 'jeaye/color_coded'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'rhysd/vim-clang-format'
"Plugin 'Yggdroot/indentLine'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ervandew/supertab'
Plugin 'vim-scripts/LanguageTool'
Plugin 'sjl/gundo.vim'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on
" }}}

" Spaces & Tabs {{{
set expandtab         " expand tabs to spaces
set tabstop=2         " number of visual spaces per TAB
set shiftwidth=2      " columns for >> and << operations
set softtabstop=2     " number of spaces in tab when insertion
" }}}

" Colors {{{
" turn syntax highlighting on
syntax on
set background=dark
colorscheme hybrid
"colorscheme github
""highlight Class ctermfg=38
highlight Comment cterm=italic
"highlight Function cterm=italic ctermfg=77
"highlight Namespace cterm=bold ctermfg=72
"highlight Number ctermfg=205
"highlight String ctermfg=208
"highlight GlobalVariable ctermfg=125 cterm=italic
"highlight Member ctermfg=194
""highlight Operator ctermfg=51
"highlight Type cterm=NONE ctermfg=81
"highlight Statement cterm=bold ctermfg=81
"highlight YcmWarningSection ctermfg=0 ctermbg=9
"highlight YcmErrorSection ctermfg=0 ctermbg=1
"highlight YcmWarningSign ctermbg=9
"highlight YcmErrorSign ctermbg=1
"highlight SpellBad ctermbg=167 ctermfg=0
"highlight Error cterm=NONE ctermbg=1
" }}}

" UI Layout {{{
set number
set showcmd
set cursorline
set nocursorline
set showmatch
set wildmenu
set wildmode=longest:full
set textwidth=80
set colorcolumn=81
" }}}

" Core {{{
set clipboard=unnamedplus
set modelines=1
set lazyredraw
set comments=sl:/*,mb:\ *,elx:\ */
" }}}

" Searching {{{
set ignorecase
set incsearch
set hlsearch
" }}}

" Folding {{{
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
noremap <space> za
" }}}

" Leader Shortcuts {{{
let mapleader=","
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>u :GundoToggle<CR>
" Save session
nnoremap <leader>s :mksession<CR>
" }}}

" Fn and Alt {{{
nmap <F2> :w<CR>
nmap <F4> :ClangFormat<CR>
imap <F4> <ESC>:ClangFormat<CR>imap <F2> <ESC>:w<CR>i
map <F9> :YcmCompleter FixIt<CR>
nnoremap <F10> :YcmForceCompileAndDiagnostics <CR>

nnoremap <A-1> 1gt
nnoremap <A-2> 2gt
nnoremap <A-3> 3gt
nnoremap <A-4> 4gt
nnoremap <A-5> 5gt
nnoremap <A-6> 6gt
nnoremap <A-7> 7gt
nnoremap <A-8> 8gt
nnoremap <A-9> 9gt
" }}}

" YouCompleteMe & UltiSnips {{{
let g:ycm_key_invoke_completion = '<C-b>'
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_always_populate_location_list = 1
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" }}}

" Utility functions {{{
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

nnoremap <C-m> :call NumberToggle()<cr>
" }}}

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" vim-gitgutter
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1
set updatetime=250

" LanguageTool
let g:languagetool_jar='/usr/share/java/languagetool/languagetool-commandline.jar'

let g:indentLine_char = '┊'
let g:indentLine_color_term = 252

" vim:foldmethod=marker:foldlevel=0
