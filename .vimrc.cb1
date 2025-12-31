set nocompatible
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

"=================================================================
" remove ncm2, asyncomplete, nerdtree, deoplete, ctrlp, vunble, 

let g:netrw_keepdir=0
runtime macros/matchit.vim

augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END

"이게 있으니 :term가 아니고 기본 sh 로 되어 ts.fish이 실행이 안됩니다
"if &shell =~# 'fish$'
	"set shell=sh
"endif
set iskeyword+=-
"
" esc 누를시 딜레이를 없애줍니다
" 참고사이트 : https://www.johnhawthorn.com/2012/09/vi-escape-delays/
set timeoutlen=1000 ttimeoutlen=10

" tagbar 업데이트가 너무 느려서 확인해보니 기본 4000이었습니다
set updatetime=1000

" ctrlp가 ag를 사용하게 합니다
"set grepprg=ag\ --nogroup\ --nocolor
set grepprg=rg\ --color=never
"set grepprg=rg\ --vimgrep

let g:simple_todo_map_keys = 0
let g:simple_todo_map_normal_mode_keys = 0

nnoremap ,x :let @+ = expand("%:p").":".line('.')<cr>

set rtp+=~/.fzf
let g:fzf_history_dir = '~/.fzf/fzf-history'
let g:fzf_layout = { 'down': '100%' }
let g:fzf_preview_window = []
"let g:fzf_tags_command = 'ctags -R --exclude=.git --exclude=node_modules --exclude=test'

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'query':   ['fg', 'Ignore'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Ignore'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:terminal_ansi_colors = [
\ '#073642', '#dc322f', '#859900', '#b58900',
    \ '#268bd2', '#d33682', '#2aa198', '#eee8d5',
    \ '#002b36', '#cb4b16', '#586e75', '#657b83',
    \ '#839496', '#6c71c4', '#93a1a1', '#fdf6e3']

" coc setups  ---------------------------------------------------------

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

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-k> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the \ursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap ,e <Plug>(coc-rename)
nmap ,d <Plug>(coc-codeaction)

" coc-prettier settings
command! -nargs=0 Prettier :CocCommand prettier.formatFile
 vmap ;f  <Plug>(coc-format-selected)
" nmap ;f  <Plug>(coc-format-selected)
nmap ;f  :Prettier<CR>



"" Ultisnips  ------------------------------------------------------
"
"" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
"" - https://github.com/Valloric/YouCompleteMe
"" - https://github.com/nvim-lua/completion-nvim
""let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"
"" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"
""----------------------------------------------------------------

"command! -bang -nargs=? -complete=dir Files
    "\ call fzf#vim#files(<q-args>,
	"\ {'options': ['--layout=reverse', '--info=inline']}, <bang>0)


"let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']
"command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '-l', <bang>0)
"command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '-l --path-to-ignore ~/.ignore --nocolor --hidden -g ""', <bang>0)
"command! -bang -nargs=* Rg call fzf#vim#rg(<q-args>, '--files --hidden --follow --no-ignore', <bang>0)

" fzf 에서 Ag 실행시 옵션과 파일명이 아닌 컨텐츠에서의 검색만을 하도록 하는
" 옵션입니다
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, ' --path-to-ignore ~/.ignore', {'options': '--delimiter : --nth 4..'}, <bang>0)

" fzf 에서 Rg 실행시 옵션과 파일명이 아닌 컨텐츠에서의 검색만을 하도록 하는
" 옵션입니다
" https://github.com/junegunn/fzf.vim/issues/346
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)


function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()

"command! -bang -nargs=* Rg
  "\ call fzf#vim#grep(
  "\   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  "\   <bang>0 ? fzf#vim#with_preview('up:60%')
  "\           : fzf#vim#with_preview('right:50%:hidden', '?'),
  "\   <bang>0)
"command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--hidden --path-to-ignore ~/.ignore', <bang>0)
""let g:fzf_ag_raw =1
"command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--ignore "*json"', <bang>0)
"command! -bang -nargs=+ -complete=dir Rag call fzf#vim#ag_raw(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
"command! -bang -nargs=+ -complete=dir Rag call fzf#vim#ag_raw(<q-args>, {}, <bang>0)
"set term=screen-256color
set backspace=indent,eol,start


