
;; C-

(define-key key-translation-map (kbd "C-v") (kbd "C-o"))
(define-key key-translation-map (kbd "C-z") (kbd "C-/"))
(define-key key-translation-map (kbd "C-`") (kbd "C-u"))
(define-key key-translation-map (kbd "C-<tab>") (kbd "C-x o"))
(global-set-key (kbd "C-\\") 'delete-indentation)

(global-set-key (kbd "C-<return>") 'my-newline)
(define-key key-translation-map (kbd "M-RET") (kbd "C-j"))

;; kill

(define-key key-translation-map (kbd "C-a") (kbd "C-k"))
(define-key key-translation-map (kbd "C-e") (kbd "C-y"))

(define-key key-translation-map (kbd "C-d") (kbd "M-d"))
(define-key key-translation-map (kbd "C-f") (kbd "C-M-k"))
(global-set-key (kbd "C-t") 'kill-paragraph)

(define-key key-translation-map (kbd "C-<backspace>") (kbd "M-DEL"))
(define-key key-translation-map (kbd "C-S-<backspace>") (kbd "ESC <C-backspace>"))
(global-set-key (kbd "C-M-<backspace>") 'backward-kill-paragraph)

(global-set-key (kbd "C-w") 'my-kill-region)
(global-set-key (kbd "M-w") 'my-kill-ring-save)

;; M-

(define-key key-translation-map (kbd "M-h") (kbd "C-h"))
(define-key key-translation-map (kbd "M-n") (kbd "C-g"))

(define-key key-translation-map (kbd "M-j") (kbd "<left>"))
(define-key key-translation-map (kbd "M-l") (kbd "<right>"))
(define-key key-translation-map (kbd "M-k") (kbd "DEL"))

(define-key key-translation-map (kbd "M-m") (kbd "C-g"))
(define-key key-translation-map (kbd "M-,") (kbd "C-/"))
(define-key key-translation-map (kbd "M-.") (kbd "RET"))

(global-set-key (kbd "M-u") 'my-upcase-word)
(global-set-key (kbd "M-o") 'my-capitalize-word)
(global-set-key (kbd "M-i") 'my-downcase-word)

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

(define-key key-translation-map (kbd "C-M-p") (kbd "C-<left>"))
(define-key key-translation-map (kbd "C-M-]") (kbd "C-<right>"))

(define-key key-translation-map (kbd "C-S-p") (kbd "C-M-b"))
(define-key key-translation-map (kbd "C-}") (kbd "C-M-f"))

(define-key key-translation-map (kbd "C-M-S-p") (kbd "<left>"))
(define-key key-translation-map (kbd "C-M-}") (kbd "<right>"))

(define-key key-translation-map (kbd "C--") (kbd "M-{"))
(define-key key-translation-map (kbd "C-=") (kbd "M-}"))

(define-key key-translation-map (kbd "C-M--") (kbd "M-v"))
(define-key key-translation-map (kbd "C-M-=") (kbd "C-v"))

(define-key key-translation-map (kbd "C-_") (kbd "C-x <left>"))
(define-key key-translation-map (kbd "C-+") (kbd "C-x <right>"))

(define-key key-translation-map (kbd "C-M-_") (kbd "C-M-S-v"))
(define-key key-translation-map (kbd "C-M-+") (kbd "C-M-v"))

;; region

(define-key key-translation-map (kbd "C-x C-x") (kbd "C-@"))
(define-key key-translation-map (kbd "C-M-[") (kbd "M-h"))
(define-key key-translation-map (kbd "C-{") (kbd "C-M-@"))

;; buffer

(define-key key-translation-map (kbd "M-+") (kbd "M->"))
(define-key key-translation-map (kbd "M-{") (kbd "C-l"))
(define-key key-translation-map (kbd "M-_") (kbd "M-<"))

(define-key key-translation-map (kbd "C-x a") (kbd "C-x h"))
(define-key key-translation-map (kbd "C-x c") (kbd "C-x k"))
(global-set-key (kbd "C-x DEL") 'revert-buffer)

(global-set-key (kbd "C-x '") 'my-switch-to-buffer-scratch)

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

(define-key key-translation-map (kbd "C-x q") (kbd "M-%"))
(define-key key-translation-map (kbd "C-x r") (kbd "C-M-%"))
(define-key key-translation-map (kbd "C-x C-f") (kbd "C-x C-f"))

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x C-\\") 'auto-complete-mode)

;; C-c

(define-key key-translation-map (kbd "C-c ;") (kbd "C-c }"))
(define-key key-translation-map (kbd "C-c C-s") (kbd "C-c ^"))
(define-key key-translation-map (kbd "C-c C-d") (kbd "C-c /"))

(define-key key-translation-map (kbd "C-c [") (kbd "C-c C-u"))
(define-key key-translation-map (kbd "C-c C-p") (kbd "C-c C-b"))
(define-key key-translation-map (kbd "C-c C-]") (kbd "C-c C-f"))

(define-key key-translation-map (kbd "C-c C-M-p") (kbd "C-c C-x C-i"))
(define-key key-translation-map (kbd "C-c M-ESC") (kbd "C-c C-x C-q"))
(define-key key-translation-map (kbd "C-c C-M-]") (kbd "C-c C-x C-o"))

(global-set-key (kbd "C-c C--") 'my-org-evaluate-time-range)
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

(define-key key-translation-map (kbd "C-x C-b") (kbd "C-0"))
(define-key key-translation-map (kbd "C-x C-d") (kbd "C-0"))
(define-key key-translation-map (kbd "C-x C-p") (kbd "C-0"))
(define-key key-translation-map (kbd "C-x C-]") (kbd "C-0"))

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

(define-key key-translation-map (kbd "C-M-{") (kbd "C-0"))
(define-key key-translation-map (kbd "M-S-p") (kbd "C-0"))
(define-key key-translation-map (kbd "M-}") (kbd "C-0"))
(define-key key-translation-map (kbd "M-DEL") (kbd "C-0"))

(define-key key-translation-map (kbd "M-n") (kbd "C-0"))
(define-key key-translation-map (kbd "M-/") (kbd "C-0"))
