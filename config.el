
;; save

(add-hook 'before-save-hook 'delete-trailing-whitespace)

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

;; org-mode

(setq org-startup-indented t)
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

;; python

(setq python-indent-offset 4)

;; package-initialize

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(defun my-package-menu-mode-hook ()
  (local-set-key (kbd "]") 'next-line)
  (local-unset-key (kbd "n")))
(add-hook 'package-menu-mode-hook 'my-package-menu-mode-hook)

;; installed-package (auto-complete)

(global-auto-complete-mode t)
(ac-linum-workaround)
(setq ac-auto-start nil)
(ac-set-trigger-key "<tab>")
(add-hook 'org-mode-hook 'auto-complete-mode)
(add-hook 'matlab-mode-hook 'auto-complete-mode)

;; installed-package (magit)

(setenv "GIT_ASKPASS" "git-gui--askpass")

(defun my-magit-mode-hook ()
  (local-set-key (kbd "]") 'magit-section-forward)
  (local-unset-key (kbd "n")))
(add-hook 'magit-mode-hook 'my-magit-mode-hook)

(defun my-magit-status-sections-hook ()
	(magit-insert-status-headers)
	(magit-insert-merge-log)
	;; (magit-insert-rebase-sequence)
	(magit-insert-am-sequence)
	(magit-insert-sequencer-sequence)
	(magit-insert-bisect-output)
	(magit-insert-bisect-rest)
	(magit-insert-bisect-log)
	;; (magit-insert-untracked-files)
	(magit-insert-tracked-files)		;add-hook
	(magit-insert-unstaged-changes)
	(magit-insert-staged-changes)
	(magit-insert-stashes)
	;; (magit-insert-unpulled-from-upstream)
	(magit-insert-unpulled-from-pushremote)
	;; (magit-insert-unpushed-to-upstream)
	(magit-insert-unpushed-to-pushremote)
	)
(add-hook 'magit-status-sections-hook 'my-magit-status-sections-hook)

(defun my-magit-status-headers-hook ()
	(magit-insert-error-header)
	(magit-insert-diff-filter-header)
	(magit-insert-head-branch-header)
	(magit-insert-repo-header)
	;; (magit-insert-upstream-branch-header)
	;; (magit-insert-push-branch-header)
	(magit-insert-tags-header)
	)
(add-hook 'magit-status-headers-hook 'my-magit-status-headers-hook)
