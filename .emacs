(set-language-environment 'English)
(customize-set-variable 'scroll-bar-mode 'right)
(add-to-list 'load-path "~/.emacs.d/")

;; https://github.com/sellout/emacs-color-theme-solarized
;; http://www.nongnu.org/color-theme/
(when (display-graphic-p)
  (require 'color-theme)
  (color-theme-initialize)
  (load-file "~/.emacs.d/color-theme-irblack.el")
  (color-theme-irblack)

  (when (eq system-type 'darwin)
    (set-face-attribute
     'default nil :font "Ubuntu Mono 14")

    ;; Chinese Font
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font)
			charset
			(font-spec :family "Hiragino Sans GB" :size 14)))))

;; Mac 下置换 option 和 command 键
;(when (eq system-type 'darwin)
;  (setq mac-command-modifier 'meta)
;  (setq mac-option-modifier 'super))

;; 一打开就起用 text 模式。 
(setq default-major-mode 'text-mode)

;; 语法高亮
(global-font-lock-mode t)

;; 以 y/n代表 yes/no
(fset 'yes-or-no-p 'y-or-n-p) 

;; 显示括号匹配 
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; 去掉工具栏
(tool-bar-mode nil)
(when (eq system-type 'darwin)
  (ns-toggle-toolbar))

;; 显示列号
(setq column-number-mode t)
(setq line-number-mode t)

;; 设置默认tab宽度为2
(setq tab-width 2
      indent-tabs-mode t
      c-basic-offset 2)

;; https://github.com/thomblake/js3-mode
;; don't forget to M-x byte-compile-file RET ~/.emacs.d/js3.el RET
;;;Add the following custom-set-variables to use 'lazy' modes
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(js3-lazy-commas t)
 '(js3-lazy-operators t)
 '(js3-lazy-dots t)
 '(js3-expr-indent-offset 2)
 '(js3-paren-indent-offset 2)
 '(js3-square-indent-offset 2)
 '(js3-curly-indent-offset 2)
)

(autoload 'js3-mode "js3" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js3-mode))

;; https://github.com/winterTTr/ace-jump-mode
;;
;; ace jump mode major function
;; 

(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; you can select the key you prefer to
(define-key global-map (kbd "C-c C-c") 'ace-jump-mode)



;; 
;; enable a more powerful jump back function from ace jump mode
;;
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-c C-v") 'ace-jump-mode-pop-mark)
