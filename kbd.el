;; '
(define-key key-translation-map (kbd "C-'") (kbd "M-0"))
(define-key key-translation-map (kbd "C-M-'") (kbd "M-0"))
(global-set-key (kbd "M-g M-'") 'comment-kill)
(define-key key-translation-map (kbd "M-'") (kbd "M-g M-'"))
(define-key key-translation-map (kbd "M-\"") (kbd "M-0"))

;; ,
(define-key key-translation-map (kbd "C-,") (kbd "C-/"))
(define-key key-translation-map (kbd "M-,") (kbd "M-0"))

;; -
(define-key key-translation-map (kbd "C--") (kbd "C-<left>"))
(define-key key-translation-map (kbd "C-M--") (kbd "C-x <left>"))
(define-key key-translation-map (kbd "C-_") (kbd "M-<"))
(global-set-key (kbd "M-g M--") 'TransposeParagraphsUp)
(define-key key-translation-map (kbd "M--") (kbd "M-g M--"))
(define-key key-translation-map (kbd "C-x C--") (kbd "C-x 0"))
(define-key key-translation-map (kbd "C-c C--") (kbd "C-c C--"))
(define-key key-translation-map (kbd "C-c C-M--") (kbd "C-c C-M--"))

;; .
(define-key key-translation-map (kbd "C-.") (kbd "M-/"))
(define-key key-translation-map (kbd "C-M-.") (kbd "C-M-i"))
(define-key key-translation-map (kbd "M-.") (kbd "M-0"))

;; /
(define-key key-translation-map (kbd "M-/") (kbd "M-0"))
(define-key key-translation-map (kbd "C-M-/") (kbd "M-0"))

;; 0
(define-key key-translation-map (kbd "C-0") (kbd "M-0"))
(global-set-key (kbd "M-0") nil)
(define-key key-translation-map (kbd "C-M-0") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x 0") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x C-0") (kbd "M-0"))

;; 9
(define-key key-translation-map (kbd "C-9") (kbd "M-0"))

;; ;
(define-key key-translation-map (kbd "C-;") (kbd "M-0"))
(define-key key-translation-map (kbd "C-M-;") (kbd "M-0"))

;; =
(define-key key-translation-map (kbd "C-=") (kbd "C-<right>"))
(define-key key-translation-map (kbd "C-M-=") (kbd "C-x <right>"))
(define-key key-translation-map (kbd "C-+") (kbd "M->"))
(global-set-key (kbd "M-g M-=") 'TransposeParagraphsDown)
(define-key key-translation-map (kbd "M-=") (kbd "M-g M-="))
(define-key key-translation-map (kbd "C-x C-=") (kbd "C-x 1"))
(define-key key-translation-map (kbd "C-c C-=") (kbd "C-c C-="))
(define-key key-translation-map (kbd "C-c C-M-=") (kbd "C-c C-M-="))

;; ARROW
(define-key key-translation-map (kbd "C-M-<down>") (kbd "C-x ^"))
(global-set-key (kbd "M-g C-M-<up>") 'shrink-window)
(define-key key-translation-map (kbd "C-M-<up>") (kbd "M-g C-M-<up>"))
(define-key key-translation-map (kbd "C-M-<left>") (kbd "C-x {"))
(define-key key-translation-map (kbd "C-M-<right>") (kbd "C-x }"))

;; DEL
(global-set-key (kbd "M-g C-<backspace>") 'backward-kill-word)
(define-key key-translation-map (kbd "C-<backspace>") (kbd "M-g C-<backspace>"))
(global-set-key (kbd "M-g C-M-<backspace>") 'backward-kill-paragraph)
(define-key key-translation-map (kbd "C-M-<backspace>") (kbd "M-g C-M-<backspace>"))
(global-set-key (kbd "M-g C-S-<backspace>") 'delete-trailing-whitespace)
(define-key key-translation-map (kbd "C-S-<backspace>") (kbd "M-g C-S-<backspace>"))
(global-set-key (kbd "M-g M-DEL") 'BackwardKillLine)
(define-key key-translation-map (kbd "M-DEL") (kbd "M-g M-DEL"))
(define-key key-translation-map (kbd "C-x DEL") (kbd "M-0"))
(global-set-key (kbd "M-g C-x C-<backspace>") 'revert-buffer)
(define-key key-translation-map (kbd "C-x C-<backspace>") (kbd "M-g C-x C-<backspace>"))

;; RET
(global-set-key (kbd "C-<return>") 'eval-last-sexp)
(define-key key-translation-map (kbd "C-M-<return>") (kbd "M-0"))
(define-key key-translation-map (kbd "C-S-<return>") (kbd "M-0"))
(global-set-key (kbd "M-RET") 'eval-last-sexp)

;; SPC
(define-key key-translation-map (kbd "C-SPC") (kbd "M-SPC"))

;; TAB
(define-key key-translation-map (kbd "C-<tab>") (kbd "M-0"))

;; [
(define-key key-translation-map (kbd "C-M-[") (kbd "M-h"))
(global-set-key (kbd "M-g C-{") 'TogglePageRange)
(define-key key-translation-map (kbd "C-{") (kbd "M-g C-{"))
(define-key key-translation-map (kbd "M-[") (kbd "C-l"))
(define-key key-translation-map (kbd "C-x [") (kbd "C-c <left>"))
(define-key key-translation-map (kbd "C-c C-M-[") (kbd "C-c C-M-["))

;; \\
(global-set-key (kbd "M-g C-\\") 'delete-indentation)
(define-key key-translation-map (kbd "C-\\") (kbd "M-g C-\\"))
(define-key key-translation-map (kbd "C-M-\\") (kbd "C-x C-o"))
(define-key key-translation-map (kbd "C-|") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x \\") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x C-\\") (kbd "M-0"))

;; \f
(define-key key-translation-map (kbd "<f5>") (kbd "C-x C-s"))
(global-set-key (kbd "M-g <f9>") 'linum-mode)
(define-key key-translation-map (kbd "<f9>") (kbd "M-g <f9>"))
(global-set-key (kbd "M-g <f10>") 'toggle-truncate-lines)
(define-key key-translation-map (kbd "<f10>") (kbd "M-g <f10>"))
(global-set-key (kbd "M-g <f12>") 'ParagraphSet)
(define-key key-translation-map (kbd "<f12>") (kbd "M-g <f12>"))

;; ]
(global-set-key (kbd "M-g C-]") 'MoveEndOfLine)
(define-key key-translation-map (kbd "C-]") (kbd "M-g C-]"))
(define-key key-translation-map (kbd "C-M-]") (kbd "M-}"))
(global-set-key (kbd "M-g C-}") 'PageDown)
(define-key key-translation-map (kbd "C-}") (kbd "M-g C-}"))
(global-set-key (kbd "M-g M-]") 'TransposeLinesDown)
(define-key key-translation-map (kbd "M-]") (kbd "M-g M-]"))
(define-key key-translation-map (kbd "C-x ]") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x C-]") (kbd "C-x 3"))
(define-key key-translation-map (kbd "C-c C-]") (kbd "C-c C-]"))
(define-key key-translation-map (kbd "C-c C-M-]") (kbd "C-c C-M-]"))

;; `
(define-key key-translation-map (kbd "C-`") (kbd "C-u"))

;; a
(define-key key-translation-map (kbd "C-a") (kbd "C-k"))
(define-key key-translation-map (kbd "C-x C-a") (kbd "C-x h"))
(define-key key-translation-map (kbd "M-a") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x a") (kbd "M-0"))

;; b
(global-set-key (kbd "M-g C-b") 'bs-show)
(define-key key-translation-map (kbd "C-b") (kbd "M-g C-b"))
(define-key key-translation-map (kbd "M-b") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x b") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x C-b") (kbd "M-0"))
(define-key key-translation-map (kbd "C-c C-b") (kbd "C-c C-b"))

;; c
(define-key key-translation-map (kbd "M-c") (kbd "M-0"))

;; d
(global-set-key (kbd "M-g C-d") 'delete-pair)
(define-key key-translation-map (kbd "C-d") (kbd "M-g C-d"))
(define-key key-translation-map (kbd "M-d") (kbd "M-0"))
(define-key key-translation-map (kbd "C-M-d") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x C-d") (kbd "M-0"))
(define-key key-translation-map (kbd "C-c C-d") (kbd "C-c C-d"))

;; e
(define-key key-translation-map (kbd "C-e") (kbd "C-y"))
(define-key key-translation-map (kbd "M-e") (kbd "M-0"))
(define-key key-translation-map (kbd "C-M-e") (kbd "M-0"))
(global-set-key (kbd "C-c C-e") 'eval-buffer)
(define-key key-translation-map (kbd "C-x C-e") (kbd "M-0"))
(define-key key-translation-map (kbd "C-c C-e") (kbd "C-c C-e"))

;; f
(define-key key-translation-map (kbd "C-f") (kbd "C-@"))
(define-key key-translation-map (kbd "M-f") (kbd "M-0"))
(define-key key-translation-map (kbd "C-M-f") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x C-f") (kbd "C-x C-f"))
(define-key key-translation-map (kbd "C-c C-f") (kbd "C-c C-f"))

;; g
(define-key key-translation-map (kbd "M-g") (kbd "M-0"))
(global-set-key (kbd "M-g C-x g") 'magit-status)
(define-key key-translation-map (kbd "C-x g") (kbd "M-g C-x g"))

;; h
(define-key key-translation-map (kbd "C-M-h") (kbd "M-0"))
(define-key key-translation-map (kbd "M-h") (kbd "M-0"))

;; i
(define-key key-translation-map (kbd "M-i") (kbd "M-0"))
(global-set-key (kbd "M-g C-M-i") 'CycleParenShapes)
(define-key key-translation-map (kbd "C-M-i") (kbd "M-g C-M-i"))

;; j
(define-key key-translation-map (kbd "C-j") (kbd "<left>"))
(define-key key-translation-map (kbd "C-M-j") (kbd "<up>"))
(define-key key-translation-map (kbd "M-j") (kbd "M-0"))

;; k
(define-key key-translation-map (kbd "C-k") (kbd "DEL"))
(global-set-key (kbd "M-g C-M-k") 'ToggleWordCase)
(define-key key-translation-map (kbd "C-M-k") (kbd "M-g C-M-k"))
(define-key key-translation-map (kbd "M-k") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x k") (kbd "M-0"))

;; l
(define-key key-translation-map (kbd "C-l") (kbd "<right>"))
(define-key key-translation-map (kbd "C-M-l") (kbd "<down>"))
(define-key key-translation-map (kbd "M-l") (kbd "M-0"))

;; m
(define-key key-translation-map (kbd "M-m") (kbd "M-0"))

;; n
(global-set-key (kbd "M-g C-n") 'avy-goto-char)
(define-key key-translation-map (kbd "C-n") (kbd "M-g C-n"))
(global-set-key (kbd "M-g C-M-n") 'avy-goto-char-2)
(define-key key-translation-map (kbd "C-M-n") (kbd "M-g C-M-n"))
(define-key key-translation-map (kbd "M-n") (kbd "M-0"))

;; o
(define-key key-translation-map (kbd "C-o") (kbd "C-M-f"))
(global-set-key (kbd "M-g C-M-o") 'up-list)
(define-key key-translation-map (kbd "C-M-o") (kbd "M-g C-M-o"))
(define-key key-translation-map (kbd "M-o") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x C-o") (kbd "C-x C-o"))

;; p
(global-set-key (kbd "M-g C-p") 'MoveBeginningOfLine)
(define-key key-translation-map (kbd "C-p") (kbd "M-g C-p"))
(define-key key-translation-map (kbd "C-M-p") (kbd "M-{"))
(global-set-key (kbd "M-g C-S-p") 'PageUp)
(define-key key-translation-map (kbd "C-S-p") (kbd "M-g C-S-p"))
(global-set-key (kbd "M-g M-p") 'TransposeLinesUp)
(define-key key-translation-map (kbd "M-p") (kbd "M-g M-p"))
(define-key key-translation-map (kbd "C-x p") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x C-p") (kbd "C-x 2"))
(global-set-key (kbd "C-c C-p") 'MoveBeginningOfLineOrigin)
(define-key key-translation-map (kbd "C-c C-p") (kbd "C-c C-p"))
(define-key key-translation-map (kbd "C-c C-M-p") (kbd "C-c C-M-p"))

;; q
(define-key key-translation-map (kbd "M-q") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x q") (kbd "C-M-%"))

;; r
(global-set-key (kbd "C-r") 'other-window)
(define-key key-translation-map (kbd "C-M-r") (kbd "M-0"))
(define-key key-translation-map (kbd "M-r") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x C-r") (kbd "C-x C-r"))
(define-key key-translation-map (kbd "C-c C-r") (kbd "C-c C-r"))

;; s
(define-key key-translation-map (kbd "M-s") (kbd "C-M-s"))
(global-set-key (kbd "M-g C-M-s") 'SearchWhitespaceRegexp)
(define-key key-translation-map (kbd "C-M-s") (kbd "M-g C-M-s"))
(global-set-key (kbd "M-g C-x s") 'SwitchToBufferScratch)
(define-key key-translation-map (kbd "C-x s") (kbd "M-g C-x s"))

;; t
(global-set-key (kbd "M-g C-t") 'ToggleComment)
(define-key key-translation-map (kbd "C-t") (kbd "M-g C-t"))
(global-set-key (kbd "M-g C-M-t") 'SortLines)
(define-key key-translation-map (kbd "C-M-t") (kbd "M-g C-M-t"))
(global-set-key (kbd "M-g C-x t") 'SortParagraphs)
(define-key key-translation-map (kbd "C-x t") (kbd "M-g C-x t"))
(define-key key-translation-map (kbd "C-x C-t") (kbd "C-x C-0"))
(define-key key-translation-map (kbd "C-c C-t") (kbd "C-c C-t"))

;; u
(define-key key-translation-map (kbd "C-u") (kbd "C-M-b"))
(define-key key-translation-map (kbd "M-u") (kbd "M-0"))

;; v
(define-key key-translation-map (kbd "C-v") (kbd "C-M-o"))
(define-key key-translation-map (kbd "M-v") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x C-v") (kbd "M-0"))
(define-key key-translation-map (kbd "C-c C-v") (kbd "C-c C-v"))

;; w
(global-set-key (kbd "M-g C-w") 'KillRegion)
(define-key key-translation-map (kbd "C-w") (kbd "M-g C-w"))
(global-set-key (kbd "M-g M-w") 'KillRingSave)
(define-key key-translation-map (kbd "M-w") (kbd "M-g M-w"))
(define-key key-translation-map (kbd "C-M-w") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x C-w") (kbd "C-x C-w"))
(define-key key-translation-map (kbd "C-c C-w") (kbd "C-c C-w"))

;; x
(global-set-key (kbd "M-g C-x C-x") 'CopyBuffer)
(define-key key-translation-map (kbd "C-x C-x") (kbd "M-g C-x C-x"))

;; y
(define-key key-translation-map (kbd "C-y") (kbd "M-0"))
(define-key key-translation-map (kbd "C-M-y") (kbd "M-0"))
(define-key key-translation-map (kbd "M-y") (kbd "M-0"))

;; z
(define-key key-translation-map (kbd "C-z") (kbd "C-/"))
(define-key key-translation-map (kbd "M-z") (kbd "M-0"))
(define-key key-translation-map (kbd "C-x C-z") (kbd "C-x C-z"))
(define-key key-translation-map (kbd "C-c C-z") (kbd "C-c C-z"))
