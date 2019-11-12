;; !
(menu-bar-mode 0)
(scroll-bar-mode 0)
(setq default-frame-alist '((height . 30)))
(setq frame-title-format "")
(setq inhibit-startup-message t)
(tool-bar-mode 0)
(load-theme 'adwaita t)

;; font
((lambda (en cn)
   (set-frame-font en)
   (set-fontset-font "fontset-default" 'gb18030 cn))
 ;; "ubuntu mono-13" "微软雅黑-12"
 ;; "monaco-11" "楷体-13"
 "consolas-13" "微软雅黑-13.5"
 )

;; language
(set-buffer-file-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment 'utf-8)

;; others
(column-number-mode)
(delete-selection-mode)
(electric-pair-mode)
(fset 'yes-or-no-p 'y-or-n-p)
(global-eldoc-mode 0)
(line-number-mode)
(setq initial-scratch-message nil)
(setq make-backup-files nil)
(setq ring-bell-function 'ignore)
(setq save-abbrevs nil)
(setq select-enable-clipboard t)
(setq-default cursor-type 'bar)
(setq-default indent-tabs-mode nil)
(show-paren-mode)
(winner-mode)

;; ~ init
(load "defun" nil t)
(load "kbd3" nil t)
(load "mode" nil t)
(defun open-init (&optional overwrite)
  (find-file-other-window (concat (getenv "home") "\\.emacs.d\\init.el"))
  (when overwrite
    (delete-region (point-min) (point-max))
    (insert (mapconcat 'identity
                       `("(package-initialize)"
                         ,(format "(setq default-directory \"%s:/\")" (if (equal (system-name) "MI") "c" "d"))
                         "(add-to-list 'load-path (concat default-directory \"emacs/init\"))"
                         "(add-to-list 'load-path (concat default-directory \"emacs/symbol-overlay\"))"
                         "(add-to-list 'load-path (concat default-directory \"emacs/code-style\"))"
                         "(add-to-list 'load-path (concat default-directory \"emacs/yacua\"))"
                         "(load \"load\" nil t)")
                       "\n"))))
;; (open-init)
;; (open-init t)
