
;; 0
(define-key key-translation-map (kbd "C-0") (kbd "M-0"))
(global-set-key (kbd "M-0") nil)
(define-key key-translation-map (kbd "C-M-0") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x 0") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x C-0") (kbd "M-0"))

;; -
(define-key key-translation-map (kbd "C--") (kbd "C-<left>"))
(global-set-key (kbd "M-g C-M--") 'my-page-up)
(define-key key-translation-map (kbd "C-M--") (kbd "M-g C-M--"))
(define-key key-translation-map (kbd "C-_") (kbd "C-x <left>"))
(global-set-key (kbd "M-g C-M-_") 'my-page-jump-minus)
(define-key key-translation-map (kbd "C-M-_") (kbd "M-g C-M-_"))
(global-set-key (kbd "M-g M--") 'my-transpose-paragraphs-up)
(define-key key-translation-map (kbd "M--") (kbd "M-g M--"))
(define-key key-translation-map (kbd "M-_") (kbd "M-<"))
(define-key key-translation-map (kbd "C-x C--") (kbd "C-x 0"))
(define-key key-translation-map (kbd "C-c C--") (kbd "C-c C--"))
(define-key key-translation-map (kbd "C-c C-M--") (kbd "C-c C-M--"))

;; =
(define-key key-translation-map (kbd "C-=") (kbd "C-<right>"))
(global-set-key (kbd "M-g C-M-=") 'my-page-down)
(define-key key-translation-map (kbd "C-M-=") (kbd "M-g C-M-="))
(define-key key-translation-map (kbd "C-+") (kbd "C-x <right>"))
(global-set-key (kbd "M-g C-M-+") 'my-page-jump-plus)
(define-key key-translation-map (kbd "C-M-+") (kbd "M-g C-M-+"))
(global-set-key (kbd "M-g M-=") 'my-transpose-paragraphs-down)
(define-key key-translation-map (kbd "M-=") (kbd "M-g M-="))
(define-key key-translation-map (kbd "M-+") (kbd "M->"))
(define-key key-translation-map (kbd "C-x C-=") (kbd "C-x 1"))
(define-key key-translation-map (kbd "C-c C-=") (kbd "C-c C-="))
(define-key key-translation-map (kbd "C-c C-M-=") (kbd "C-c C-M-="))

;; <backspace>
(global-set-key (kbd "M-g C-<backspace>") 'backward-kill-word)
(define-key key-translation-map (kbd "C-<backspace>") (kbd "M-g C-<backspace>"))
(global-set-key (kbd "M-g C-M-<backspace>") 'backward-kill-paragraph)
(define-key key-translation-map (kbd "C-M-<backspace>") (kbd "M-g C-M-<backspace>"))
(define-key key-translation-map (kbd "C-S-<backspace>") (kbd "ESC C-<backspace>"))
(define-key key-translation-map (kbd "C-M-S-<backspace>") (kbd "M-0"))
(global-set-key (kbd "M-g M-DEL") 'my-backward-kill-line)
(define-key key-translation-map (kbd "M-DEL") (kbd "M-g M-DEL"))
(define-key key-translation-map (kbd "C-x DEL") (kbd "M-0"))
(global-set-key (kbd "M-g C-x C-<backspace>") 'revert-buffer)
(define-key key-translation-map (kbd "C-x C-<backspace>") (kbd "M-g C-x C-<backspace>"))

;; p
(global-set-key (kbd "M-g C-p") 'my-move-beginning-of-line)
(define-key key-translation-map (kbd "C-p") (kbd "M-g C-p"))
(define-key key-translation-map (kbd "C-M-p") (kbd "M-{"))
(define-key key-translation-map (kbd "C-S-p") (kbd "C-M-b"))
(global-set-key (kbd "M-g C-M-S-p") 'backward-up-list)
(define-key key-translation-map (kbd "C-M-S-p") (kbd "M-g C-M-S-p"))
(global-set-key (kbd "M-g M-p") 'my-transpose-lines-up)
(define-key key-translation-map (kbd "M-p") (kbd "M-g M-p"))
(define-key key-translation-map (kbd "M-P") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x p") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x C-p") (kbd "C-x 2"))
(define-key key-translation-map (kbd "C-c C-p") (kbd "C-c C-p"))
(define-key key-translation-map (kbd "C-c C-M-p") (kbd "C-c C-M-p"))

;; [
(define-key key-translation-map (kbd "C-M-[") (kbd "M-h"))
(define-key key-translation-map (kbd "C-{") (kbd "C-M-@"))
(global-set-key (kbd "M-g C-M-{") 'my-cycle-paren-shapes)
(define-key key-translation-map (kbd "C-M-{") (kbd "M-g C-M-{"))
(global-set-key (kbd "M-g M-[") 'my-toggle-comment)
(define-key key-translation-map (kbd "M-[") (kbd "M-g M-["))
(define-key key-translation-map (kbd "M-{") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x [") (kbd "C-c <left>"))
(define-key key-translation-map (kbd "C-c C-M-[") (kbd "C-c C-M-["))

;; ]
(global-set-key (kbd "M-g C-]") 'my-move-end-of-line)
(define-key key-translation-map (kbd "C-]") (kbd "M-g C-]"))
(define-key key-translation-map (kbd "C-M-]") (kbd "M-}"))
(define-key key-translation-map (kbd "C-}") (kbd "C-M-f"))
(global-set-key (kbd "M-g C-M-}") 'up-list)
(define-key key-translation-map (kbd "C-M-}") (kbd "M-g C-M-}"))
(global-set-key (kbd "M-g M-]") 'my-transpose-lines-down)
(define-key key-translation-map (kbd "M-]") (kbd "M-g M-]"))
(define-key key-translation-map (kbd "M-}") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x ]") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x C-]") (kbd "C-x 3"))
(define-key key-translation-map (kbd "C-c C-]") (kbd "C-c C-]"))
(define-key key-translation-map (kbd "C-c C-M-]") (kbd "C-c C-M-]"))

;; \\
(global-set-key (kbd "M-g C-\\") 'delete-indentation)
(define-key key-translation-map (kbd "C-\\") (kbd "M-g C-\\"))
(define-key key-translation-map (kbd "C-M-\\") (kbd "C-x C-o"))
(global-set-key (kbd "M-g C-|") 'my-buffer-paragraph-style)
(define-key key-translation-map (kbd "C-|") (kbd "M-g C-|"))
(define-key key-translation-map (kbd "C-x \\") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x C-\\") (kbd "M-0"))

;; ;
(define-key key-translation-map (kbd "C-;") (kbd "M-0"))
(define-key key-translation-map (kbd "C-M-;") (kbd "M-0"))

;; '
(define-key key-translation-map (kbd "C-'") (kbd "M-0"))
(define-key key-translation-map (kbd "C-M-'") (kbd "M-0"))
(global-set-key (kbd "M-g M-'") 'comment-kill)
(define-key key-translation-map (kbd "M-'") (kbd "M-g M-'"))
(define-key key-translation-map (kbd "M-\"") (kbd "M-0"))

;; <return>
(global-set-key (kbd "C-<return>") 'newline)
(define-key key-translation-map (kbd "C-M-<return>") (kbd "M-0"))
(define-key key-translation-map (kbd "C-S-<return>") (kbd "M-0"))
(global-set-key (kbd "M-<return>") 'eval-last-sexp)

;; <space>
(define-key key-translation-map (kbd "C-SPC") (kbd "M-0"))

;; y
(define-key key-translation-map (kbd "C-y") (kbd "M-0"))
(define-key key-translation-map (kbd "M-y") (kbd "M-0"))
(define-key key-translation-map (kbd "M-Y") (kbd "M-0"))

;; u
(define-key key-translation-map (kbd "C-u") (kbd "M-0"))
(define-key key-translation-map (kbd "M-u") (kbd "C-<left>"))
(global-set-key (kbd "M-g M-U") 'my-upcase-word)
(define-key key-translation-map (kbd "M-U") (kbd "M-g M-U"))

;; i
(define-key key-translation-map (kbd "M-i") (kbd "C-@"))
(global-set-key (kbd "M-g M-I") 'my-downcase-word)
(define-key key-translation-map (kbd "M-I") (kbd "M-g M-I"))

;; o
(define-key key-translation-map (kbd "C-o") (kbd "M-0"))
(define-key key-translation-map (kbd "M-o") (kbd "C-<right>"))
(global-set-key (kbd "M-g M-O") 'my-capitalize-word)
(define-key key-translation-map (kbd "M-O") (kbd "M-g M-O"))
(define-key key-translation-map (kbd "C-x C-o") (kbd "C-x C-o"))

;; h
(define-key key-translation-map (kbd "C-h") (kbd "M-0"))
(define-key key-translation-map (kbd "M-h") (kbd "C-h"))
(define-key key-translation-map (kbd "M-H") (kbd "M-0"))

;; j
(define-key key-translation-map (kbd "C-j") (kbd "M-0"))
(global-set-key (kbd "M-g M-j") 'left-char)
(define-key ac-complete-mode-map (kbd "M-g M-j") 'ac-previous)
(define-key key-translation-map (kbd "M-j") (kbd "M-g M-j"))
(define-key key-translation-map (kbd "M-J") (kbd "M-0"))

;; k
(define-key key-translation-map (kbd "C-k") (kbd "M-0"))
(define-key key-translation-map (kbd "M-k") (kbd "DEL"))
(define-key key-translation-map (kbd "M-K") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x k") (kbd "M-0"))

;; l
(define-key key-translation-map (kbd "C-l") (kbd "M-0"))
(global-set-key (kbd "M-g M-l") 'right-char)
(define-key ac-complete-mode-map (kbd "M-g M-l") 'ac-next)
(define-key key-translation-map (kbd "M-l") (kbd "M-g M-l"))
(define-key key-translation-map (kbd "M-L") (kbd "M-0"))

;; n
(define-key key-translation-map (kbd "C-n") (kbd "M-0"))
(define-key key-translation-map (kbd "M-n") (kbd "C-g"))

;; m
(global-set-key (kbd "M-g C-m") 'completion-at-point)
(define-key key-translation-map (kbd "M-m") (kbd "M-g C-m"))

;; ,
(define-key key-translation-map (kbd "C-,") (kbd "M-0"))
(global-set-key (kbd "M-g M-,") 'avy-goto-char)
(define-key key-translation-map (kbd "M-,") (kbd "M-g M-,"))

;; .
(define-key key-translation-map (kbd "C-.") (kbd "M-0"))
(define-key key-translation-map (kbd "M-.") (kbd "RET"))

;; /
(define-key key-translation-map (kbd "C-/") (kbd "M-0"))
(define-key key-translation-map (kbd "M-/") (kbd "C-/"))

;; <tab>
(define-key key-translation-map (kbd "C-<tab>") (kbd "C-l"))

;; q
(define-key key-translation-map (kbd "M-q") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x q") (kbd "C-M-%"))

;; w
(global-set-key (kbd "M-g C-w") 'my-kill-region)
(define-key key-translation-map (kbd "C-w") (kbd "M-g C-w"))
(global-set-key (kbd "M-g M-w") 'my-kill-ring-save)
(define-key key-translation-map (kbd "M-w") (kbd "M-g M-w"))
(define-key key-translation-map (kbd "C-M-w") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x C-w") (kbd "C-x C-w"))
(define-key key-translation-map (kbd "C-c C-w") (kbd "C-c C-w"))

;; e
(define-key key-translation-map (kbd "C-e") (kbd "C-y"))
(define-key key-translation-map (kbd "M-e") (kbd "C-y"))
(define-key key-translation-map (kbd "C-M-e") (kbd "M-0"))
(global-set-key (kbd "M-g C-x C-e") 'eval-buffer)
(define-key key-translation-map (kbd "C-x C-e") (kbd "M-g C-x C-e"))
(define-key key-translation-map (kbd "C-c C-e") (kbd "C-c C-e"))

;; r
(global-set-key (kbd "C-r") 'set-mark-command)
(define-key key-translation-map (kbd "M-r") (kbd "M-0"))
(define-key key-translation-map (kbd "C-M-r") (kbd "M-0"))

;; t
(define-key key-translation-map (kbd "C-t") (kbd "M-0"))
(define-key key-translation-map (kbd "M-t") (kbd "M-0"))
(define-key key-translation-map (kbd "C-M-t") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x C-t") (kbd "C-x C-0"))
(define-key key-translation-map (kbd "C-c C-t") (kbd "C-c C-t"))

;; a
(define-key key-translation-map (kbd "C-a") (kbd "C-k"))
(define-key key-translation-map (kbd "C-x C-a") (kbd "C-x h"))
(define-key key-translation-map (kbd "M-a") (kbd "C-k"))
(global-set-key (kbd "M-g C-x a") 'my-copy-buffer)
(define-key key-translation-map (kbd "C-x a") (kbd "M-g C-x a"))

;; s
(define-key key-translation-map (kbd "M-s") (kbd "C-M-s"))
(define-key key-translation-map (kbd "C-M-s") (kbd "M-0"))
(global-set-key (kbd "M-g C-x s") 'my-switch-to-buffer-scratch)
(define-key key-translation-map (kbd "C-x s") (kbd "M-g C-x s"))
(define-key key-translation-map (kbd "C-x C-s") (kbd "C-x C-s"))

;; d
(global-set-key (kbd "M-g C-d") 'delete-pair)
(define-key key-translation-map (kbd "C-d") (kbd "M-g C-d"))
(define-key key-translation-map (kbd "M-d") (kbd "M-g C-d"))
(define-key key-translation-map (kbd "C-x C-d") (kbd "M-0"))
(define-key key-translation-map (kbd "C-c C-d") (kbd "C-c C-d"))

;; f
(define-key key-translation-map (kbd "C-f") (kbd "C-x o"))
(define-key key-translation-map (kbd "M-f") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x C-f") (kbd "C-x C-f"))
(define-key key-translation-map (kbd "C-c C-f") (kbd "C-c C-f"))

;; g
(define-key key-translation-map (kbd "M-g") (kbd "M-0"))
(global-set-key (kbd "M-g C-x g") 'magit-status)
(define-key key-translation-map (kbd "C-x g") (kbd "M-g C-x g"))

;; z
(define-key key-translation-map (kbd "C-z") (kbd "C-/"))
(define-key key-translation-map (kbd "M-z") (kbd "M-0"))
(define-key key-translation-map (kbd "C-c C-z") (kbd "C-c C-z"))

;; c
(define-key key-translation-map (kbd "M-c") (kbd "M-0"))

;; v
(define-key key-translation-map (kbd "C-v") (kbd "C-o"))
(define-key key-translation-map (kbd "M-v") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x C-v") (kbd "M-0"))
(define-key key-translation-map (kbd "C-c C-v") (kbd "C-c C-v"))

;; b
(define-key key-translation-map (kbd "M-b") (kbd "M-0"))
(global-set-key (kbd "M-g C-b") 'bs-show)
(define-key key-translation-map (kbd "C-b") (kbd "M-g C-b"))
(define-key key-translation-map (kbd "C-x b") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x C-b") (kbd "M-0"))
(define-key key-translation-map (kbd "C-c C-b") (kbd "C-c C-b"))

;; `
(define-key key-translation-map (kbd "C-`") (kbd "C-u"))

;; 1
(global-set-key (kbd "M-g C-1") 'my-search-whitespace-regexp)
(define-key key-translation-map (kbd "C-1") (kbd "M-g C-1"))

;; 2
(global-set-key (kbd "M-g C-2") 'my-ac-sources)
(define-key key-translation-map (kbd "C-2") (kbd "M-g C-2"))

;; <arrow>
(define-key key-translation-map (kbd "C-M-<up>") (kbd "C-x ^"))
(global-set-key (kbd "M-g C-M-<down>") 'shrink-window)
(define-key key-translation-map (kbd "C-M-<down>") (kbd "M-g C-M-<down>"))
(define-key key-translation-map (kbd "C-M-<left>") (kbd "C-x {"))
(define-key key-translation-map (kbd "C-M-<right>") (kbd "C-x }"))
