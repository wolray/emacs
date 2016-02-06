
;; save
(defun my-before-save ()
  (delete-trailing-whitespace))
(add-hook 'before-save-hook 'my-before-save)

;; window
(column-number-mode 1)
(line-number-mode 1)
(scroll-bar-mode 0)
(winner-mode 1)
(require 'linum)
(global-linum-mode 1)

;; buffer
(show-paren-mode 1)
(electric-pair-mode 1)
(delete-selection-mode 1)
(setq-default indent-tabs-mode t)
(setq x-select-enable-clipboard t)
(fset 'yes-or-no-p 'y-or-n-p)

;; package-menu-mode
(require 'package)
(setq package-archives '(("melpa" . "http://melpa.org/packages/")))
;; (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(package-install 'auto-complete)
(package-install 'avy)
(package-install 'magit)
(package-install 'markdown-mode)
(package-install 'matlab-mode)
(package-install 'racket-mode)
(defun my-package-menu-mode ()
  (local-set-key (kbd "[") 'package-menu-describe-package)
  (local-set-key (kbd "]") 'next-line)
  (local-unset-key (kbd "n"))
  (auto-complete-mode))
(add-hook 'package-menu-mode-hook 'my-package-menu-mode)

;; auto-complete
(require 'auto-complete)
(ac-linum-workaround)
(setq ac-auto-start nil)
(ac-set-trigger-key "M-g M-,")		;sad
(define-key ac-complete-mode-map (kbd "M-g M-j") 'ac-previous)
(define-key ac-complete-mode-map (kbd "M-g M-l") 'ac-next)

;; avy
(setq avy-keys '(?a ?b ?c ?d ?e ?f ?g ?h ?i ?j ?k ?l ?m ?n ?o ?p ?q ?r ?s ?t ?u ?v ?w ?x ?y ?z ?, ?.))

;; bs-mode
(defun my-bs-mode ()
  (local-set-key (kbd "-") 'bs-set-current-buffer-to-show-never)
  (local-set-key (kbd "=") 'bs-set-current-buffer-to-show-always)
  (local-set-key (kbd "[") 'bs-select)
  (local-set-key (kbd "]") 'bs-down)
  (local-set-key (kbd "w") 'bs-toggle-readonly)
  (local-set-key (kbd "d") 'bs-delete)
  (local-set-key (kbd "f") 'bs-select-other-window)
  (local-unset-key (kbd "+"))
  (local-unset-key (kbd "u"))
  (local-unset-key (kbd "o"))
  (local-unset-key (kbd "n"))
  (local-unset-key (kbd "k"))
  (local-unset-key (kbd "m"))
  (local-unset-key (kbd "M"))
  (local-unset-key (kbd "t"))
  (local-unset-key (kbd "S"))
  (local-unset-key (kbd "C"))
  (local-unset-key (kbd "b"))
  (local-unset-key (kbd "~"))
  (local-unset-key (kbd "%"))
  )
(add-hook 'bs-mode-hook 'my-bs-mode)

;; elisp-mode
(defun my-emacs-lisp-mode ()
  (setq skip-chars " \t;")
  (auto-complete-mode))
(add-hook 'emacs-lisp-mode-hook 'my-emacs-lisp-mode)

;; html-mode
(add-hook 'html-mode-hook 'auto-complete-mode)

;; magit-mode
(setenv "GIT_ASKPASS" "git-gui--askpass")
(defun my-magit-mode ()
  (local-set-key (kbd "[") 'magit-section-toggle)
  (local-unset-key (kbd "TAB"))
  (local-set-key (kbd "]") 'magit-section-forward)
  (local-unset-key (kbd "n"))
  (auto-complete-mode))
(add-hook 'magit-mode-hook 'my-magit-mode)
(defun my-magit-status-sections ()
  (magit-insert-status-headers)
  (magit-insert-merge-log)
  ;; (magit-insert-rebase-sequence)
  (magit-insert-am-sequence)
  (magit-insert-sequencer-sequence)
  (magit-insert-bisect-output)
  (magit-insert-bisect-rest)
  (magit-insert-bisect-log)
  ;; (magit-insert-untracked-files)
  (magit-insert-tracked-files)
  (magit-insert-unstaged-changes)
  (magit-insert-staged-changes)
  (magit-insert-stashes)
  ;; (magit-insert-unpulled-from-upstream)
  (magit-insert-unpulled-from-pushremote)
  ;; (magit-insert-unpushed-to-upstream)
  (magit-insert-unpushed-to-pushremote)
  )
(add-hook 'magit-status-sections-hook 'my-magit-status-sections)
(defun my-magit-status-headers ()
  (magit-insert-error-header)
  (magit-insert-diff-filter-header)
  (magit-insert-head-branch-header)
  (magit-insert-repo-header)
  ;; (magit-insert-upstream-branch-header)
  ;; (magit-insert-push-branch-header)
  (magit-insert-tags-header)
  )
(add-hook 'magit-status-headers-hook 'my-magit-status-headers)

;; markdown-mode
(defun my-markdown-mode ()
  (setq skip-chars " \t#")
  (auto-complete-mode))
(add-hook 'markdown-mode-hook 'my-markdown-mode)

;; matlab-mode
(defun my-matlab-mode ()
  (setq skip-chars " \t%")
  (auto-complete-mode))
(add-hook 'matlab-mode-hook 'my-matlab-mode)

;; org-mode
(setq org-startup-indented t)
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)
(defun my-org-mode ()
  (local-set-key (kbd "C-c C--") 'my-org-evaluate-time-range)
  (local-set-key (kbd "C-c C-=") 'org-time-stamp)
  (local-set-key (kbd "C-c C-M-p") 'org-clock-in)
  (local-set-key (kbd "C-c M-ESC") 'org-clock-cancel)
  (local-set-key (kbd "C-c C-]") 'outline-next-visible-heading)
  (local-set-key (kbd "C-c C-M-]") 'org-clock-out)
  (local-set-key (kbd "C-c ;") 'org-table-toggle-coordinate-overlays)
  (local-set-key (kbd "C-c C-s") 'org-sort)
  (local-set-key (kbd "C-c C-M-s") 'org-schedule)
  (local-set-key (kbd "C-c C-d") 'org-sparse-tree)
  (local-set-key (kbd "C-c C-M-d") 'org-deadline)
  (setq skip-chars " \t*")
  (auto-complete-mode))
(add-hook 'org-mode-hook 'my-org-mode)

;; python-mode
(defun my-python-mode ()
  (local-set-key (kbd "M-<return>") 'my-python-shell-send-line)
  (local-set-key (kbd "C-c C-e") 'run-python)
  (local-set-key (kbd "C-c C-d") 'python-shell-send-defun)
  (local-unset-key (kbd "C-c C-p"))
  (setq skip-chars " \t#")
  (auto-complete-mode))
(add-hook 'python-mode-hook 'my-python-mode)

;; racket-mode
(setq racket-racket-program "racket")
(setq racket-raco-program "raco")
(defun my-racket-mode ()
  (local-set-key (kbd "M-<return>") 'racket-send-last-sexp)
  (local-set-key (kbd "C-x C-e") 'my-racket-send-buffer)
  (local-unset-key (kbd "C-c C-p"))
  (setq skip-chars " \t;")
  (auto-complete-mode))
(add-hook 'racket-mode-hook 'my-racket-mode)
(add-hook 'racket-repl-mode-hook 'auto-complete-mode)

;; with-editor-mode
(defun my-with-editor-mode ()
  (auto-complete-mode))
(add-hook 'with-editor-mode-hook 'my-with-editor-mode)
