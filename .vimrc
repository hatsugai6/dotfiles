filetype off
filetype plugin indent off

"--------------------------------------------"
" NeoBundle設定
"--------------------------------------------"
if has('vim_starting')
  set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim/
endif

"--------------------------------------------"
" Plugin
"--------------------------------------------"
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc'
" シェル実行
NeoBundle 'Shougo/vimshell'
" 総合ユーザインターフェース
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
" HTML5シンタックス
NeoBundle 'taichouchou2/html5.vim'
" CSS3シンタックス
NeoBundle 'hail2u/vim-css3-syntax'
" Sassシンタックス
NeoBundle 'cakebaker/scss-syntax.vim'
" emmet-vim
NeoBundle 'mattn/emmet-vim'
" コメントアウト
NeoBundle 'scrooloose/nerdcommenter'
" 閉じ括弧を自動化
" NeoBundle 'Townk/vim-autoclose'
" コードヒント
NeoBundle 'vim-scripts/AutoComplPop'
" エクスプローラ
NeoBundle 'scrooloose/nerdtree'
"NeoBundle 'Shougo/vimfiler'
" カラースキーマ Desert
NeoBundle 'vim-scripts/desert.vim'
" キーマッピング
NeoBundle "terryma/vim-expand-region"
" vimのテキストオブジェクト拡張
NeoBundle 'tpope/vim-surround'
" 末尾の空白を見えるようにする
NeoBundle 'bronson/vim-trailing-whitespace'
" ログの内容に色を付ける
NeoBundle 'tomtom/tcomment_vim'
" バッファマネージャ
NeoBundle 'QuickBuf'
" ファイル保存時にブラウザ自働更新
NeoBundle 'tell-k/vim-browsereload-mac'

call neobundle#end()

NeoBundleCheck

"--------------------------------------------"
" 基本設定
"--------------------------------------------"
" カラースキーマ
syntax enable
set background=dark
colorscheme desert
" 改行コードの自動認識
set fileformats=unix,dos,mac
" ビープ音を鳴らさない
set vb t_vb=
" バックスペースキーで削除できるものを指定
" indent : 行頭の空白
" eol    : 改行
" start  : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start

"--------------------------------------------"
" バックアップ関連
"--------------------------------------------"
" バックアップをとらない
"set nobackup
" ファイルの上書き前にバックアップを作る
set writebackup
" バックアップを取る
set backup
" バックアップファイルを作るディレクトリ
set backupdir=$HOME/vimbackup
" スワップファイルを作るディレクトリ
set noswapfile
" set directory=$HOME/swap

"--------------------------------------------"
" 検索関連
"--------------------------------------------"
" コマンド、検索パターンを100個まで履歴に残す
set history=100
" 検索時に大文字と小文字を区別しない
set ignorecase
" 検索時に大文字が含まれている場合は区別して検索する
set smartcase
" 最後まで検索しても先頭に戻らない
set nowrapscan
" インクリメンタルサーチをする
set incsearch

"--------------------------------------------"
" 表示関連
"--------------------------------------------"
" タイトルをウィンドウ枠に表示する
set title
" 行番号を表示する
set number
" メッセージ表示欄を２行確保
set cmdheight=2
" ルーラーを表示する
"set ruler
" タブ文字を CTRL-I で表示し、行末に $ で表示する
set list
set listchars=tab:>-
" set listchars=tab:>-,trail:-,eol:$
" 入力中のコマンドをステータスに表示する
set showcmd
" ステータスラインを常に表示
set laststatus=2
" 括弧入力時に対応する括弧を表示
set showmatch
" 対応する括弧の表示時間を2にする
set matchtime=2
" シンタックスハイライトを有効にする
"syntax on
" 検索結果文字列のハイライトを有効にする
set hlsearch
" コメント文の色を変更
highlight Comment ctermfg=DarkCyan
" コマンドライン補完を拡張モードにする
set wildmenu
" 全角記号処理
set ambiwidth=double

" 入力されているテキストの最大幅
set textwidth=0
" ウィンドウの幅より長い行は折り返して、次の行に続けて表示する
set wrap

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermbg=red guibg=#666666
au BufWinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')
au WinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')
" highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
" match ZenkakuSpace /　/

