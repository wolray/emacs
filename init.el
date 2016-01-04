
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

;; 

(setq default-directory "d:/sync/emacs/")
(load "~/.emacs.d/init-kbd.el")
(setq inhibit-startup-message t)
(setq make-backup-files nil)
(setq ring-bell-function 'ignore)
(setq initial-scratch-message nil)
(setq default-frame-alist '((height . 30)))
(setq search-whitespace-regexp ".*?")

;; 

(setq frame-title-format "")
(tool-bar-mode 0)
(menu-bar-mode 0)

;; 

(column-number-mode 1)
(line-number-mode 1)
(scroll-bar-mode 0)
(winner-mode 1)
(require 'linum)
(global-linum-mode 1)

;; 

(add-hook 'org-mode-hook (lambda () (setq truncate-lines t)))
(show-paren-mode 1)
(delete-selection-mode 1)
(setq-default indent-tabs-mode t)
(setq x-select-enable-clipboard t)

;; 

(set-default-font "monaco-11")
(set-fontset-font "fontset-default" 'gb18030 "kaiti-13")

;; 

(set-language-environment 'chinese-gbk)
(set-keyboard-coding-system 'chinese-gbk-dos)
(set-buffer-file-coding-system 'chinese-gbk-dos)

;; 

(setq org-startup-indented t)
(setq org-support-shift-select t)
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

;; 

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; 

(global-auto-complete-mode t)
(ac-linum-workaround)
(setq ac-auto-start nil)
(ac-set-trigger-key "<tab>")
(set-default 'ac-sources
	     '(ac-source-words-in-same-mode-buffers
	       ac-source-functions
	       ))
(add-hook 'org-mode-hook 'auto-complete-mode)
(add-hook 'matlab-mode-hook 'auto-complete-mode)
