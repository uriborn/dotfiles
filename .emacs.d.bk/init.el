(setq load-path(cons"~/.emacs.d/elisp" load-path))
(setq load-path(cons"~/.emacs.d/elisp/conf" load-path))

; 言語を日本語にする
(set-language-environment 'Japanese)

; UTF8にする
(prefer-coding-system 'utf-8)

; 起動時の画面を出さない
(setq inhibit-startup-message t)

; デフォルトの透明度を85%にする
(add-to-list 'default-frame-alist '(alpha . 85))

; バックアップファイルを作らない
(setq backup-inhibited t)

; メニューバーを隠す
(tool-bar-mode -1)

; 時間表示
(display-time-mode 1)

; バッテリー表示
(display-battery-mode 1)

; scratchの初期メッセージを消去
(setq initial-scratch-message "")

; 行番号表示
(global-linum-mode t)

; タブをスペースで扱う
(setq-default indent-tabs-mode nil)

; タブ幅
(custom-set-variables '(tab-width 2))

; C-hをバックスペースに変更
(global-set-key "\C-h" 'delete-backward-char)

; 行末の空白を強調
(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "#b14770")

; インデント付きの改行
(global-set-key "\C-m" 'newline-and-indent)

; インデント無しの改行
(global-set-key "\C-j" 'newline)

; 選択範囲をインデント
(global-set-key "\C-c\C-i" 'indent-region)

; C-c:で選択範囲をコメントアウト
(global-set-key "\C-c:" 'comment-region)

; C-c;で選択範囲のコメントアウトを解除
(global-set-key "\C-c;" 'uncomment-region)

; C-kで行全体を削除
(setq kill-whole-line t)

; 対応する括弧をハイライト表示
(show-paren-mode 1)

;(define-key global-map "\C-z" 'scroll-down)

; 対応する括弧に % でジャンプ ← うまく読み込めずエラーになる
; (global-set-key "%" 'match-paren)
; (defun match-paren (arg)
;   "Go to the matching paren if on a paren; otherwise insert %."
;   (interactive "p")
;   (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
;         ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
;         (t (self-insert-command (or arg 1))))

; 文字色とか背景色とか
(if window-system (progn
  ;; 背景色
  (add-to-list 'default-frame-alist '(background-color . "black"))
  ;; 文字色
  (add-to-list 'default-frame-alist '(foreground-color . "white"))
  ;; カーソルの色
  (add-to-list 'default-frame-alist '(cursor-color . "yellow"))
))


;; scala-mode
(add-to-list 'load-path "~/.emacs.d/elisp/scala-mode")
(require 'scala-mode-auto)
(require 'scala-mode-feature-electric)
(add-hook 'scala-mode-hook
          (lambda ()
                      (scala-electric-mode)))

;; ensime
(add-to-list 'load-path "~/.emacs.d/elisp/ensime/elisp")
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; tabbar.el
(add-to-list 'load-path "~/.emacs.d/elisp/tabbar")
(require 'tabbar)
(tabbar-mode 1)

(global-set-key "\M-]" 'tabbar-forward)  ; 次のタブ
(global-set-key "\M-[" 'tabbar-backward) ; 前のタブ

;; グループ化しない
(setq tabbar-buffer-groups-function nil)

;; 左に表示されるボタンを無効化
(dolist (btn '(tabbar-buffer-home-button
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
                 (cons "" nil))))

;; タブ同士の間隔
(setq tabbar-separator '(0.8))

;; 外観変更
(set-face-attribute
  'tabbar-default nil
  :family (face-attribute 'default :family)
  :background (face-attribute 'mode-line-inactive :background)
  :height 0.9)
(set-face-attribute
  'tabbar-unselected nil
  :background (face-attribute 'mode-line-inactive :background)
  :foreground (face-attribute 'mode-line-inactive :foreground)
  :box nil)
(set-face-attribute
  'tabbar-selected nil
  :background (face-attribute 'mode-line :background)
  :foreground (face-attribute 'mode-line :foreground)
  :box nil)
