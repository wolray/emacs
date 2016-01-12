
;; C-

(global-set-key (kbd "C-d") 'delete-pair)
(define-key key-translation-map (kbd "C-v") (kbd "C-o"))
(define-key key-translation-map (kbd "C-z") (kbd "C-/"))
(define-key key-translation-map (kbd "C-`") (kbd "C-u"))
(define-key key-translation-map (kbd "C-<tab>") (kbd "C-x o"))

(global-set-key (kbd "C-\\") 'delete-indentation)
(global-set-key (kbd "C-M-\\") 'delete-blank-lines)

(global-set-key (kbd "C-<return>") 'my-insert-paragraph)
(define-key key-translation-map (kbd "M-RET") (kbd "C-j"))

(define-key key-translation-map (kbd "C-f") (kbd "C-0"))
(define-key key-translation-map (kbd "C-t") (kbd "C-0"))

;; kill

(define-key key-translation-map (kbd "C-a") (kbd "C-k"))
(define-key key-translation-map (kbd "C-e") (kbd "C-y"))

(global-set-key (kbd "C-<backspace>") 'backward-kill-word)
(global-set-key (kbd "C-M-<backspace>") 'backward-kill-paragraph)
(define-key key-translation-map (kbd "C-S-<backspace>") (kbd "ESC <C-backspace>"))

(global-set-key (kbd "C-w") 'my-kill-region)
(global-set-key (kbd "M-w") 'my-kill-ring-save)

;; M-

(define-key key-translation-map (kbd "M-h") (kbd "C-h"))
(define-key key-translation-map (kbd "M-n") (kbd "C-g"))

(define-key key-translation-map (kbd "M-j") (kbd "<left>"))
(define-key key-translation-map (kbd "M-J") (kbd "C-<left>"))
(define-key key-translation-map (kbd "M-l") (kbd "<right>"))
(define-key key-translation-map (kbd "M-L") (kbd "C-<right>"))
(define-key key-translation-map (kbd "M-k") (kbd "DEL"))
(define-key key-translation-map (kbd "M-K") (kbd "C-<backspace>"))

(define-key key-translation-map (kbd "M-u") (kbd "<deletechar>"))
(define-key key-translation-map (kbd "M-i") (kbd "C-/"))
(define-key key-translation-map (kbd "M-o") (kbd "RET"))

(global-set-key (kbd "M-O") 'my-capitalize-word)
(global-set-key (kbd "M-I") 'my-downcase-word)
(global-set-key (kbd "M-U") 'my-upcase-word)

;; comment

(global-set-key (kbd "M-'") 'comment-kill)
(global-set-key (kbd "M-[") 'my-comment)

;; transpose

(global-set-key (kbd "M-p") 'my-transpose-lines-up)
(global-set-key (kbd "M-]") 'my-transpose-lines-down)
(global-set-key (kbd "M--") 'my-transpose-paragraphs-up)
(global-set-key (kbd "M-=") 'my-transpose-paragraphs-down)

;; cursor

(global-set-key (kbd "C-p") 'my-move-beginning-of-line)
(global-set-key (kbd "C-]") 'my-move-end-of-line)

(define-key key-translation-map (kbd "C-M-p") (kbd "M-{"))
(define-key key-translation-map (kbd "C-M-]") (kbd "M-}"))

(define-key key-translation-map (kbd "C-S-p") (kbd "C-M-b"))
(define-key key-translation-map (kbd "C-}") (kbd "C-M-f"))

(global-set-key (kbd "C-M-S-p") 'backward-up-list)
(global-set-key (kbd "C-M-{") 'down-list)
(global-set-key (kbd "C-M-}") 'up-list)

(define-key key-translation-map (kbd "C--") (kbd "C-<left>"))
(define-key key-translation-map (kbd "C-=") (kbd "C-<right>"))

(define-key key-translation-map (kbd "C-M--") (kbd "<up>"))
(define-key key-translation-map (kbd "C-M-=") (kbd "<down>"))

(define-key key-translation-map (kbd "C-_") (kbd "<left>"))
(define-key key-translation-map (kbd "C-+") (kbd "<right>"))

(define-key key-translation-map (kbd "C-M-_") (kbd "C-x <left>"))
(define-key key-translation-map (kbd "C-M-+") (kbd "C-x <right>"))

(define-key key-translation-map (kbd "M-P") (kbd "M-v"))
(define-key key-translation-map (kbd "M-{") (kbd "C-l"))
(define-key key-translation-map (kbd "M-}") (kbd "C-v"))

(define-key key-translation-map (kbd "M-_") (kbd "M-<"))
(define-key key-translation-map (kbd "M-+") (kbd "M->"))

(define-key key-translation-map (kbd "C-x C-a") (kbd "C-x h"))
(define-key key-translation-map (kbd "C-x C-x") (kbd "C-@"))
(define-key key-translation-map (kbd "C-M-[") (kbd "M-h"))
(define-key key-translation-map (kbd "C-{") (kbd "C-M-@"))

;; buffer

(define-key key-translation-map (kbd "C-x c") (kbd "C-x k"))
(define-key key-translation-map (kbd "C-x C-b") (kbd "C-x b"))
(global-set-key (kbd "C-x v") 'my-switch-to-minibuffer)
(global-set-key (kbd "C-x DEL") 'revert-buffer)
(global-set-key (kbd "C-x '") 'my-switch-to-buffer-scratch)
(global-set-key (kbd "C-x \\") 'my-buffer-head)
(define-key key-translation-map (kbd "C-x C-\\") (kbd "C-x C-0"))

;; window

(define-key key-translation-map (kbd "C-x -") (kbd "C-x 0"))
(define-key key-translation-map (kbd "C-x =") (kbd "C-x 1"))
(define-key key-translation-map (kbd "C-x p") (kbd "C-x 2"))
(define-key key-translation-map (kbd "C-x ]") (kbd "C-x 3"))
(define-key key-translation-map (kbd "C-x [") (kbd "C-c <left>"))

(define-key key-translation-map (kbd "C-M-<up>") (kbd "C-x ^"))
(global-set-key (kbd "C-M-<down>") 'shrink-window)
(define-key key-translation-map (kbd "C-M-<left>") (kbd "C-x {"))
(define-key key-translation-map (kbd "C-M-<right>") (kbd "C-x }"))

;; C-x

(global-set-key (kbd "C-x g") 'magit-status)
(define-key key-translation-map (kbd "C-x q") (kbd "M-%"))
(define-key key-translation-map (kbd "C-x r") (kbd "C-M-%"))

(define-key key-translation-map (kbd "C-x C-f") (kbd "C-x C-f"))
(global-set-key (kbd "C-x C-d") 'my-load-file)
(define-key key-translation-map (kbd "C-x C-d") (kbd "C-x C-d"))

(global-set-key (kbd "C-x C-p") 'my-search-whitespace-regexp)
(global-set-key (kbd "C-x C-]") 'my-ac-sources)
(define-key key-translation-map (kbd "C-x C--") (kbd "C-0"))
(define-key key-translation-map (kbd "C-x C-=") (kbd "C-0"))

;; C-c

(define-key key-translation-map (kbd "C-c ;") (kbd "C-c }"))
(define-key key-translation-map (kbd "C-c C-s") (kbd "C-c ^"))
(define-key key-translation-map (kbd "C-c C-d") (kbd "C-c /"))
(define-key key-translation-map (kbd "C-c C-z") (kbd "C-c C-z"))

(define-key key-translation-map (kbd "C-c [") (kbd "C-c C-u"))
(define-key key-translation-map (kbd "C-c C-p") (kbd "C-c C-b"))
(define-key key-translation-map (kbd "C-c C-]") (kbd "C-c C-f"))

(define-key key-translation-map (kbd "C-c C-M-p") (kbd "C-c C-x C-i"))
(define-key key-translation-map (kbd "C-c M-ESC") (kbd "C-c C-x C-q"))
(define-key key-translation-map (kbd "C-c C-M-]") (kbd "C-c C-x C-o"))

(global-set-key (kbd "C-c C--") 'my-org-evaluate-time-range)
(define-key key-translation-map (kbd "C-c C--") (kbd "C-c C--"))
(define-key key-translation-map (kbd "C-c C-=") (kbd "C-c ."))
(define-key key-translation-map (kbd "C-c C-M--") (kbd "C-c C-d"))
(define-key key-translation-map (kbd "C-c C-M-=") (kbd "C-c C-s"))

;; unset-key

(global-set-key (kbd "C-0") nil)

(define-key key-translation-map (kbd "C-h") (kbd "C-0"))

(define-key key-translation-map (kbd "C-o") (kbd "C-0"))
(define-key key-translation-map (kbd "C-l") (kbd "C-0"))
(define-key key-translation-map (kbd "C-,") (kbd "C-0"))
(define-key key-translation-map (kbd "C-.") (kbd "C-0"))
(define-key key-translation-map (kbd "C-M-o") (kbd "C-0"))
(define-key key-translation-map (kbd "C-M-0") (kbd "C-0"))

(define-key key-translation-map (kbd "C-x 0") (kbd "C-0"))
(define-key key-translation-map (kbd "C-x b") (kbd "C-0"))
(define-key key-translation-map (kbd "C-x C-0") (kbd "C-0"))

(define-key key-translation-map (kbd "M-q") (kbd "C-0"))
(define-key key-translation-map (kbd "M-e") (kbd "C-0"))
(define-key key-translation-map (kbd "M-r") (kbd "C-0"))
(define-key key-translation-map (kbd "M-t") (kbd "C-0"))

(define-key key-translation-map (kbd "M-a") (kbd "C-0"))
(define-key key-translation-map (kbd "M-d") (kbd "C-0"))
(define-key key-translation-map (kbd "M-f") (kbd "C-0"))
(define-key key-translation-map (kbd "M-g") (kbd "C-0"))

(define-key key-translation-map (kbd "M-z") (kbd "C-0"))
(define-key key-translation-map (kbd "M-c") (kbd "C-0"))
(define-key key-translation-map (kbd "M-v") (kbd "C-0"))
(define-key key-translation-map (kbd "M-b") (kbd "C-0"))

(define-key key-translation-map (kbd "M-m") (kbd "C-0"))
(define-key key-translation-map (kbd "M-,") (kbd "C-0"))
(define-key key-translation-map (kbd "M-.") (kbd "C-0"))
(define-key key-translation-map (kbd "M-/") (kbd "C-0"))

(define-key key-translation-map (kbd "M-DEL") (kbd "C-0"))