""기본 자동완성 기능
""http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
""참고
""
"" 이걸 빼고 아래omni complete를 기본 ctrl n 으로 동작하게 바꿔버렸습니다.
"" 첫번째 항목 선택이 이상해서말이죠
""
"set completeopt=longest,menuone,preview
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"
""inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
"
"inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  "\ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  "\ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
""
"" complete 완성후 :pclose 로 프리뷰윈도우 닫는 명령
"" If you prefer the Omni-Completion tip window to close when a selection is
"" made, these lines close it on movement in insert mode or when leaving
"" insert mode
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" 변경된 버퍼를 저장하지 않고도 버퍼간 이동을 가능하게끔합니다
set hidden
set tags=tags;/

" bashrc 의 alias를 읽기 위한 설정입니다
"let $BASH_ENV = "~/.bashrc"
let $BASH_ENV = "~/.bash_functions"

"if exists('$TMUX')
  "let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  "let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
"else
  "let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  "let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"endif
"osx 터미널 상에서의 인서트모드 커서를 변경합니다.
"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"osx + tmux 상에서의 인서트모드 커서를 변경합니다.
"let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"


""""""""""""""""""
" 일반 ubuntu - linux 상에서의 커서설정
"

"에디트(이동)모드커서
let &t_EI .= "\<Esc>[1 q"
"수정(인서트)모드커서
let &t_SI .= "\<Esc>[5 q"

