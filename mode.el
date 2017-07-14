;; !package
(defun c-package-check ()
  (interactive)
  (let ((packages '(auto-complete
                    color-theme-solarized
                    ess
                    haskell-mode
                    magit
                    markdown-mode
                    matlab-mode)))
    (dolist (pkg packages)
      (unless (package-installed-p pkg)
        (when (y-or-n-p (format "Package \"%s\" not found. Install it? " package))
          (package-install pkg))))))
(setq package-archives
      '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
	("melpa" . "http://elpa.zilongshanren.com/melpa/")
	;; ("melpa" . "http://melpa.org/packages/")
	;; ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
        ))

;; auto-complete
(when (package-installed-p 'auto-complete)
  (setq ac-auto-start nil)
  (setq-default
   ac-sources '(ac-source-words-in-same-mode-buffers
                ac-source-files-in-current-dir
                ac-source-functions
                ac-source-words-in-all-buffer))
  (global-auto-complete-mode)
  (ac-linum-workaround)
  (fset 'ac-symbol-documentation nil))

;; cua
(defun c-cua-sequence-rectangle (first incr fmt)
  (interactive
   (let ((seq (split-string
	       (read-string (concat "1 (+1) ("
				    (substring cua--rectangle-seq-format 1)
				    "): ")))))
     (list (string-to-number (or (car seq) "1"))
    	   (string-to-number (or (cadr seq) "1"))
	   (concat "%" (cadr (cdr seq))))))
  (if (string= fmt "%") (setq fmt cua--rectangle-seq-format)
    (setq cua--rectangle-seq-format fmt))
  (cua--rectangle-operation 'clear nil t 1 nil
			    (lambda (s e _l _r)
			      (delete-region s e)
			      (insert (format fmt first))
			      (setq first (+ first incr)))))

;; ess
(add-hook 'ess-mode-hook
	  '(lambda ()
	     (setq ess-indent-level 2)))
(add-hook 'ess-R-post-run-hook
	  '(lambda ()
	     (setq v-skip-chars ">")))

;; haskell
(defun c-insert-arrow-1 ()
  (interactive)
  (let (p)
    (save-excursion
      (backward-sexp)
      (cond ((looking-at-p "<-")
	     (insert "->") (delete-char 2))
	    ((looking-at-p "->")
	     (insert "<-") (delete-char 2))
	    (t (setq p t))))
    (when p (insert "->"))))
(defun c-insert-arrow-2 ()
  (interactive)
  (insert "=>"))
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
			      "[^\n]* =[^>]")))))
(add-hook 'inferior-haskell-mode-hook 'auto-complete-mode)

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
(add-hook 'latex-mode-hook
	  '(lambda ()
	     (f-paragraph-set)
	     (setq tab-width 2)))

;; magit
(setenv "GIT_ASKPASS" "git-gui--askpass")
(add-hook 'magit-status-sections-hook
	  '(lambda ()
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

;; matlab
(add-hook 'matlab-mode-hook
	  '(lambda ()
	     (auto-complete-mode)
	     (setq auto-fill-function nil)))

;; org
(setq org-startup-indented t)
(add-hook 'org-mode-hook
	  '(lambda ()
	     (setq v-skip-chars "*")))
(add-hook 'org-after-todo-statistics-hook
	  '(lambda ()
	     (let (org-log-done org-log-states)
	       (org-todo (if (= n-not-done 0) "DONE" "TODO")))))

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
	     (add-to-list 'python-shell-completion-native-disabled-interpreters "ipython")
	     (setq python-shell-interpreter "ipython")))

;; racket
(setq racket-racket-program "racket")
(setq racket-raco-program "raco")

;; save
(add-hook 'before-save-hook 'f-delete-trailing-whitespace)

;; sql
(add-hook 'sql-mode-hook
	  '(lambda ()
	     (setq tab-width 4)))
