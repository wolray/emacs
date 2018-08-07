;; !package
(setq package-archives
      `(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
	;; ("melpa" . "http://melpa.org/packages/")
	("melpa" . ,(if (equal (system-name) "MI")
                        "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"
                      "http://elpa.zilongshanren.com/melpa/"))))

;; clang
(add-hook 'auto-mode-alist '("\\.cuh?\\'" . c-mode))
(add-hook 'c-mode-hook '(lambda () (setq tab-width 4)))

;; haskell
(defun c-haskell-load-module ()
  (interactive)
  (let ((module (buffer-name)))
    (save-buffer)
    (switch-to-haskell)
    (goto-char (point-max))
    (kill-region (line-beginning-position) (line-end-position))
    (insert (concat ":load " module))
    (comint-send-input)))
(add-hook 'haskell-mode-hook
	  '(lambda ()
             (setq symbol-overlay-definition-function
		   '(lambda (symbol)
		      (concat "\\(\\(let\\|type\\) \\)?"
			      symbol
			      "[^\n]* =[^>]")))
             ))

;; hippie-expand
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
	try-expand-dabbrev-all-buffers
	try-expand-dabbrev-from-kill
	try-complete-file-name-partially
	try-complete-file-name
	try-expand-all-abbrevs
	try-expand-list
	try-expand-line
	try-complete-lisp-symbol-partially
	try-complete-lisp-symbol))

;; magit
(setenv "GIT_ASKPASS" "git-gui--askpass")
(add-hook 'magit-status-sections-hook
	  '(lambda ()
	     (magit-insert-status-headers)
	     (magit-insert-untracked-files)
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
	     (magit-insert-unpulled-from-upstream)
	     (magit-insert-unpushed-to-upstream)
	     ))
(add-hook 'magit-status-headers-hook
	  '(lambda ()
	     (magit-insert-head-branch-header)
	     (magit-insert-diff-filter-header)
	     (magit-insert-error-header)
	     (magit-insert-repo-header)
	     (magit-insert-tags-header)
	     ;; (magit-insert-push-branch-header)
	     ;; (magit-insert-upstream-branch-header)
	     ))

;; org
(setq org-startup-indented t)
(add-hook 'org-mode-hook
	  '(lambda ()
	     (setq skip-chars-regexp "*"
                   just-tab t)
             ))
(add-hook 'org-after-todo-statistics-hook
	  '(lambda ()
	     (let (org-log-done org-log-states)
	       (org-todo (if (= n-not-done 0) "DONE" "TODO")))
             ))

;; python
(defun c-python-config-pandas ()
  (interactive)
  (insert (substring "
pd.options.display.expand_frame_repr=False
pd.options.display.max_colwidth=20
pd.options.display.max_rows=10
pd.options.display.precision=4
# pd.options.display.unicode.east_asian_width=True
" 1)))
(defun c-python-shell-send-line ()
  (interactive)
  (python-shell-send-region (line-beginning-position) (line-end-position)))
(add-hook 'python-mode-hook
	  '(lambda ()
	     (setq python-shell-interpreter "ipython")
             (add-to-list 'python-shell-completion-native-disabled-interpreters "ipython")
             ))

;; racket
(setq racket-racket-program "racket")
(setq racket-raco-program "raco")
(defun c-racket-send-buffer ()
  (interactive)
  (unless (minibufferp)
    (racket-send-region
     (point-min) (point-max))))

;; save
(add-hook 'before-save-hook 'f-delete-trailing-whitespace)

;; sql
(defun sql-replace ()
  (interactive)
  (let ((keywords '("and" "as" "bigint" "by" "case" "count" "create" "distinct" "double" "drop" "else" "end" "end" "exists" "from" "if" "insert" "join" "left" "length" "lifecycle" "not" "not" "null" "on" "or" "outer" "overwrite" "partition" "partitioned" "right" "select" "string" "table" "when" "where")))
    (dolist (word keywords)
      (save-excursion
        (goto-char (point-min))
        (while (re-search-forward (concat "\\_<" (regexp-quote word) "\\_>") nil t)
          (replace-match (upcase word)))))))
(add-hook 'sql-mode-hook '(lambda () (setq tab-width 4)))
