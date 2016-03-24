;; font
(set-default-font "monaco-11")
(set-fontset-font "fontset-default" 'gb18030 "kaiti-13")

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

;; ~load
(setq default-directory "d:/sync/")
(add-to-list 'load-path "d:/sync/emacs/emacs.d/")
(load "hook.el")
(load "command.el")
(load "kbd.el")
