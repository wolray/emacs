;; !package
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(defun f-package-menu-mode ()
  (local-set-key (kbd "[") 'package-menu-describe-package)
  (local-set-key (kbd "]") 'next-line)
  (local-unset-key (kbd "n"))
  )
(add-hook 'package-menu-mode-hook 'f-package-menu-mode)

;; bs
(defun f-bs-mode ()
  (local-set-key (kbd "-") 'bs-set-current-buffer-to-show-never)
  (local-set-key (kbd "=") 'bs-set-current-buffer-to-show-always)
  (local-set-key (kbd "[") 'bs-select)
  (local-set-key (kbd "]") 'bs-down)
  (local-set-key (kbd "i") 'bs-select)
  (local-set-key (kbd "o") 'bs-down)
  (local-set-key (kbd "r") 'bs-select-other-window)
  (local-set-key (kbd "u") 'bs-up)
  (local-set-key (kbd "w") 'bs-toggle-readonly)
  (local-unset-key (kbd "%"))
  (local-unset-key (kbd "+"))
  (local-unset-key (kbd "C"))
  (local-unset-key (kbd "M"))
  (local-unset-key (kbd "S"))
  (local-unset-key (kbd "b"))
  (local-unset-key (kbd "f"))
  (local-unset-key (kbd "k"))
  (local-unset-key (kbd "n"))
  (local-unset-key (kbd "t"))
  (local-unset-key (kbd "~"))
  )
(add-hook 'bs-mode-hook 'f-bs-mode)

;; cua
(cua-rectangle-mark-mode)
(define-key cua--rectangle-keymap (kbd "<left>") 'cua-move-rectangle-left)
(define-key cua--rectangle-keymap (kbd "<right>") 'cua-move-rectangle-right)
(define-key cua--rectangle-keymap (kbd "C-<left>") 'cua-move-rectangle-up)
(define-key cua--rectangle-keymap (kbd "C-<right>") 'cua-move-rectangle-down)
(define-key cua--rectangle-keymap (kbd "C-s") 'f-cua-sequence-rectangle)
(define-key cua--rectangle-keymap (kbd "TAB") 'cua-exchange-point-and-mark)

;; ess
(defun f-ess-mode ()
  (local-set-key (kbd "C-c C-c") 'ess-eval-buffer)
  (local-set-key (kbd "C-c c") 'f-ess-clear-inferior)
  (local-set-key (kbd "M-g C-S-y") 'ess-eval-region)
  (local-set-key (kbd "M-g C-y") 'ess-eval-line)
  (local-unset-key (kbd "C-c C-r"))
  (local-unset-key (kbd "C-c C-s"))
  (local-unset-key (kbd "_"))
  (setq ess-indent-level 2)
  )
(add-hook 'ess-mode-hook 'f-ess-mode)
(defun f-ess-post-run ()
  (local-unset-key (kbd "_"))
  (setq v-skip-chars (concat ">" v-skip-chars))
  )
(add-hook 'ess-R-post-run-hook 'f-ess-post-run)

;; highlight-symbol
(setq highlight-symbol-colors '("DeepPink" "cyan" "MediumPurple1" "SpringGreen1" "DarkOrange" "HotPink1" "RoyalBlue1" "OliveDrab"))

;; hippie-expand
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
	try-expand-dabbrev-visible
	try-expand-dabbrev-all-buffers
	try-expand-dabbrev-from-kill
	try-complete-file-name-partially
	try-complete-file-name
	try-expand-all-abbrevs
	try-expand-list
	try-expand-line
	try-complete-lisp-symbol-partially
	try-complete-lisp-symbol
	))

;; latex
(defun f-latex-mode ()
  (setq tab-width 2)
  (f-paragraph-set))
(add-hook 'latex-mode-hook 'f-latex-mode)

;; magit
(setenv "GIT_ASKPASS" "git-gui--askpass")
(defun f-magit-mode ()
  (local-set-key (kbd "[") 'magit-section-toggle)
  (local-set-key (kbd "]") 'magit-section-forward)
  (local-unset-key (kbd "TAB"))
  (local-unset-key (kbd "n"))
  )
(add-hook 'magit-mode-hook 'f-magit-mode)
(defun f-magit-status-sections ()
  (magit-insert-status-headers)
  (magit-insert-tracked-files)
  (magit-insert-unstaged-changes)
  (magit-insert-staged-changes)
  (magit-insert-unpulled-from-pushremote)
  (magit-insert-unpushed-to-pushremote)
  (magit-insert-am-sequence)
  (magit-insert-bisect-log)
  (magit-insert-bisect-output)
  (magit-insert-bisect-rest)
  (magit-insert-merge-log)
  (magit-insert-sequencer-sequence)
  (magit-insert-stashes)
  ;; (magit-insert-rebase-sequence)
  ;; (magit-insert-unpulled-from-upstream)
  ;; (magit-insert-unpushed-to-upstream)
  ;; (magit-insert-untracked-files)
  )
(add-hook 'magit-status-sections-hook 'f-magit-status-sections)
(defun f-magit-status-headers ()
  (magit-insert-head-branch-header)
  (magit-insert-diff-filter-header)
  (magit-insert-error-header)
  (magit-insert-repo-header)
  (magit-insert-tags-header)
  ;; (magit-insert-push-branch-header)
  ;; (magit-insert-upstream-branch-header)
  )
(add-hook 'magit-status-headers-hook 'f-magit-status-headers)

;; org
(setq org-startup-indented t)
(defun f-org-summary-todo (n-done n-not-done)
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
(add-hook 'org-after-todo-statistics-hook 'f-org-summary-todo)
(defun f-org-mode ()
  (local-set-key (kbd "C-c C--") 'f-org-evaluate-time-range)
  (local-set-key (kbd "C-c C-=") 'org-time-stamp)
  (local-set-key (kbd "C-c C-M-d") 'org-deadline)
  (local-set-key (kbd "C-c C-M-s") 'org-schedule)
  (local-set-key (kbd "C-c C-d") 'org-sparse-tree)
  (local-set-key (kbd "C-c C-s") 'org-sort)
  (local-set-key (kbd "C-c e") 'org-edit-special)
  (local-set-key (kbd "C-c t") 'org-table-toggle-coordinate-overlays)
  (local-set-key (kbd "M-g C-c C-8") 'org-up-element)
  (local-unset-key (kbd "C-c ["))
  (local-unset-key (kbd "C-c ]"))
  (setq v-skip-chars (concat "*" v-skip-chars))
  )
(add-hook 'org-mode-hook 'f-org-mode)

;; python
(defun f-python-mode ()
  (local-set-key (kbd "C-c C-r") 'run-python)
  (local-set-key (kbd "C-c c") 'f-python-shell-clear-shell)
  (local-set-key (kbd "M-g C-S-y") 'python-shell-send-region)
  (local-set-key (kbd "M-g C-y") 'f-python-shell-send-line)
  (setq python-shell-interpreter "ipython")
  )
(add-hook 'python-mode-hook 'f-python-mode)

;; racket
(setq racket-racket-program "racket")
(setq racket-raco-program "raco")
(defun f-racket-mode ()
  (local-set-key (kbd "C-c C-c") 'f-racket-send-buffer)
  (local-set-key (kbd "M-g C-y") 'racket-send-last-sexp)
  )
(add-hook 'racket-mode-hook 'f-racket-mode)

;; save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; sql
(defun f-sql-mode ()
  (setq tab-width 4))
(add-hook 'sql-mode-hook 'f-sql-mode)

;; visual-mode
(define-minor-mode visual-mode
  :init-value nil
  :keymap (make-sparse-keymap)
  (setq cursor-type (if visual-mode 'box 'bar)))
(dolist (k '("`" "5" "8" "*" "9" "("
	     "w" "e" "r" "t" "y" "u" "o" "\\"
	     "a" "d" "f" "j" "k" "l"
	     "z" "v" "b" "m"))
  (define-key visual-mode-map (kbd k) (kbd (concat "C-" k))))
(dolist (k '("R" "Y" "U" "O"
	     "D" "F" "H" "J" "K" "L"))
  (define-key visual-mode-map (kbd k) (kbd (concat "C-S-" (downcase k)))))
(define-key visual-mode-map (kbd "1") 'f-kmacro-view-macro)
(define-key visual-mode-map (kbd "2") 'f-kmacro-start-macro)
(define-key visual-mode-map (kbd "3") 'f-kmacro-end-or-call-macro)
(define-key visual-mode-map (kbd "4") 'f-query-replace-regexp)
(define-key visual-mode-map (kbd "G") 'keyboard-quit)
(define-key visual-mode-map (kbd "I") 'recenter-top-bottom)
(define-key visual-mode-map (kbd "S") 'isearch-forward)
(define-key visual-mode-map (kbd "g") 'keyboard-quit)
(define-key visual-mode-map (kbd "i") 'f-visual-mode-off)
(define-key visual-mode-map (kbd "q") 'f-query-replace)
(define-key visual-mode-map (kbd "s") 'isearch-forward)
