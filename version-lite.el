(defun c-org-occur ()
  (interactive)
  (if (string= buffer-file-name org_file)
      (let ((link (f-org-occur-get-link)))
	(when link
	  (f-org-occur (regexp-quote link) t)))
    (f-org-occur (concat "* +[0-9]+\\.[0-9]+ " time_regexp) t 2)))

(defun c-org-time-stamp ()
  (interactive)
  (insert (concat " " (format-time-string time_format (current-time)))))

(defun c-update-version ()
  (interactive)
  (let* ((link (concat "[[" buffer-file-name "]]"))
	 (link-regexp (regexp-quote link))
	 (modtime (visited-file-modtime)))
    (unless (eq modtime 0)
      (find-file-other-window org_file)
      (org-remove-occur-highlights nil nil t)
      (goto-char 3) (org-content)
      (let* ((old (and (re-search-forward link-regexp nil t)
		       (re-search-backward "[0-9] +[0-9][0-9]-")
		       (buffer-substring (f-beginning-of-line 0) (1+ (point)))))
	     (temp (f-org-occur link-regexp))
	     (prompt (concat (when old (concat "Last version: " old ". ")) "New version: "))
	     (new (read-string prompt))
	     (blank1 (make-string (- 9 (length new)) ?\s))
	     (date (format-time-string time_format modtime))
	     (blank2 (make-string 4 ?\s)))
	(goto-char 3) (org-content)
	(call-interactively 'org-insert-subheading)
	(insert (concat new blank1 date blank2 link))
	(save-buffer)))))

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

(defvar org_file (concat default_dir "..org"))
(defvar time_format "%y-%m-%d %H:%M")
(defvar time_regexp "[0-9][0-9]-[01][0-9]-[0-3][0-9]\\( [0-2][0-9]:[0-5][0-9]\\)?")
