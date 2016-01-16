
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

;; my-major-mode-hook
(defun my-major-mode-hook ()
  (auto-complete-mode)
  (local-unset-key (kbd "M-p"))
  (local-unset-key (kbd "M-n"))
  )

;; package-initialize
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-install 'auto-complete)
(package-install 'avy)
(package-install 'magit)
(package-install 'markdown-mode)
(package-install 'matlab-mode)
(defun my-package-menu-mode-hook ()
  (local-set-key (kbd "]") 'next-line)
  (local-unset-key (kbd "n"))
  (my-major-mode-hook)
  )
(add-hook 'package-menu-mode-hook 'my-package-menu-mode-hook)

;; auto-complete
(global-auto-complete-mode t)
(ac-linum-workaround)
(setq ac-auto-start nil)
(ac-set-trigger-key "<tab>")

;; magit
(setenv "GIT_ASKPASS" "git-gui--askpass")
(defun my-magit-mode-hook ()
  (local-set-key (kbd "]") 'magit-section-forward)
  (my-major-mode-hook)
  )
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

;; markdown-mode
(add-hook 'markdown-mode-hook 'my-major-mode-hook)

;; matlab-mode
(add-hook 'matlab-mode-hook 'my-major-mode-hook)

;; org-mode
(setq org-startup-indented t)
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)
(add-hook 'org-mode-hook 'my-major-mode-hook)

;; python-mode
(setq python-indent-offset 4)
(add-hook 'python-mode-hook 'my-major-mode-hook)
