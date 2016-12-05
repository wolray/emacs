(define-minor-mode visual-mode
  :init-value nil
  :keymap (make-sparse-keymap)
  (if (not visual-mode) (setq cursor-type 'bar)
    (define-key visual-mode-map (kbd "g") (key-binding (kbd "C-g")))
    (define-key visual-mode-map (kbd "k") (key-binding (kbd "DEL")))
    (define-key visual-mode-map (kbd "m") (key-binding (kbd "C-m")))
    (setq cursor-type 'box)
    (unless (minibufferp)
      (define-key visual-mode-map (kbd "C-c c") (key-binding (kbd "C-c C-c")))
      (define-key visual-mode-map (kbd "O") (key-binding (kbd "C-M-f")))
      (define-key visual-mode-map (kbd "U") (key-binding (kbd "C-M-b")))
      (define-key visual-mode-map (kbd "Y") (key-binding (kbd "M-g Y")))
      (define-key visual-mode-map (kbd "a") (key-binding (kbd "C-k")))
      (define-key visual-mode-map (kbd "e") (key-binding (kbd "C-y")))
      (define-key visual-mode-map (kbd "y") (key-binding (kbd "M-g y")))
      )))
(global-set-key (kbd "C-c C-c") 'eval-buffer)
(global-set-key (kbd "M-g Y") 'eval-region)
(global-set-key (kbd "M-g y") 'eval-last-sexp)

(defmacro m-map-key (key obj)
  `(let* ((ks (cadr ',key)) (mk (kbd (concat "M-g " ks))))
     (define-key key-translation-map
       ,key (if (symbolp ,obj) (progn (global-set-key mk ,obj) mk) ,obj))))
(m-map-key (kbd ";") 'c-toggle-visual-mode)
(m-map-key (kbd "<f10>") 'toggle-truncate-lines)
(m-map-key (kbd "<f12>") 'c-toggle-frame)
(m-map-key (kbd "<f4>") 'c-sort-lines-or-paragraphs)
(m-map-key (kbd "<f5>") (kbd "C-x C-s"))
(m-map-key (kbd "<f6>") 'c-switch-to-prev-buffer)
(m-map-key (kbd "<f7>") 'c-switch-to-next-buffer)
(m-map-key (kbd "<f8>") 'kill-this-buffer)
(m-map-key (kbd "<f9>") 'linum-mode)
(m-map-key (kbd "M-'") 'comment-kill)
(m-map-key (kbd "M-,") (kbd "C-/"))
(m-map-key (kbd "M-.") (kbd "C-M-i"))
(m-map-key (kbd "M-/") nil)
(m-map-key (kbd "M-0") 'c-transpose-paragraphs-down)
(m-map-key (kbd "M-7") 'c-transpose-paragraphs-up)
(m-map-key (kbd "M-8") 'c-transpose-lines-up)
(m-map-key (kbd "M-9") 'c-transpose-lines-down)
(m-map-key (kbd "M-;") (kbd ";"))
(m-map-key (kbd "M-<") nil)
(m-map-key (kbd "M->") nil)
(m-map-key (kbd "M-[") 'c-toggle-page)
(m-map-key (kbd "M-\"") nil)
(m-map-key (kbd "M-]") 'c-page-down)
(m-map-key (kbd "M-a") nil)
(m-map-key (kbd "M-b") nil)
(m-map-key (kbd "M-c") nil)
(m-map-key (kbd "M-d") nil)
(m-map-key (kbd "M-e") 'c-eval-expression)
(m-map-key (kbd "M-f") nil)
(m-map-key (kbd "M-g") (kbd "C-g"))
(m-map-key (kbd "M-h") 'c-highlight-symbol-recall)
(m-map-key (kbd "M-i") 'c-highlight-symbol)
(m-map-key (kbd "M-j") 'c-word-capitalize)
(m-map-key (kbd "M-k") 'c-word-downcase)
(m-map-key (kbd "M-l") 'c-word-upcase)
(m-map-key (kbd "M-m") nil)
(m-map-key (kbd "M-n") nil)
(m-map-key (kbd "M-o") 'c-highlight-symbol-next)
(m-map-key (kbd "M-p") 'c-page-up)
(m-map-key (kbd "M-q") 'c-query-replace-regexp)
(m-map-key (kbd "M-r") 'c-other-window)
(m-map-key (kbd "M-s") (kbd "C-M-s"))
(m-map-key (kbd "M-t") nil)
(m-map-key (kbd "M-u") 'c-highlight-symbol-prev)
(m-map-key (kbd "M-v") nil)
(m-map-key (kbd "M-w") nil)
(m-map-key (kbd "M-x") 'c-execute-extended-command)
(m-map-key (kbd "M-y") 'c-highlight-symbol-definition)
(m-map-key (kbd "M-z") nil)
(m-map-key (kbd "M-{") nil)
(m-map-key (kbd "M-}") nil)
(m-map-key (kbd "S-<backspace>") 'c-backward-kill-line)

(defun f-ctrl (prefix)
  (let* ((k (read-key-sequence nil))
	 (cmd (key-binding (kbd (concat "C-" prefix " " k)))))
    (when cmd (call-interactively cmd))))
(define-key visual-mode-map (kbd "c") '(lambda () (interactive) (f-ctrl "c")))
(define-key visual-mode-map (kbd "h") '(lambda () (interactive) (f-ctrl "h")))
(define-key visual-mode-map (kbd "x") '(lambda () (interactive) (f-ctrl "x")))

(setq w32-apps-modifier 'hyper)
(m-map-key (kbd "H-<down>") (kbd "C-x ^"))
(m-map-key (kbd "H-<left>") (kbd "C-x {"))
(m-map-key (kbd "H-<right>") (kbd "C-x }"))
(m-map-key (kbd "H-<up>") 'shrink-window)
(m-map-key (kbd "H-i") 'c-kmacro-edit-macro)
(m-map-key (kbd "H-j") 'c-kmacro-cycle-ring-previous)
(m-map-key (kbd "H-k") 'c-kmacro-delete-ring-head)
(m-map-key (kbd "H-l") 'c-kmacro-cycle-ring-next)
(m-map-key (kbd "H-o") 'c-kmacro-end-or-call-macro)
(m-map-key (kbd "H-s") 'c-cycle-search-whitespace-regexp)
(m-map-key (kbd "H-u") 'c-kmacro-start-macro)

;; global-set-key
(global-set-key (kbd "C-c g") 'keyboard-quit)
(global-set-key (kbd "C-c i") 'c-cycle-paren-shapes)
(global-set-key (kbd "C-h g") 'keyboard-quit)
(global-set-key (kbd "C-x 4") 'winner-undo)
(global-set-key (kbd "C-x 8") 'beginning-of-buffer)
(global-set-key (kbd "C-x 9") 'end-of-buffer)
(global-set-key (kbd "C-x DEL") 'c-revert-buffer)
(global-set-key (kbd "C-x c") 'save-buffers-kill-terminal)
(global-set-key (kbd "C-x d") 'c-dired)
(global-set-key (kbd "C-x e") 'eval-last-sexp)
(global-set-key (kbd "C-x f") 'c-find-file)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x q") 'read-only-mode)
(global-set-key (kbd "C-x s") 'c-switch-to-scratch)
(global-set-key (kbd "C-x x") 'c-copy-buffer)
(global-set-key (kbd "C-x z") 'suspend-frame)

;; visual-mode-map
(define-key visual-mode-map (kbd ".") 'hippie-expand)
(define-key visual-mode-map (kbd "0") 'c-paragraph-forward)
(define-key visual-mode-map (kbd "1") 'c-delete-indentation)
(define-key visual-mode-map (kbd "2") 'c-move-backward-line)
(define-key visual-mode-map (kbd "3") 'c-move-forward-line)
(define-key visual-mode-map (kbd "4") 'recenter-top-bottom)
(define-key visual-mode-map (kbd "5") 'c-mark-paragraph)
(define-key visual-mode-map (kbd "6") 'c-indent-paragraph)
(define-key visual-mode-map (kbd "7") 'c-paragraph-backward)
(define-key visual-mode-map (kbd "8") 'previous-line)
(define-key visual-mode-map (kbd "9") 'next-line)
(define-key visual-mode-map (kbd "H") 'c-cua-rectangle-mark-mode)
(define-key visual-mode-map (kbd "I") 'backward-up-list)
(define-key visual-mode-map (kbd "J") 'left-char)
(define-key visual-mode-map (kbd "K") 'c-delete-pair)
(define-key visual-mode-map (kbd "L") 'right-char)
(define-key visual-mode-map (kbd "M-g SPC") 'ignore)
(define-key visual-mode-map (kbd "P") 'c-backward-kill-sexp)
(define-key visual-mode-map (kbd "b") 'bs-show)
(define-key visual-mode-map (kbd "d") 'c-kill-region)
(define-key visual-mode-map (kbd "f") 'c-set-or-exchange-mark)
(define-key visual-mode-map (kbd "i") 'c-toggle-visual-mode)
(define-key visual-mode-map (kbd "j") 'left-char)
(define-key visual-mode-map (kbd "l") 'right-char)
(define-key visual-mode-map (kbd "n") 'backward-kill-paragraph)
(define-key visual-mode-map (kbd "o") 'right-word)
(define-key visual-mode-map (kbd "p") 'backward-kill-word)
(define-key visual-mode-map (kbd "q") 'c-query-replace)
(define-key visual-mode-map (kbd "r") 'c-other-window)
(define-key visual-mode-map (kbd "s") 'isearch-forward)
(define-key visual-mode-map (kbd "t") 'c-toggle-comment)
(define-key visual-mode-map (kbd "u") 'left-word)
(define-key visual-mode-map (kbd "v") 'split-line)
(define-key visual-mode-map (kbd "w") 'c-kill-ring-save)
(define-key visual-mode-map (kbd "z") 'undo)
