;; !package
(setq package-archives
      '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
	;; ("melpa" . "http://elpa.zilongshanren.com/melpa/")
	("melpa" . "http://melpa.org/packages/")
	;; ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
	))
(package-initialize)
((lambda (&rest packages)
   (dolist (pkg packages)
     (unless (package-installed-p pkg)
       (when (y-or-n-p (format "Package \"%s\" not found. Install it? " pkg))
	 (package-install pkg)))))
 'ample-theme
 'ess
 'ghc
 'highlight-symbol
 'magit
 'markdown-mode
 'matlab-mode
 )
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
(require 'cua-rect)
(define-key cua--rectangle-keymap (kbd "C-M-b") 'cua-move-rectangle-left)
(define-key cua--rectangle-keymap (kbd "C-M-f") 'cua-move-rectangle-right)
(define-key cua--rectangle-keymap (kbd "M-g I") 'cua-exchange-point-and-mark)

;; edmacro-mode
(define-key edmacro-mode-map (kbd "C-x C-k RET") 'kill-this-buffer)

;; ess
(defun f-ess-mode ()
  (local-set-key (kbd "C-c C-c") 'ess-eval-buffer)
  (local-set-key (kbd "M-g C-y") 'ess-eval-line)
  (local-set-key (kbd "M-g Y") 'ess-eval-region)
  (local-unset-key (kbd "C-c C-r"))
  (local-unset-key (kbd "C-c C-s"))
  (local-unset-key (kbd "_"))
  (setq ess-indent-level 2)
  )
(add-hook 'ess-mode-hook 'f-ess-mode)
(defun f-ess-post-run ()
  (local-unset-key (kbd "_"))
  (setq -chars (concat ">" -chars))
  )
(add-hook 'ess-R-post-run-hook 'f-ess-post-run)

;; highlight-symbol
(require 'highlight-symbol)
(setq highlight-symbol-colors
      '(;; "yellow"
	"DeepPink" ;; "cyan"
	"MediumPurple1" "SpringGreen1" "DarkOrange" "HotPink1" "RoyalBlue1" "OliveDrab"))

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
	try-complete-lisp-symbol))

;; latex
(defun f-latex-mode ()
  (f-paragraph-set))
  (setq tab-width 2)
(add-hook 'latex-mode-hook 'f-latex-mode)

;; magit
(setenv "GIT_ASKPASS" "git-gui--askpass")
(defun f-magit-mode ()
  (local-set-key (kbd "[") 'magit-section-toggle)
  (local-set-key (kbd "]") 'magit-section-forward)
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
  (local-set-key (kbd "C-c C--") 'c-org-evaluate-time-range)
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
  (setq -chars (concat "*" -chars)
	-move 1))
(add-hook 'org-mode-hook 'f-org-mode)

;; python
(defun f-python-mode ()
  (local-set-key (kbd "C-c C-r") 'run-python)
  (local-set-key (kbd "M-g C-y") 'c-python-shell-send-line)
  (local-set-key (kbd "M-g Y") 'python-shell-send-region)
  (setq python-shell-interpreter "ipython")
  )
(add-hook 'python-mode-hook 'f-python-mode)

;; racket
(setq racket-racket-program "racket")
(setq racket-raco-program "raco")
(defun f-racket-mode ()
  (local-set-key (kbd "C-c C-c") 'c-racket-send-buffer)
  (local-set-key (kbd "M-g C-y") 'racket-send-last-sexp)
  )
(add-hook 'racket-mode-hook 'f-racket-mode)

;; save
(add-hook 'before-save-hook 'f-delete-trailing-whitespace)

;; sql
(defun f-sql-mode ()
  (setq tab-width 4))
(add-hook 'sql-mode-hook 'f-sql-mode)

;; theme
(load-theme 'ample t)
(set-cursor-color "#ffffff")
