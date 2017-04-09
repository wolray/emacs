;; !
(menu-bar-mode 0)
(scroll-bar-mode 0)
(setq default-frame-alist '((height . 30)))
(setq frame-title-format "")
(setq inhibit-startup-message t)
(tool-bar-mode 0)
(when (package-installed-p 'color-theme-solarized) (load-theme 'solarized t))

;; font
((lambda (en cn)
   (set-frame-font en)
   (set-fontset-font "fontset-default" 'gb18030 cn))
 "monaco-11" "楷体-13"
 ;; "ubuntu mono-13" "微软雅黑-12"
 )

;; language
(set-buffer-file-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment 'chinese-gbk)

;; others
(delete-selection-mode)
(electric-pair-mode)
(fset 'yes-or-no-p 'y-or-n-p)
(setq select-enable-clipboard t)
(setq-default cursor-type 'bar)
(setq-default indent-tabs-mode t)
(show-paren-mode)
(setq initial-scratch-message nil)
(setq make-backup-files nil)
(setq ring-bell-function 'ignore)
(setq save-abbrevs nil)
(column-number-mode)
(line-number-mode)
(winner-mode)

;; ~ (find-file-other-window (concat (getenv "home") "\\.emacs.d\\init.el"))
(load "kbd" nil t)
(load "defun" nil t)
(load "mode" nil t)
;; (package-initialize)
;; (setq default-directory "d:/sync/")
;; (add-to-list 'load-path (concat default-directory "emacs/init"))
;; (add-to-list 'load-path (concat default-directory "emacs/symbol-overlay"))
;; (load "load" nil t)
