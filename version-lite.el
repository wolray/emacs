(defun c-org-occur ()
  (interactive)
  (if (string= buffer-file-name _org)
      (let ((link (f-org-occur-get-link)))
	(when link
	  (f-org-occur (regexp-quote link) t)))
    (f-org-occur "* +[0-9]+\\.[0-9]+\\.[0-9][0-9][01][0-9][0-3][0-9]" t 2)))

(defun c-update-version ()
  (interactive)
  (let* ((link (concat "[[" buffer-file-name "]]"))
	 (link-regexp (regexp-quote link)))
    (find-file-other-window _org)
    (visual-mode (setq _vm 1))
    (org-remove-occur-highlights nil nil t)
    (f-show-content)
    (let* ((old (and (re-search-forward link-regexp nil t)
		     (re-search-backward " +")
		     (buffer-substring (f-beginning-of-line 0) (point))))
	   (temp (f-org-occur link-regexp))
	   (prompt (concat (when old (concat "Last version: " old ". ")) "New version: "))
	   (new (read-string prompt))
	   (date (format-time-string ".%y%m%d" (current-time))))
      (f-show-content)
      (align-regexp 3 (point-max) "\\(\\s-*\\)\\[\\[")
      (call-interactively 'org-insert-subheading)
      (insert (concat new date " " link))
      (align-regexp 3 (point-max) "\\(\\s-*\\)\\[\\[")
      (save-buffer))))

(defun f-org-occur (regexp &optional msg beg end)
  (let ((cnt 0) (para org-occur-parameters))
    (org-remove-occur-highlights nil nil t)
    (if para (org-content)
      (push regexp org-occur-parameters)
      (save-excursion
	(goto-char (point-min))
	(org-overview)
	(while (re-search-forward regexp nil t)
	  (setq cnt (1+ cnt))
	  (when org-highlight-sparse-tree-matches
	    (org-highlight-new-match
	     (+ (or beg 0) (match-beginning 0))
	     (+ (or end 0) (match-end 0))))
	  (org-show-context 'occur-tree)))
      (when org-remove-highlights-with-change
	(org-add-hook 'before-change-functions
		      'org-remove-occur-highlights nil 'local))
      (recenter)
      (when msg (message "%d match(es)" cnt)))))

(defun f-org-occur-get-link ()
  (save-excursion
    (end-of-line)
    (when (re-search-backward "\\[\\[[a-z]:/.*\\]\\]" nil t)
      (buffer-substring-no-properties
       (match-beginning 0) (match-end 0)))))

(defun f-show-content ()
  (goto-char 3)
  (org-content))

(defvar _org (concat default_dir "..org"))