" ステータスラインに表示する情報の指定
set statusline=%n\:%y%F\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r%=<%l/%L:%p%%>
"set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" ステータスラインの色
highlight StatusLine term=NONE cterm=NONE ctermfg=black ctermbg=white

"--------------------------------------------"
" インデント
"--------------------------------------------"
" オートインデントを有効にする
set autoindent
" タブが対応する空白の数
set tabstop=2
" タブやバックスペース等の操作時にタブが対応する空白の数
"set softtabstop=2
" インデントの各段階に使われる空白の数
set shiftwidth=2
" タブを挿入するときに代わりに空白を使わない
"set noexpandtab
" 空白を挿入する時に適切な空白を使う
set expandtab
" 新しい行を作った時に高度な自動インデントを行う
set smartindent
" 行頭の余白内で Tab を打ち込むと、shiftwidth の数だけインデントする
set smarttab
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" カウントアップ、カウントダウンを10進数と認識させる
set nrformats-=octal

"--------------------------------------------"
" 国際化関連
"--------------------------------------------"
" 文字コードの指定
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp,sjis,cp932,euc-jp,cp20932
"set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileencodings+=,ucs-2le,ucs-2,utf-8

"--------------------------------------------"
" オートコマンド
"--------------------------------------------"
if has("autocmd")
    " ファイルタイプ別インデント、プラグインを有効にする
    filetype plugin indent on
    " カーソル位置を記憶する
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line ("$") |
        \   exe "normal g`\"" |
        \ endif
endif

"--------------------------------------------"
" その他
"--------------------------------------------"
" バッファを切り替えてもundoの効力を失わない
set hidden
" 起動時のメッセージを表示しない
set shortmess+=I
" 分割窓は下に表示
set splitbelow
" 分割窓は右に表示
set splitright

" 貼り付け時の崩れ防止
" :set paste自動化、ノーマルモードからの貼り付け可
if &term =~ "xterm"
	let &t_ti .= "\e[?2004h"
	let &t_te .= "\e[?2004l"
	let &pastetoggle = "\e[201~"

	function XTermPasteBegin(ret)
		set paste
		return a:ret
	endfunction

	noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
	inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
	cnoremap <special> <Esc>[200~ <nop>
	cnoremap <special> <Esc>[201~ <nop>
endif

" 自動コメントアウト防止
autocmd FileType * setlocal formatoptions-=ro

" マウス操作許可
set mouse=a

"--------------------------------------------"
" キーマッピング
"--------------------------------------------"
" <Leader>を<Space>に変更
let mapleader = "\<Space>"
" <Space>+wで保存
nnoremap <Leader>w :w<CR>
" <Space><Space>でビジュアルラインモード
nmap <Leader><Leader> V

" C-L: ハイライト解除
nnoremap <C-L> :nohl<CR><C-L>

" <Space><Space>: ビジュアルラインモード
nmap <Space><Space> V

" v を押すたび拡大選択, <C-v>で戻す
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" ,,: コメントトグル with NERDCommenter
let NERDSpaceDelims = 1
nmap ,, <plug>NERDCommenterToggle
vmap ,, <plug>NERDCommenterToggle

" ,is: シェルを起動 with VimShell
nnoremap <silent>,is :VimShellPop<CR>

"----------"
" C-e: NERDTreeトグル
"----------"
nnoremap <silent><C-e> :NERDTreeToggle<CR>

"-----------"
" emmet-vim
"-----------"
" !展開の言語設定 with emmet-vim
let g:user_emmet_settings = {
\   'variables': {
\       'lang': 'ja',
\       'charset': 'utf-8'
\   },
\}

"--------------"
" AutoComplPop
"--------------"
" ON/OFF
inoremap ,s <ESC>:AutoComplPopDisable<CR>
inoremap ,q <ESC>:AutoComplPopEnable<CR>
nnoremap ,s :AutoComplPopDisable<CR>
nnoremap ,q :AutoComplPopEnable<CR>

"----------"
" Unit.vim
"----------"
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリとする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを２回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

"----------------------"
" vim-browsereload-mac "
"----------------------"
let g:returnApp = "Terminal"
nmap <Space>bc :ChromeReloadStart<CR>
nmap <Space>bC :ChromeReloadStop<CR>

