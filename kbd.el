
;; 0
(define-key key-translation-map (kbd "C-0") (kbd "M-0"))
(global-set-key (kbd "M-0") nil)
(define-key key-translation-map (kbd "C-M-0") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x 0") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x C-0") (kbd "M-0"))

;; p
(global-set-key (kbd "C-h C-p") 'my-move-beginning-of-line)
(define-key key-translation-map (kbd "C-p") (kbd "C-h C-p"))
(define-key key-translation-map (kbd "C-M-p") (kbd "M-{"))
(define-key key-translation-map (kbd "C-S-p") (kbd "C-M-b"))
(global-set-key (kbd "C-h C-M-S-p") 'backward-up-list)
(define-key key-translation-map (kbd "C-M-S-p") (kbd "C-h C-M-S-p"))
(global-set-key (kbd "C-h M-p") 'my-transpose-lines-up)
(define-key key-translation-map (kbd "M-p") (kbd "C-h M-p"))
(define-key key-translation-map (kbd "M-P") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x p") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x C-p") (kbd "C-x 2"))

;; [
(define-key key-translation-map (kbd "C-M-[") (kbd "M-h"))
(define-key key-translation-map (kbd "C-{") (kbd "C-M-@"))
(global-set-key (kbd "C-h C-M-{") 'down-list)
(define-key key-translation-map (kbd "C-M-{") (kbd "C-h C-M-{"))
(global-set-key (kbd "C-h M-[") 'my-comment)
(define-key key-translation-map (kbd "M-[") (kbd "C-h M-["))
(define-key key-translation-map (kbd "M-{") (kbd "C-l"))
(define-key key-translation-map (kbd "C-x [") (kbd "C-c <left>"))

;; ]
(global-set-key (kbd "C-h C-]") 'my-move-end-of-line)
(define-key key-translation-map (kbd "C-]") (kbd "C-h C-]"))
(define-key key-translation-map (kbd "C-M-]") (kbd "M-}"))
(define-key key-translation-map (kbd "C-}") (kbd "C-M-f"))
(global-set-key (kbd "C-h C-M-}") 'up-list)
(define-key key-translation-map (kbd "C-M-}") (kbd "C-h C-M-}"))
(global-set-key (kbd "C-h M-]") 'my-transpose-lines-down)
(define-key key-translation-map (kbd "M-]") (kbd "C-h M-]"))
(define-key key-translation-map (kbd "M-}") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x ]") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x C-]") (kbd "C-x 3"))

;; -
(define-key key-translation-map (kbd "C--") (kbd "C-<left>"))
(global-set-key (kbd "C-h C-M--") 'my-page-up)
(define-key key-translation-map (kbd "C-M--") (kbd "C-h C-M--"))
(define-key key-translation-map (kbd "C-_") (kbd "C-x <left>"))
(global-set-key (kbd "C-h C-M-_") 'my-page-jump-minus)
(define-key key-translation-map (kbd "C-M-_") (kbd "C-h C-M-_"))
(global-set-key (kbd "C-h M--") 'my-transpose-paragraphs-up)
(define-key key-translation-map (kbd "M--") (kbd "C-h M--"))
(define-key key-translation-map (kbd "M-_") (kbd "M-<"))
(define-key key-translation-map (kbd "C-x C--") (kbd "C-x 0"))

;; =
(define-key key-translation-map (kbd "C-=") (kbd "C-<right>"))
(global-set-key (kbd "C-h C-M-=") 'my-page-down)
(define-key key-translation-map (kbd "C-M-=") (kbd "C-h C-M-="))
(define-key key-translation-map (kbd "C-+") (kbd "C-x <right>"))
(global-set-key (kbd "C-h C-M-+") 'my-page-jump-plus)
(define-key key-translation-map (kbd "C-M-+") (kbd "C-h C-M-+"))
(global-set-key (kbd "C-h M-=") 'my-transpose-paragraphs-down)
(define-key key-translation-map (kbd "M-=") (kbd "C-h M-="))
(define-key key-translation-map (kbd "M-+") (kbd "M->"))
(define-key key-translation-map (kbd "C-x C-=") (kbd "C-x 1"))

;; <backspace>
(global-set-key (kbd "C-h C-<backspace>") 'backward-kill-word)
(define-key key-translation-map (kbd "C-<backspace>") (kbd "C-h C-<backspace>"))
(global-set-key (kbd "C-h C-M-<backspace>") 'backward-kill-paragraph)
(define-key key-translation-map (kbd "C-M-<backspace>") (kbd "C-h C-M-<backspace>"))
(define-key key-translation-map (kbd "C-S-<backspace>") (kbd "ESC C-<backspace>"))
(define-key key-translation-map (kbd "C-M-S-<backspace>") (kbd "M-0"))
(define-key key-translation-map (kbd "M-DEL") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x DEL") (kbd "M-0"))
(global-set-key (kbd "C-h C-x C-<backspace>") 'revert-buffer)
(define-key key-translation-map (kbd "C-x C-<backspace>") (kbd "C-h C-x C-<backspace>"))

;; \\
(global-set-key (kbd "C-h C-\\") 'delete-indentation)
(define-key key-translation-map (kbd "C-\\") (kbd "C-h C-\\"))
(define-key key-translation-map (kbd "C-M-\\") (kbd "C-x C-o"))
(global-set-key (kbd "C-h C-|") 'my-buffer-paragraph-style)
(define-key key-translation-map (kbd "C-|") (kbd "C-h C-|"))
(define-key key-translation-map (kbd "C-x \\") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x C-\\") (kbd "C-x k"))

;; <return>
(global-set-key (kbd "C-h C-<return>") 'newline)
(define-key key-translation-map (kbd "C-<return>") (kbd "C-h C-<return>"))
(define-key key-translation-map (kbd "C-M-<return>") (kbd "M-0"))
(define-key key-translation-map (kbd "C-S-<return>") (kbd "M-0"))
(global-set-key (kbd "C-h M-RET") 'eval-last-sexp)
(define-key key-translation-map (kbd "M-RET") (kbd "C-h M-RET"))

;; ;
(define-key key-translation-map (kbd "C-;") (kbd "M-0"))
(define-key key-translation-map (kbd "C-M-;") (kbd "M-0"))

;; '
(define-key key-translation-map (kbd "C-'") (kbd "M-0"))
(define-key key-translation-map (kbd "C-M-'") (kbd "M-0"))
(global-set-key (kbd "C-h M-'") 'comment-kill)
(define-key key-translation-map (kbd "M-'") (kbd "C-h M-'"))
(define-key key-translation-map (kbd "M-\"") (kbd "M-0"))

;; y
(define-key key-translation-map (kbd "M-y") (kbd "M-0"))
(define-key key-translation-map (kbd "M-Y") (kbd "M-0"))

;; u
(define-key key-translation-map (kbd "M-u") (kbd "C-<left>"))
(global-set-key (kbd "C-h M-U") 'my-upcase-word)
(define-key key-translation-map (kbd "M-U") (kbd "C-h M-U"))

;; i
(define-key key-translation-map (kbd "M-i") (kbd "C-@"))
(global-set-key (kbd "C-h M-I") 'my-downcase-word)
(define-key key-translation-map (kbd "M-I") (kbd "C-h M-I"))

;; o
(define-key key-translation-map (kbd "M-o") (kbd "C-<right>"))
(global-set-key (kbd "C-h M-O") 'my-capitalize-word)
(define-key key-translation-map (kbd "M-O") (kbd "C-h M-O"))
(define-key key-translation-map (kbd "C-x C-o") (kbd "C-x C-o"))

;; h
(define-key key-translation-map (kbd "C-h") (kbd "M-0"))
(define-key key-translation-map (kbd "M-h") (kbd "C-h"))
(define-key key-translation-map (kbd "M-H") (kbd "M-0"))

;; j
(global-set-key (kbd "C-h M-j") 'left-char)
(define-key ac-complete-mode-map (kbd "C-h M-j") 'ac-previous)
(define-key key-translation-map (kbd "M-j") (kbd "C-h M-j"))
(define-key key-translation-map (kbd "M-J") (kbd "M-0"))

;; k
(define-key key-translation-map (kbd "M-k") (kbd "DEL"))
(define-key key-translation-map (kbd "M-K") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x k") (kbd "M-0"))

;; l
(global-set-key (kbd "C-h M-l") 'right-char)
(define-key ac-complete-mode-map (kbd "C-h M-l") 'ac-next)
(define-key key-translation-map (kbd "M-l") (kbd "C-h M-l"))
(define-key key-translation-map (kbd "M-L") (kbd "M-0"))

;; n
(define-key key-translation-map (kbd "M-n") (kbd "C-g"))

;; m
(define-key key-translation-map (kbd "M-m") (kbd "M-0"))

;; ,
(global-set-key (kbd "C-h M-,") 'avy-goto-char)
(define-key key-translation-map (kbd "M-,") (kbd "C-h M-,"))

;; .
(define-key key-translation-map (kbd "M-.") (kbd "RET"))

;; /
(define-key key-translation-map (kbd "M-/") (kbd "C-/"))

;; <tab>
(define-key key-translation-map (kbd "C-<tab>") (kbd "C-x o"))

;; q
(define-key key-translation-map (kbd "M-q") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x q") (kbd "C-M-%"))

;; w
(global-set-key (kbd "C-h C-w") 'my-kill-region)
(define-key key-translation-map (kbd "C-w") (kbd "C-h C-w"))
(global-set-key (kbd "C-h M-w") 'my-kill-ring-save)
(define-key key-translation-map (kbd "M-w") (kbd "C-h M-w"))
(define-key key-translation-map (kbd "C-M-w") (kbd "M-0"))

;; e
(define-key key-translation-map (kbd "C-e") (kbd "C-y"))
(define-key key-translation-map (kbd "M-e") (kbd "C-y"))
(define-key key-translation-map (kbd "C-M-e") (kbd "M-0"))
(global-set-key (kbd "C-h C-x C-e") 'eval-buffer)
(define-key key-translation-map (kbd "C-x C-e") (kbd "C-h C-x C-e"))

;; r
(define-key key-translation-map (kbd "M-r") (kbd "M-0"))
(define-key key-translation-map (kbd "C-M-r") (kbd "M-0"))

;; t
(define-key key-translation-map (kbd "C-t") (kbd "M-0"))
(define-key key-translation-map (kbd "M-t") (kbd "M-0"))
(define-key key-translation-map (kbd "C-M-t") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x C-t") (kbd "C-x C-0"))

;; a
(define-key key-translation-map (kbd "C-a") (kbd "C-k"))
(define-key key-translation-map (kbd "C-x C-a") (kbd "C-x h"))
(define-key key-translation-map (kbd "M-a") (kbd "C-k"))

;; s
(define-key key-translation-map (kbd "M-s") (kbd "C-M-s"))
(define-key key-translation-map (kbd "C-M-s") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x C-s") (kbd "C-x C-s"))

;; d
(global-set-key (kbd "C-h C-d") 'delete-pair)
(define-key key-translation-map (kbd "C-d") (kbd "C-h C-d"))
(define-key key-translation-map (kbd "M-d") (kbd "C-h C-d"))
(define-key key-translation-map (kbd "C-x C-d") (kbd "M-0"))

;; f
(define-key key-translation-map (kbd "C-f") (kbd "C-@"))
(define-key key-translation-map (kbd "M-f") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x C-f") (kbd "C-x C-f"))

;; g
(define-key key-translation-map (kbd "M-g") (kbd "M-0"))
(global-set-key (kbd "C-h C-x g") 'magit-status)
(define-key key-translation-map (kbd "C-x g") (kbd "C-h C-x g"))

;; z
(define-key key-translation-map (kbd "C-z") (kbd "C-/"))
(define-key key-translation-map (kbd "M-z") (kbd "M-0"))

;; c
(define-key key-translation-map (kbd "M-c") (kbd "M-0"))

;; v
(define-key key-translation-map (kbd "C-v") (kbd "C-o"))
(define-key key-translation-map (kbd "M-v") (kbd "M-0"))
(global-set-key (kbd "C-h C-x C-v") 'my-switch-to-minibuffer)
(define-key key-translation-map (kbd "C-x C-v") (kbd "C-h C-x C-v"))

;; b
(define-key key-translation-map (kbd "M-b") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x C-b") (kbd "C-x b"))
(define-key key-translation-map (kbd "C-x b") (kbd "M-0"))

;; `
(define-key key-translation-map (kbd "C-`") (kbd "C-u"))

;; 1
(global-set-key (kbd "C-h C-1") 'my-ac-sources)
(define-key key-translation-map (kbd "C-1") (kbd "C-h C-1"))

;; 2
(global-set-key (kbd "C-h C-2") 'my-search-whitespace-regexp)
(define-key key-translation-map (kbd "C-2") (kbd "C-h C-2"))

;; <arrow>
(define-key key-translation-map (kbd "C-M-<up>") (kbd "C-x ^"))
(global-set-key (kbd "C-h C-M-<down>") 'shrink-window)
(define-key key-translation-map (kbd "C-M-<down>") (kbd "C-h C-M-<down>"))
(define-key key-translation-map (kbd "C-M-<left>") (kbd "C-x {"))
(define-key key-translation-map (kbd "C-M-<right>") (kbd "C-x }"))
