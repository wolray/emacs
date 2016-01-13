
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

(define-key key-translation-map (kbd "C-M-p") (kbd "M-{"))
(global-set-key (kbd "C-M-[") 'my-comment)
(define-key key-translation-map (kbd "C-M-]") (kbd "M-}"))

(define-key key-translation-map (kbd "M-P") (kbd "C-0"))
(define-key key-translation-map (kbd "M-{") (kbd "C-0"))
(define-key key-translation-map (kbd "M-}") (kbd "C-0"))

(global-set-key (kbd "C-S-p") 'my-transpose-lines-up)
(define-key key-translation-map (kbd "C-{") (kbd "C-l"))
(global-set-key (kbd "C-}") 'my-transpose-lines-down)

(define-key key-translation-map (kbd "C-S-M-p") (kbd "C-x <left>"))
(define-key key-translation-map (kbd "C-M-{") (kbd "C-x k"))
(define-key key-translation-map (kbd "C-M-}") (kbd "C-x <right>"))

(define-key key-translation-map (kbd "C-x C-p") (kbd "C-x 2"))
(define-key key-translation-map (kbd "C-x ESC") (kbd "C-c <left>"))
(define-key key-translation-map (kbd "C-x C-]") (kbd "C-x 3"))

(define-key key-translation-map (kbd "C-c [") (kbd "C-c C-u"))
(define-key key-translation-map (kbd "C-c C-p") (kbd "C-c C-b"))
(define-key key-translation-map (kbd "C-c C-]") (kbd "C-c C-f"))
(define-key key-translation-map (kbd "C-c C-M-p") (kbd "C-c C-x C-i"))
(define-key key-translation-map (kbd "C-c M-ESC") (kbd "C-c C-x C-q"))
(define-key key-translation-map (kbd "C-c C-M-]") (kbd "C-c C-x C-o"))

;; -/=

(define-key key-translation-map (kbd "C--") (kbd "C-<left>"))
(define-key key-translation-map (kbd "C-=") (kbd "C-<right>"))

(define-key key-translation-map (kbd "M--") (kbd "C-0"))
(define-key key-translation-map (kbd "M-=") (kbd "C-0"))

(define-key key-translation-map (kbd "C-M--") (kbd "C-M-b"))
(define-key key-translation-map (kbd "C-M-=") (kbd "C-M-f"))

(define-key key-translation-map (kbd "M-_") (kbd "C-0"))
(define-key key-translation-map (kbd "M-+") (kbd "C-0"))

(global-set-key (kbd "C-_") 'my-transpose-paragraphs-up)
(global-set-key (kbd "C-+") 'my-transpose-paragraphs-down)

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
(global-set-key (kbd "C-M-<backspace>") 'backward-kill-paragraph)
(define-key key-translation-map (kbd "C-S-<backspace>") (kbd "ESC <C-backspace>"))
(define-key key-translation-map (kbd "C-M-S-<backspace>") (kbd "C-0"))
(global-set-key (kbd "C-x C-<backspace>") 'revert-buffer)

(global-set-key (kbd "C-\\") 'delete-indentation)
(define-key key-translation-map (kbd "M-\\") (kbd "C-0"))
(global-set-key (kbd "C-M-\\") 'delete-blank-lines)
(define-key key-translation-map (kbd "C-|") (kbd "C-0"))
(global-set-key (kbd "C-x C-\\") 'my-buffer-head)

(define-key key-translation-map (kbd "C-<return>") (kbd "RET"))
(define-key key-translation-map (kbd "M-RET") (kbd "C-0"))
(global-set-key (kbd "C-M-<return>") 'my-insert-paragraph)
(define-key key-translation-map (kbd "C-S-<return>") (kbd "C-0"))

(define-key key-translation-map (kbd "C-;") (kbd "M-v"))
(define-key key-translation-map (kbd "C-'") (kbd "C-v"))
(define-key key-translation-map (kbd "M-;") (kbd "M-"))
(global-set-key (kbd "M-'") 'comment-kill)
(define-key key-translation-map (kbd "C-M-;") (kbd "M-;"))
(define-key key-translation-map (kbd "C-M-'") (kbd "M-'"))
(define-key key-translation-map (kbd "C-:") (kbd "M-<"))
(define-key key-translation-map (kbd "C-\"") (kbd "M->"))
(define-key key-translation-map (kbd "C-M-:") (kbd "C-0"))
(define-key key-translation-map (kbd "C-M-\"") (kbd "C-0"))

(define-key key-translation-map (kbd "C-c ;") (kbd "C-c }"))
(define-key key-translation-map (kbd "C-c '") (kbd "C-c '"))

;; j/k/l

(define-key key-translation-map (kbd "M-h") (kbd "C-h"))

(define-key key-translation-map (kbd "C-j") (kbd "<left>"))
(define-key key-translation-map (kbd "M-j") (kbd "<left>"))
(define-key key-translation-map (kbd "C-k") (kbd "DEL"))
(define-key key-translation-map (kbd "M-k") (kbd "DEL"))
(define-key key-translation-map (kbd "C-l") (kbd "<right>"))
(define-key key-translation-map (kbd "M-l") (kbd "<right>"))

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
(define-key key-translation-map (kbd "C-x C-e") (kbd "C-x C-e"))
(global-set-key (kbd "C-f") 'delete-pair)
(define-key key-translation-map (kbd "C-n") (kbd "n"))
(define-key key-translation-map (kbd "C-t") (kbd "C-0"))
(define-key key-translation-map (kbd "C-v") (kbd "C-o"))
(define-key key-translation-map (kbd "C-y") (kbd "y"))
(define-key key-translation-map (kbd "C-z") (kbd "C-/"))

(define-key key-translation-map (kbd "C-`") (kbd "C-u"))
(define-key key-translation-map (kbd "C-<tab>") (kbd "C-x o"))

;; C-x

(global-set-key (kbd "C-x g") 'magit-status)
(define-key key-translation-map (kbd "C-x q") (kbd "M-%"))
(define-key key-translation-map (kbd "C-x r") (kbd "C-M-%"))

(define-key key-translation-map (kbd "C-x C-a") (kbd "C-x h"))
(define-key key-translation-map (kbd "C-x C-b") (kbd "C-x b"))
(define-key key-translation-map (kbd "C-x C-f") (kbd "C-x C-f"))
(global-set-key (kbd "C-x C-d") 'my-load-file)
(define-key key-translation-map (kbd "C-x C-d") (kbd "C-x C-d"))
(global-set-key (kbd "C-x C-v") 'my-switch-to-minibuffer)
(define-key key-translation-map (kbd "C-x C-v") (kbd "C-x C-v"))
(global-set-key (kbd "C-x C-o") 'my-switch-to-buffer-scratch)
(define-key key-translation-map (kbd "C-x C-o") (kbd "C-x C-o"))
(define-key key-translation-map (kbd "C-c C-z") (kbd "C-c C-z"))

(define-key key-translation-map (kbd "C-x b") (kbd "C-0"))
(define-key key-translation-map (kbd "C-x k") (kbd "C-0"))
(define-key key-translation-map (kbd "C-x DEL") (kbd "C-0"))

;; C-c

(define-key key-translation-map (kbd "C-c C-s") (kbd "C-c ^"))
(define-key key-translation-map (kbd "C-c C-d") (kbd "C-c /"))

;; M-

(define-key key-translation-map (kbd "M-q") (kbd "C-0"))
(define-key key-translation-map (kbd "M-e") (kbd "C-0"))
(define-key key-translation-map (kbd "M-r") (kbd "C-0"))
(define-key key-translation-map (kbd "M-t") (kbd "C-0"))

(define-key key-translation-map (kbd "M-a") (kbd "C-0"))
(define-key key-translation-map (kbd "M-s") (kbd "C-0"))
(define-key key-translation-map (kbd "M-d") (kbd "C-0"))
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
