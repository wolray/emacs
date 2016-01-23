
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (wheatgrass))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; startup
(setq inhibit-startup-message t)
(setq make-backup-files nil)
(setq ring-bell-function 'ignore)
(setq initial-scratch-message nil)

;; frame
(menu-bar-mode 0)
(tool-bar-mode 0)
(setq frame-title-format "")
(setq default-frame-alist '((height . 30)))

;; language
(set-language-environment 'chinese-gbk)
(set-keyboard-coding-system 'chinese-gbk)
(set-buffer-file-coding-system 'chinese-gbk)

;; font
(set-default-font "monaco-11")
(set-fontset-font "fontset-default" 'gb18030 "kaiti-13")

;; load
(setq default-directory "d:/sync/emacs/")
(add-to-list 'load-path "d:/sync/emacs/emacs.d/")
(load "hook.el")
(load "command.el")
(load "kbd.el")
