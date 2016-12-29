;; buffer
(delete-selection-mode 1)
(electric-pair-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(setq x-select-enable-clipboard t)
(setq-default cursor-type 'bar)
(setq-default indent-tabs-mode t)
(show-paren-mode 1)

;; font
(defmacro m-set-font (en cn)
  `(progn
     (set-default-font ,en)
     (set-fontset-font "fontset-default" 'gb18030 ,cn)))
(m-set-font "monaco-11" "楷体-13")
;; (m-set-font "ubuntu mono-13" "微软雅黑-12")

;; frame
(menu-bar-mode 0)
(tool-bar-mode 0)
(setq default-frame-alist '((height . 30)))
(setq frame-title-format "")

;; language
(set-buffer-file-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment 'chinese-gbk)

;; startup
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq make-backup-files nil)
(setq ring-bell-function 'ignore)
(setq save-abbrevs nil)

;; window
(column-number-mode 1)
(global-linum-mode 1)
(line-number-mode 1)
(scroll-bar-mode 0)
(winner-mode 1)

;; ~load
(setq default-directory default_dir)
(load "kbd.el")
(load "defun.el")
(load "version-lite.el")
(load "hook.el")
