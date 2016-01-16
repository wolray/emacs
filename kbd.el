
;; 0
(define-key key-translation-map (kbd "C-0") (kbd "M-0"))
(global-set-key (kbd "M-0") nil)
(define-key key-translation-map (kbd "C-M-0") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x 0") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x C-0") (kbd "M-0"))

;; p
(global-set-key (kbd "C-p") 'my-move-beginning-of-line)
(define-key key-translation-map (kbd "C-M-p") (kbd "M-{"))
(define-key key-translation-map (kbd "C-S-p") (kbd "C-M-b"))
(global-set-key (kbd "C-M-S-p") 'backward-up-list)
(global-set-key (kbd "M-p") 'my-transpose-lines-up)
(define-key key-translation-map (kbd "M-P") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x p") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x C-p") (kbd "C-x 2"))
(define-key key-translation-map (kbd "C-c C-M-p") (kbd "C-c C-x C-i"))

;; [
(define-key key-translation-map (kbd "C-M-[") (kbd "M-h"))
(define-key key-translation-map (kbd "C-{") (kbd "C-M-@"))
(global-set-key (kbd "C-M-{") 'down-list)
(define-key key-translation-map (kbd "M-[") (kbd "C-l"))
(define-key key-translation-map (kbd "M-{") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x [") (kbd "C-c <left>"))
(define-key key-translation-map (kbd "C-c M-ESC") (kbd "C-c C-x C-q"))

;; ]
(global-set-key (kbd "C-]") 'my-move-end-of-line)
(define-key key-translation-map (kbd "C-M-]") (kbd "M-}"))
(define-key key-translation-map (kbd "C-}") (kbd "C-M-f"))
(global-set-key (kbd "C-M-}") 'up-list)
(global-set-key (kbd "M-]") 'my-transpose-lines-down)
(define-key key-translation-map (kbd "M-}") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x ]") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x C-]") (kbd "C-x 3"))
(define-key key-translation-map (kbd "C-c C-M-]") (kbd "C-c C-x C-o"))

;; -
(define-key key-translation-map (kbd "C--") (kbd "C-<left>"))
(global-set-key (kbd "C-M--") 'my-page-up)
(define-key key-translation-map (kbd "C-_") (kbd "C-x <left>"))
(define-key key-translation-map (kbd "C-M-_") (kbd "M-<"))
(global-set-key (kbd "M--") 'my-transpose-paragraphs-up)
(define-key key-translation-map (kbd "C-x C--") (kbd "C-x 0"))
(global-set-key (kbd "C-c C--") 'my-org-evaluate-time-range)
(define-key key-translation-map (kbd "C-c C--") (kbd "C-c C--"))
(define-key key-translation-map (kbd "C-c C-M--") (kbd "C-c C-d"))

;; =
(define-key key-translation-map (kbd "C-=") (kbd "C-<right>"))
(global-set-key (kbd "C-M-=") 'my-page-down)
(define-key key-translation-map (kbd "C-+") (kbd "C-x <right>"))
(define-key key-translation-map (kbd "C-M-+") (kbd "M->"))
(global-set-key (kbd "M-=") 'my-transpose-paragraphs-down)
(define-key key-translation-map (kbd "C-x C-=") (kbd "C-x 1"))
(define-key key-translation-map (kbd "C-c C-=") (kbd "C-c ."))
(define-key key-translation-map (kbd "C-c C-M-=") (kbd "C-c C-s"))

;; <backspace>
(define-key key-translation-map (kbd "C-<backspace>") (kbd "M-DEL"))
(global-set-key (kbd "C-M-<backspace>") 'backward-kill-paragraph)
(define-key key-translation-map (kbd "C-S-<backspace>") (kbd "ESC <C-backspace>"))
(define-key key-translation-map (kbd "C-M-S-<backspace>") (kbd "M-0"))
(define-key key-translation-map (kbd "M-DEL") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x DEL") (kbd "M-0"))
(global-set-key (kbd "C-x C-<backspace>") 'revert-buffer)
(define-key key-translation-map (kbd "C-x C-<backspace>") (kbd "C-x C-<backspace>"))

;; \\
(global-set-key (kbd "C-\\") 'delete-indentation)
(global-set-key (kbd "C-M-\\") 'delete-blank-lines)
(define-key key-translation-map (kbd "C-|") (kbd "M-0"))
(global-set-key (kbd "C-x \\") 'my-buffer-paragraph-style)
(define-key key-translation-map (kbd "C-x C-\\") (kbd "C-x k"))

;; <retrun
(global-set-key (kbd "C-<return>") 'newline)
(define-key key-translation-map (kbd "C-M-<return>") (kbd "M-0"))
(define-key key-translation-map (kbd "C-S-<return>") (kbd "M-0"))
(global-set-key (kbd "M-RET") 'my-insert-paragraph)

;; ;
(define-key key-translation-map (kbd "C-;") (kbd "M-0"))
(define-key key-translation-map (kbd "C-M-;") (kbd "M-0"))
(define-key key-translation-map (kbd "M-;") (kbd "M-;"))
(define-key key-translation-map (kbd "C-c ;") (kbd "C-c }"))

;; '
(define-key key-translation-map (kbd "C-'") (kbd "M-0"))
(define-key key-translation-map (kbd "C-M-'") (kbd "M-0"))
(global-set-key (kbd "M-'") 'comment-kill)
(define-key key-translation-map (kbd "C-c '") (kbd "C-c '"))

;; y
(define-key key-translation-map (kbd "M-y") (kbd "C-g"))
(define-key key-translation-map (kbd "M-Y") (kbd "M-0"))

;; u
(global-set-key (kbd "M-u") 'avy-goto-char-in-line)
(global-set-key (kbd "M-U") 'my-upcase-word)

;; i
(define-key key-translation-map (kbd "M-i") (kbd "M-DEL"))
(global-set-key (kbd "M-I") 'my-downcase-word)

;; o
(define-key key-translation-map (kbd "M-o") (kbd "C-<right>"))
(global-set-key (kbd "M-O") 'my-capitalize-word)
(define-key key-translation-map (kbd "C-x C-o") (kbd "C-x C-o"))

;; h
(define-key key-translation-map (kbd "C-h") (kbd "M-0"))
(define-key key-translation-map (kbd "M-h") (kbd "C-h"))
(define-key key-translation-map (kbd "M-H") (kbd "M-0"))

;; j
(global-set-key (kbd "M-j") 'left-char)
(define-key ac-complete-mode-map (kbd "M-j") 'ac-previous)
(define-key key-translation-map (kbd "M-J") (kbd "M-0"))

;; k
(define-key key-translation-map (kbd "M-k") (kbd "DEL"))
(define-key key-translation-map (kbd "M-K") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x k") (kbd "M-0"))

;; l
(global-set-key (kbd "M-l") 'right-char)
(define-key ac-complete-mode-map (kbd "M-l") 'ac-next)
(define-key key-translation-map (kbd "M-L") (kbd "M-0"))

;; n
(define-key key-translation-map (kbd "M-n") (kbd "C-/"))

;; m
(define-key key-translation-map (kbd "M-m") (kbd "M-0"))

;; ,
(global-set-key (kbd "M-,") 'avy-goto-char)

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
(global-set-key (kbd "C-w") 'my-kill-region)
(global-set-key (kbd "M-w") 'my-kill-ring-save)
(define-key key-translation-map (kbd "C-M-w") (kbd "M-0"))

;; e
(define-key key-translation-map (kbd "C-e") (kbd "C-y"))
(define-key key-translation-map (kbd "M-e") (kbd "C-y"))
(define-key key-translation-map (kbd "C-M-e") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x C-e") (kbd "C-x C-e"))

;; r
(define-key key-translation-map (kbd "C-r") (kbd "C-M-r"))
(define-key key-translation-map (kbd "M-r") (kbd "C-M-r"))
(define-key key-translation-map (kbd "C-M-r") (kbd "M-0"))

;; t
(global-set-key (kbd "C-t") 'delete-pair)
(define-key key-translation-map (kbd "C-x C-t") (kbd "C-x C-0"))

;; a
(define-key key-translation-map (kbd "C-a") (kbd "C-k"))
(define-key key-translation-map (kbd "C-x C-a") (kbd "C-x h"))
(define-key key-translation-map (kbd "M-a") (kbd "C-k"))

;; s
(define-key key-translation-map (kbd "M-s") (kbd "C-M-s"))
(define-key key-translation-map (kbd "C-s") (kbd "C-M-s"))
(define-key key-translation-map (kbd "C-M-s") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x C-s") (kbd "C-x C-s"))
(define-key key-translation-map (kbd "C-c C-s") (kbd "C-c ^"))

;; d
(global-set-key (kbd "C-d") 'my-comment)
(define-key key-translation-map (kbd "M-d") (kbd "C-d"))
(global-set-key (kbd "C-x C-d") 'eval-buffer)
(define-key key-translation-map (kbd "C-x C-d") (kbd "C-x C-d"))
(define-key key-translation-map (kbd "C-c C-d") (kbd "C-c /"))

;; f
(define-key key-translation-map (kbd "C-f") (kbd "C-@"))
(define-key key-translation-map (kbd "M-f") (kbd "C-@"))
(define-key key-translation-map (kbd "C-x C-f") (kbd "C-x C-f"))

;; g
(define-key key-translation-map (kbd "M-g") (kbd "M-0"))
(global-set-key (kbd "C-x g") 'magit-status)

;; z
(define-key key-translation-map (kbd "C-z") (kbd "C-/"))
(define-key key-translation-map (kbd "M-z") (kbd "M-0"))
(define-key key-translation-map (kbd "C-c C-z") (kbd "C-c C-z"))

;; c
(define-key key-translation-map (kbd "M-c") (kbd "M-0"))

;; v
(define-key key-translation-map (kbd "C-v") (kbd "C-o"))
(define-key key-translation-map (kbd "M-v") (kbd "M-0"))
(global-set-key (kbd "C-x C-v") 'my-switch-to-minibuffer)
(define-key key-translation-map (kbd "C-x C-v") (kbd "C-x C-v"))

;; b
(define-key key-translation-map (kbd "M-b") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x C-b") (kbd "C-x b"))
(define-key key-translation-map (kbd "C-x b") (kbd "M-0"))

;; `
(define-key key-translation-map (kbd "C-`") (kbd "C-u"))

;; 1
(global-set-key (kbd "C-1") 'my-ac-sources)

;; arrow
(define-key key-translation-map (kbd "C-M-<up>") (kbd "C-x ^"))
(global-set-key (kbd "C-M-<down>") 'shrink-window)
(define-key key-translation-map (kbd "C-M-<left>") (kbd "C-x {"))
(define-key key-translation-map (kbd "C-M-<right>") (kbd "C-x }"))