" solid block
" let &t_EI .= "\<Esc>[1 q"
  " 1 or 0 -> blinking block
  " 3 -> blinking underscore
  "	4 -> solid underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar

let &t_8f="\e[38;2;%ld;%ld;%ldm"
let &t_8b="\e[48;2;%ld;%ld;%ldm"

"set guicolors  "vim 8.0에서 true color 적용문법 번경
set termguicolors
" backround column erase 문제 수정 문법
set t_ut=

"set t_Co=256
"set t_Co=16
"let g:solarized_termcolors=256
"let g:solarized_termcolors=16
"let g:solarized_termtrans=0


execute pathogen#infect()

filetype plugin indent on
syntax on
"syntax enable

set nocompatible

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

"let g:virtualenv_directory = '/home/utylee/00-Projects/venv-tyTrader'

"------------------------------------------------------------------------
" Crystalline
function! StatusLine(current, width)
  let l:s = ''

  if a:current
    let l:s .= crystalline#mode() . crystalline#right_mode_sep('')
  else
    let l:s .= '%#CrystallineInactive#'
  endif
  let l:s .= ' %f%h%w%m%r '
  if a:current
    " let l:s .= crystalline#right_sep('', 'Fill') . ' %{fugitive#head()}'
  endif

  if a:current
    let l:s .= ' %{tagbar#currenttag(" %s\ ","")}'
    "let l:s .= crystalline#right_sep('', 'Fill') . ' %{tagbar#currenttag(" %s\ ","")}'
"set statusline+=%{tagbar#currenttag('[%s]\ ','')}
  endif

  let l:s .= '%='
  if a:current
    let l:s .= crystalline#left_sep('', 'Fill') . ' %{&paste ?"PASTE ":""}%{&spell?"SPELL ":""}'
    let l:s .= crystalline#left_mode_sep('')
  endif
  if a:width > 80
    let l:s .= ' %{&ft}[%{&fenc!=#""?&fenc:&enc}][%{&ff}] %l/%L %c%V %P '
  else
    let l:s .= ' '
  endif

  return l:s
endfunction

function! TabLine()
  let l:vimlabel = has('nvim') ?  ' NVIM ' : ' VIM '
  return crystalline#bufferline(2, len(l:vimlabel), 1) . '%=%#CrystallineTab# ' . l:vimlabel
endfunction


let g:crystalline_enable_sep = 1
let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_tabline_fn = 'TabLine'
"let g:crystalline_theme = 'default'
"let g:crystalline_theme = 'molokai'
let g:crystalline_theme = 'onedark'
" let g:crystalline_theme = 'gruvbox'

set showtabline=2
set guioptions-=e
set laststatus=2

"let g:jedi#auto_initialization = 1 
"let g:jedi#squelch_py_warning = 1
"let g:jedi#completions_command = "<C-N>"

" emmet-vim 을 html과 css에서만 사용하는 설정

"let g:user_emmet_install_global = 0
"autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<C-Q>'
noremap <C-Y>k vat<Esc>da>`<da>


let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.jsx,*.js"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js,*.erb'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'


au BufRead,BufNewFile */etc/nginx/* set ft=nginx
au BufRead,BufNewFile */nginx/* set ft=nginx

set noundofile
set number
set cul
set ignorecase
set shiftwidth=4
set softtabstop=4
set nobackup
set noswapfile
"no equalalways or equalalways --> split 화면에서 사이즈 유즈 관련 세팅
set noea 

" 현재 파일의 디렉토리로 이동
"set autochdir
" 만약 플러긴에서 문제가 생긴다면 아래대안을 사용할 것
"nnoremap ,cd :cd %:p:h<CR> 

if has("gui_running")
	"set lines=55
"	set columns=120
"	au GUIEnter * winpos 300 0
"
	"set guioptions -=T
	"set guioptions -=m
	set fullscreen
endif

set noshellslash
"map <F5> : !python3 %<CR>
"nmap <leader>e :!python3 %<CR>
"nmap <leader>e :!python3 '%:p'<CR>
"nmap <leader>e :set shellcmdflag=-ic <CR> :!ts python '%'<CR> <CR> :set shellcmdflag=-c<CR>
nmap <leader>ee :!ts python '%:p' 2>/dev/null<CR> <CR>
nmap <leader>er :!ts npm run dev<CR> <CR>
"nmap <leader>er :!ts cargo run -j6<CR> <CR>
nmap <leader>ew :!ts tsc '%:p' 2>/dev/null<CR> <CR>
"nmap <leader>w :!ts cargo build --release<CR> <CR>
nmap <leader>w :!ts cargo run -j6<CR> <CR>
"nmap <leader>w :!ts rustc '%:t' 2>/dev/null<CR> <CR>
"nmap <leader>e :!ts python '%' 2>/dev/null<CR> <CR>
"현재 행을 실행하는 커맨드인데 공백제거가 안돼 아직 제대로 되지 않습니다
"nmap <leader>r :Rooter<CR>
let g:rooter_manual_only = 1
"nmap <leader>w :exec '!ts python -c \"'getline('.')'\"'<CR>
nmap <leader>` :set fullscreen<CR>

"nmap <leader>qq :bd!<CR>
"nmap <leader>qa :%bd!<CR>
"nmap <leader>qc :cclose<CR>
nmap <leader>q :bd!<CR>
nmap ,q :%bd!<CR>
nmap ,c :cclose<CR>
nmap ,r :syntax sync fromstart<CR>
" ;의 반대방향 역할을 하는 ,키를 더블클릭으로 사용하기 위함입니다
nnoremap ,, ,			

nmap ;z :cd %:p:h<cr> :pwd<cr>
nmap ;Z :ProsessionDelete<cr>
nmap ;r :Rooter<CR>
nnoremap ;; ;

nmap <leader>c :!ts C-c<CR> <CR>
"map <F7> :NERDTreeTabsToggle<CR>
"map <F2> :NERDTreeToggle<CR>
"nmap <leader>2 :NERDTreeToggle<CR>
nmap <leader>11 :e $MYVIMRC<CR>
"nmap <leader>3 :GitGutterToggle<CR>
"nmap <leader>5 :syntax sync fromstart<CR>
map <A-3> :tabnext<CR>
map <A-4> :tabprevious<CR>
"map <F3> :cn<CR>
"map <F4> :cp<CR>
"ex) :ccl<CR>       "Close the search result windows

"map <c-j> <c-w>j
"map <c-k> <c-w>k
"map <c-h> <c-w>h
"map <c-l> <c-w>l
"map <C-T> :tabnew<CR>:wincmd w<CR>

" 현재파일의 디렉토리로 변경 %->  상대경로파일명, :p-> 절대경로파일명, :h->
" 한마디전으로

"nmap <leader>z :cd %:p:h<cr> :pwd<cr>
"nmap <leader>Z :ProsessionDelete<cr>


" Use a leader instead of the actual named binding

"nmap <leader>v :Marks<cr>
"nmap ;a :Rg<cr>
"nmap ;s :Tags<cr>
"nmap ;d :BTags<cr>
"nmap ;k :BLines<cr>
"nmap ;l :Lines<cr>
""nmap <leader>g :ProjectFiles<cr>
"nmap ;f :Files<cr>
"nmap ;ud :BTags <C-R><C-W><CR>
"nmap ;us :Tags <C-R><C-W><CR>
"nmap ;ua :Rg <C-R><C-W><CR>
"nmap ;ul :Lines <C-R><C-W><CR>
"nmap ;uk :BLines <C-R><C-W><CR>

"nmap <leader>v :Marks<cr>
nmap <leader>a :Rg<cr>
nmap <leader>s :Tags<cr>
nmap <leader>d :BTags<cr>
nmap <leader>k :BLines<cr>
nmap <leader>l :Lines<cr>

command! Dirs call fzf#run(fzf#wrap({'source': 'fd --type d --hidden --color=always', 'sink': 'edit'}))
nmap <leader>fa :Files<cr>
nmap <leader>ff :Dirs<cr>
nmap <leader>fg :ProjectFiles<cr>
" vim-rooter 후 파일찾기를 하는 방법도 있습니다
"nmap <leader>f :Files<cr>
nmap <silent> <leader>ud :BTags <C-R><C-W><CR>
nmap <silent> <Leader>us :Tags <C-R><C-W><CR>
nmap <silent> <Leader>ua :Rg <C-R><C-W><CR>
nmap <silent> <leader>uf :Files <C-R><C-W><CR>
nmap <silent> <Leader>ul :Lines <C-R><C-W><CR>
nmap <silent> <Leader>uk :BLines <C-R><C-W><CR>

"command history
nmap <C-s>s :History:<cr>
"search histrory
nmap <C-s>f :History/<cr>
"search snippet
nmap <C-s>n :Snippets<cr>

" for vim-fugitive
nmap <leader>gd :Gdiffsplit<cr>
nmap <leader>gv :Gvdiffsplit<cr>
nmap <leader>gb :Git blame<cr>
nmap <leader>gw :Gwrite<cr>
nmap <leader>gr :Gread<cr>
"from fzf
nmap <leader>gc :BCommits<cr>	
nmap <leader>gx :Commits<cr>	

"nmap <silent> <Leader>g :BTags <C-R><C-W><CR>
"nmap <silent> <Leader>h :Tags <C-R><C-W><CR>
"nmap <silent> <Leader>j :Rg <C-R><C-W><CR>
"nmap <silent> <Leader>; :Lines <C-R><C-W><CR>
"
nmap <leader>x :Ag<cr>
nmap <leader>b :Buffers<cr>
nmap <leader>t :History<cr>		

" Split size change
nmap <leader>- :resize -5<cr>
nmap <leader>= :resize +5<cr>

"d로 삭제시에 레지스터로 복사되는 것을 금지합니다
"noremap d "_d
"noremap dd "_dd
"noremap p "0p

"colorscheme molokai "oreilly jellybeans sweyla1 
"colorscheme oreilly "oreilly jellybeans sweyla1 
"colorscheme monokai "oreilly jellybeans sweyla1 
"set background=dark
"colorscheme solarized 
" colorscheme solarized_sd_utylee
set background=dark
" let g:gruvbox_italic = 1
" colorscheme gruvbox
let g:selenized_green_keywords=1
colorscheme selenized




"let python_no_builtin_highlight = 1  
"let g:molokai_original = 1


" Save current view settings on a per-window, per-buffer basis.
function! AutoSaveWinView()
    if !exists("w:SavedBufView")
        let w:SavedBufView = {}
    endif
    let w:SavedBufView[bufnr("%")] = winsaveview()
endfunction

" Restore current view settings.
function! AutoRestoreWinView()
    let buf = bufnr("%")
    if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
        let v = winsaveview()
        let atStartOfFile = v.lnum == 1 && v.col == 0
        if atStartOfFile && !&diff
            call winrestview(w:SavedBufView[buf])
        endif
        unlet w:SavedBufView[buf]
    endif
endfunction

" When switching buffers, preserve window view.
if v:version >= 700
    autocmd BufLeave * call AutoSaveWinView()
    autocmd BufEnter * call AutoRestoreWinView()
endif

"autocmd BufNewFile,BufRead *.qml so c:\vim\vim74\ftplugin\qml.vim
autocmd BufNewFile,BufRead *.qml setf qml 


set langmenu=utf8
"lang mes en_US 
"set langmenu=en_US.UTF-8
set tabstop=4
set encoding=utf8
set fileencodings=utf-8,cp949
"set langmenu=cp949
"set guifont=나눔고딕코딩:h12:cHANGEUL
"set guifontwide=나눔고딕코딩:h12:cHANGEUL
"set guifont=Lucida\ Console:h11:cDEFAULT
"set guifont=Consolas:h10.15:cDEFAULT
"set guifont=Consolas:h10.2:cANSI
"set guifont=Ubuntu\ Mono\ for\ Powerline:h15:cANSI
"set guifont=Ubuntu\ Mono:h15:cANSI
"set guifont=Ubuntu\ Mono\ derivative\ Powerline:h18.3
"set guifontwide=NanumGothicCoding:h23
set guifont=Ubuntu\ Mono\ derivative\ Powerline:h19
"set font=Ubuntu\ Mono\ derivative\ Powerline:h19
set guifontwide=NanumGothicCoding:h24
"set guifontwide=NanumGothicCoding:h15:cDEFAULT
"set guifontwide=Ubuntu:h15:cDEFAULT

