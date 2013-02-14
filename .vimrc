set nocompatible

"起動時
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    "プラグインを入れるパス
    call neobundle#rc(expand('~/.vim/bundle/'))
endif

"compile
NeoBundle 'Shougo/vimproc',{
\ 'build':{
\   'unix':'make -f make_unix.mak',
\  },
\}

"first of all,
"git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
"git clone https://github.com/Shougo/vimproc ~/.vim/bundle/vimproc

"neobundle manage itself
"to Install, ':NeoBundleInstall blah'
NeoBundleFetch 'Shougo/neobundle.vim'
"unite
NeoBundle 'Shougo/unite.vim'
"neocomplcache 補完
NeoBundle 'Shougo/neocomplcache'
"Snippet
NeoBundle 'Shougo/neosnippet'
"tab
NeoBundle 'buftabs'
"テーマいじり
":Unite colorscheme -auto-preview　がおすすめ
NeoBundle 'ujihisa/unite-colorscheme'

filetype plugin on
filetype indent off


if neobundle#exists_not_installed_bundles()
 echomsg 'Not installed bundles : ' .
  \ string(neobundle#get_not_installed_bundle_names())
 echomsg 'Please execute ":NeoBundleInstall" command.'
endif

colorscheme desert
set autoread
set cindent
set cmdheight=3
set expandtab
set hidden
set incsearch
set list
set number
set noautoindent
set smartcase
set smartindent
set showmode
set showmatch
set shiftwidth=4
set tabstop=4


"augroup InsertHook
"autocmd!
"autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
"autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
"augroup END

"-----------------------------------------------
" Buftabs
"-----------------------------------------------
" ファイル名のみ表示
let g:buftabs_only_basename=1
" タブをステータスラインに
let g:buftabs_in_statusline=1
" ハイライト
let g:buftabs_active_highlight_group="Visual"
" 次のタブ
nnoremap <silent> <SPACE>l :<C-u>bnext<CR>
" 前のタブ
nnoremap <silent> <SPACE>h :<C-u>bprevious<CR>

"-----------------------------------------------
"Unite
"-----------------------------------------------
"Uniteを挿入モードで開始
let g:unite_enable_start_insert=1

" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット？
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部マシマシ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" Esc二回でさようなら
" 一回きりのマッピングはnnoremap
" inoremapは挿入モード限定
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>


"-----------------------------------------------
"NeoComplCache
"-----------------------------------------------
" NeoComplCache　設定"
" AutoComplPopは都合が悪いので無効化
let g:acp_enableAtStartup = 0
" vim起動時にneocomplcache
let g:neocomplcache_enable_at_startup = 1
" 大文字が入力されたら大文字小文字区別を行う
let g:neocomplcache_enable_smart_case = 1
" 大文字を区切りに*が入力される ex)hogE -> hogE**
let g:neocomplcache_enable_camel_case_completion = 0
" アンダーバー補完
let g:neocomplcache_enable_underbar_completion = 1
" キャッシュする単語の最短字数
let g:neocomplcache_min_syntax_length = 3
" buffer file name pattern that locks neocomplcache. e.g. ku.vim or fuzzyfinder 
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" ディクショナリ設定
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }
" いじらないでおいたほうがいい
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" snippet起動
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
" 補完やりなおし
inoremap <expr><C-g>     neocomplcache#undo_completion()
" 一般的な文字列も補完
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? \<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? \<C-n> : \<TAB>

" <CR> :ポップアップの決定
inoremap <expr><CR>    pumvisible() ? neocomplcache#close_popup() : "\<CR>"

" <TAB> :補完候補を次に
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" <C-h>,<BS> :補完キャンセル
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
" <C-y> :ポップアップを閉じる
inoremap <expr><C-y>  neocomplcache#close_popup()
" <C-e>, <Right> :ポップアップをキャンセル
inoremap <expr><Right> pumvisible() ? neocomplcache#cancel_popup() : "\<Right>"

" 自動で最初の候補を選択（非推奨）
"let g:neocomplcache_enable_auto_select = 1

" omni補完の有効化
inoremap <expr><C-x><C-o> &filetype == 'vim' ? "\<C-x><C-v><C-p>" : neocomplcache#manual_omni_complete()

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"rubyは重いっぽいので却下
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
" Enable heavy omni completion, which require computational power and may stall the vim. 
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

