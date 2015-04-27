" source ~/.vimrc

set noundofile        " MacVimのundoファイルを作らない
set guifont=Sauce\ Code\ Powerline:h13
" set guifont=Ricty:h14 " フォント設定
set transparency=0    " 透明度を変更
set imdisable         " 日本語入力中に変換できなくなっちゃう件の対応

source ~/.vimrc.colors

map gw :macaction selectNextWindow:<CR>
map gW :macaction selectPreviousWindow:<CR>
