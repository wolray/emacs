;; buffer
(delete-selection-mode 1)
(electric-pair-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(setq x-select-enable-clipboard t)
(setq-default cursor-type 'bar)
(setq-default indent-tabs-mode t)
(show-paren-mode 1)

;; font
(if (string= system-name "LAB")
    (progn
      (set-default-font "monaco-10")
      (set-fontset-font "fontset-default" 'gb18030 "kaiti-12"))
  (progn
    (set-default-font "monaco-11")
    (set-fontset-font "fontset-default" 'gb18030 "kaiti-13")))

;; frame
(menu-bar-mode 0)
(tool-bar-mode 0)
(setq default-frame-alist '((height . 30)))
(setq frame-title-format "")

;; language
(set-buffer-file-coding-system 'chinese-gbk)
(set-keyboard-coding-system 'chinese-gbk)
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
(setq default-directory "d:/sync/")
(add-to-list 'load-path "d:/sync/emacs.d/")
(load "command.el")
(load "kbd.el")
(load "hook.el")
