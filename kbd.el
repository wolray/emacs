
(global-set-key (kbd "C-0") nil)
(global-set-key (kbd "M-0") nil)
(define-key key-translation-map (kbd "C-M-0") (kbd "C-0"))
(define-key key-translation-map (kbd "C-x 0") (kbd "C-0"))
(define-key key-translation-map (kbd "C-x C-0") (kbd "C-0"))

;; p/]

(global-set-key (kbd "C-p") 'my-move-beginning-of-line)
(global-set-key (kbd "C-]") 'my-move-end-of-line)

(define-key key-translation-map (kbd "M-p") (kbd "C-0"))
(define-key key-translation-map (kbd "M-[") (kbd "C-0"))
(define-key key-translation-map (kbd "M-]") (kbd "C-0"))

(global-set-key (kbd "C-S-p") 'my-transpose-lines-up)
(global-set-key (kbd "C-{") 'my-comment)
(global-set-key (kbd "C-}") 'my-transpose-lines-down)

(define-key key-translation-map (kbd "M-P") (kbd "C-0"))
(define-key key-translation-map (kbd "M-{") (kbd "C-0"))
(define-key key-translation-map (kbd "M-}") (kbd "C-0"))

(define-key key-translation-map (kbd "C-M-p") (kbd "M-{"))
(define-key key-translation-map (kbd "C-M-[") (kbd "C-l"))
(define-key key-translation-map (kbd "C-M-]") (kbd "M-}"))

(define-key key-translation-map (kbd "C-M-S-p") (kbd "M-v"))
(global-set-key (kbd "C-M-{") 'my-beginning-and-end-of-buffer)
(define-key key-translation-map (kbd "C-M-}") (kbd "C-v"))

(define-key key-translation-map (kbd "C-x p") (kbd "C-0"))
(define-key key-translation-map (kbd "C-x [") (kbd "C-c <left>"))
(define-key key-translation-map (kbd "C-x ]") (kbd "C-0"))
(define-key key-translation-map (kbd "C-x C-p") (kbd "C-x 2"))
(define-key key-translation-map (kbd "C-x ESC") (kbd "C-c <left>"))
(define-key key-translation-map (kbd "C-x C-]") (kbd "C-x 3"))

(define-key key-translation-map (kbd "C-c C-M-p") (kbd "C-c C-x C-i"))
(define-key key-translation-map (kbd "C-c M-ESC") (kbd "C-c C-x C-q"))
(define-key key-translation-map (kbd "C-c C-M-]") (kbd "C-c C-x C-o"))

;; -/=

(define-key key-translation-map (kbd "C--") (kbd "C-<left>"))
(define-key key-translation-map (kbd "C-=") (kbd "C-<right>"))

(define-key key-translation-map (kbd "M--") (kbd "C-0"))
(define-key key-translation-map (kbd "M-=") (kbd "C-0"))

(define-key key-translation-map (kbd "C-_") (kbd "C-M-b"))
(define-key key-translation-map (kbd "C-+") (kbd "C-M-f"))

(define-key key-translation-map (kbd "M-_") (kbd "C-0"))
(define-key key-translation-map (kbd "M-+") (kbd "C-0"))

(global-set-key (kbd "C-M--") 'my-transpose-paragraphs-up)
(global-set-key (kbd "C-M-=") 'my-transpose-paragraphs-down)

(global-set-key (kbd "C-M-_") 'backward-up-list)
(global-set-key (kbd "C-M-+") 'up-list)

(define-key key-translation-map (kbd "C-x C--") (kbd "C-x 0"))
(define-key key-translation-map (kbd "C-x C-=") (kbd "C-x 1"))

(global-set-key (kbd "C-c C--") 'my-org-evaluate-time-range)
(define-key key-translation-map (kbd "C-c C--") (kbd "C-c C--"))
(define-key key-translation-map (kbd "C-c C-=") (kbd "C-c ."))
(define-key key-translation-map (kbd "C-c C-M--") (kbd "C-c C-d"))
(define-key key-translation-map (kbd "C-c C-M-=") (kbd "C-c C-s"))

;; \\

(global-set-key (kbd "C-<backspace>") 'backward-kill-word)
(define-key key-translation-map (kbd "M-DEL") (kbd "C-0"))
(define-key key-translation-map (kbd "C-S-<backspace>") (kbd "ESC <C-backspace>"))
(global-set-key (kbd "C-M-<backspace>") 'backward-kill-paragraph)
(define-key key-translation-map (kbd "C-M-S-<backspace>") (kbd "C-0"))
(global-set-key (kbd "C-x C-<backspace>") 'revert-buffer)

(global-set-key (kbd "C-\\") 'delete-indentation)
(define-key key-translation-map (kbd "M-\\") (kbd "C-0"))
(global-set-key (kbd "C-|") 'delete-blank-lines)
(define-key key-translation-map (kbd "M-|") (kbd "C-0"))
(global-set-key (kbd "C-M-\\") 'my-buffer-head)
(define-key key-translation-map (kbd "C-M-|") (kbd "C-0"))
(define-key key-translation-map (kbd "C-x C-\\") (kbd "C-x k"))

(global-set-key (kbd "C-<return>") 'newline)
(define-key key-translation-map (kbd "M-RET") (kbd "C-0"))
(global-set-key (kbd "C-S-<return>") 'my-insert-paragraph)
(define-key key-translation-map (kbd "C-M-<return>") (kbd "C-0"))

(define-key key-translation-map (kbd "C-;") (kbd "C-x <left>"))
(define-key key-translation-map (kbd "C-'") (kbd "C-x <right>"))
(define-key key-translation-map (kbd "M-;") (kbd "M-;"))
(global-set-key (kbd "M-'") 'comment-kill)
(define-key key-translation-map (kbd "C-M-;") (kbd "M-;"))
(define-key key-translation-map (kbd "C-M-'") (kbd "M-'"))

(define-key key-translation-map (kbd "C-c ;") (kbd "C-c }"))
(define-key key-translation-map (kbd "C-c '") (kbd "C-c '"))

;; j/k/l

(define-key key-translation-map (kbd "M-h") (kbd "C-h"))

(define-key key-translation-map (kbd "C-j") (kbd "<left>"))
(global-set-key (kbd "M-j") 'left-char)
(define-key ac-complete-mode-map (kbd "M-j") 'ac-previous)
(define-key key-translation-map (kbd "C-k") (kbd "DEL"))
(define-key key-translation-map (kbd "M-k") (kbd "DEL"))
(define-key key-translation-map (kbd "C-l") (kbd "<right>"))
(global-set-key (kbd "M-l") 'right-char)
(define-key ac-complete-mode-map (kbd "M-l") 'ac-next)

(define-key key-translation-map (kbd "C-S-j") (kbd "C-<left>"))
(define-key key-translation-map (kbd "M-J") (kbd "C-<left>"))
(define-key key-translation-map (kbd "C-S-k") (kbd "C-<backspace>"))
(define-key key-translation-map (kbd "M-K") (kbd "C-<backspace>"))
(define-key key-translation-map (kbd "C-S-l") (kbd "C-<right>"))
(define-key key-translation-map (kbd "M-L") (kbd "C-<right>"))

(define-key key-translation-map (kbd "C-M-j") (kbd "C-0"))
(define-key key-translation-map (kbd "C-M-k") (kbd "C-0"))
(define-key key-translation-map (kbd "C-M-l") (kbd "C-0"))

;; u/i/o

(define-key key-translation-map (kbd "C-u") (kbd "<deletechar>"))
(define-key key-translation-map (kbd "M-u") (kbd "<deletechar>"))
(define-key key-translation-map (kbd "C-o") (kbd "RET"))
(define-key key-translation-map (kbd "M-o") (kbd "RET"))

(global-set-key (kbd "C-S-o") 'my-capitalize-word)
(global-set-key (kbd "M-O") 'my-capitalize-word)
(global-set-key (kbd "C-S-i") 'my-downcase-word)
(global-set-key (kbd "M-I") 'my-downcase-word)
(global-set-key (kbd "C-S-u") 'my-upcase-word)
(global-set-key (kbd "M-U") 'my-upcase-word)

(define-key key-translation-map (kbd "C-M-o") (kbd "C-0"))
(define-key key-translation-map (kbd "C-M-u") (kbd "C-0"))
(define-key key-translation-map (kbd "C-M-i") (kbd "C-0"))

;; C-

(global-set-key (kbd "C-f") 'ace-jump-buffer)
(global-set-key (kbd "C-S-f") 'ace-jump-buffer-other-window)

(global-set-key (kbd "C-w") 'my-kill-region)
(global-set-key (kbd "M-w") 'my-kill-ring-save)
(global-set-key (kbd "C-M-w") 'my-kill-ring-save)

(define-key key-translation-map (kbd "C-M-<up>") (kbd "C-x ^"))
(global-set-key (kbd "C-M-<down>") 'shrink-window)
(define-key key-translation-map (kbd "C-M-<left>") (kbd "C-x {"))
(define-key key-translation-map (kbd "C-M-<right>") (kbd "C-x }"))

(define-key key-translation-map (kbd "C-a") (kbd "C-k"))
(define-key key-translation-map (kbd "C-d") (kbd "C-@"))
(define-key key-translation-map (kbd "C-e") (kbd "C-y"))
(define-key key-translation-map (kbd "C-h") (kbd "C-0"))
(define-key key-translation-map (kbd "C-n") (kbd "n"))
(global-set-key (kbd "C-t") 'delete-pair)
(define-key key-translation-map (kbd "C-v") (kbd "C-o"))
(define-key key-translation-map (kbd "C-y") (kbd "y"))
(define-key key-translation-map (kbd "C-z") (kbd "C-/"))

(define-key key-translation-map (kbd "C-`") (kbd "C-u"))
(define-key key-translation-map (kbd "C-<tab>") (kbd "C-x o"))

;; C-1/2/3

(global-set-key (kbd "C-1") 'my-ac-sources)
(global-set-key (kbd "C-2") 'my-search-whitespace-regexp)

;; C-x

(global-set-key (kbd "C-x g") 'magit-status)
(define-key key-translation-map (kbd "C-x q") (kbd "M-%"))
(define-key key-translation-map (kbd "C-x r") (kbd "C-M-%"))

(define-key key-translation-map (kbd "C-x C-a") (kbd "C-x h"))
(define-key key-translation-map (kbd "C-x C-f") (kbd "C-x C-f"))
(global-set-key (kbd "C-x C-d") 'my-load-file)
(define-key key-translation-map (kbd "C-x C-d") (kbd "C-x C-d"))
(define-key key-translation-map (kbd "C-x C-e") (kbd "C-x C-e"))
(global-set-key (kbd "C-x C-v") 'my-switch-to-minibuffer)
(define-key key-translation-map (kbd "C-x C-v") (kbd "C-x C-v"))
(define-key key-translation-map (kbd "C-x C-o") (kbd "C-x C-o"))
(define-key key-translation-map (kbd "C-x C-t") (kbd "C-x C-0"))

(define-key key-translation-map (kbd "C-x b") (kbd "C-0"))
(define-key key-translation-map (kbd "C-x k") (kbd "C-0"))
(define-key key-translation-map (kbd "C-x DEL") (kbd "C-0"))

;; C-c

(define-key key-translation-map (kbd "C-c C-s") (kbd "C-c ^"))
(define-key key-translation-map (kbd "C-c C-d") (kbd "C-c /"))
(define-key key-translation-map (kbd "C-c C-z") (kbd "C-c C-z"))

;; M-

(define-key key-translation-map (kbd "M-q") (kbd "C-0"))
(define-key key-translation-map (kbd "M-e") (kbd "C-0"))
(define-key key-translation-map (kbd "M-r") (kbd "C-0"))
(define-key key-translation-map (kbd "M-t") (kbd "C-0"))

(define-key key-translation-map (kbd "M-a") (kbd "C-0"))
(define-key key-translation-map (kbd "M-s") (kbd "C-0"))
(define-key key-translation-map (kbd "M-f") (kbd "C-0"))
(define-key key-translation-map (kbd "M-g") (kbd "C-0"))

(define-key key-translation-map (kbd "M-z") (kbd "C-0"))
(define-key key-translation-map (kbd "M-c") (kbd "C-0"))
(define-key key-translation-map (kbd "M-v") (kbd "C-0"))
(define-key key-translation-map (kbd "M-b") (kbd "C-0"))

(define-key key-translation-map (kbd "M-n") (kbd "C-0"))
(define-key key-translation-map (kbd "M-m") (kbd "C-0"))
(define-key key-translation-map (kbd "M-,") (kbd "C-0"))
(define-key key-translation-map (kbd "M-.") (kbd "C-0"))
(define-key key-translation-map (kbd "M-/") (kbd "C-0"))
