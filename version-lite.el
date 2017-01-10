(defun c-vl-occur ()
  (interactive)
  (when (string= buffer-file-name vl_log_file)
    (save-excursion
      (end-of-line)
      (when (re-search-backward "\\[\\[d:/.*\\]\\]" nil t)
	(let* ((link (buffer-substring (match-beginning 0) (match-end 0)))
	       (link-regexp (regexp-quote link)))
	  (f-vl-format link-regexp)
	  (f-vl-occur link-regexp))))))

(defun c-vl-update (&optional folder current)
  (interactive)
  (let* ((link (concat "[[" (or folder (concat buffer-file-name current)) "]]"))
	 (link-regexp (regexp-quote link))
	 (modtime (if folder (current-time) (visited-file-modtime))))
    (unless (eq modtime 0)
      (find-file-other-window vl_log_file)
      (visual-mode)
      (org-remove-occur-highlights nil nil t)
      (goto-char 3) (org-content)
      (let* ((date (format-time-string "%y-%m-%d %H:%M" modtime))
	     (old (and (re-search-forward link-regexp nil t)
		       (re-search-backward "[0-9]+\\.[0-9]+" nil t)
		       (buffer-substring (match-beginning 0) (match-end 0))))
	     (temp (f-vl-occur link-regexp))
	     (prompt (concat (when old (concat "Last version: " old ". ")) "New version: "))
	     (new (read-string prompt)))
	(goto-char 3) (org-content)
	(call-interactively 'org-insert-subheading)
	(insert (concat date (make-string 4 ?\s) new " * " link))
	(f-vl-format link-regexp)))))

(defun c-vl-update-current ()
  (interactive)
  (let ((pt (point)))
    (f-beginning-of-line)
    (if (not (bolp)) (goto-char pt)
      (f-skip-chars "*")
      (let* ((st (buffer-substring (point) (line-end-position)))
	     (rs (concat (regexp-quote st) "$")))
	(goto-char pt)
	(if (= (how-many rs 3 (point-max)) 1)
	    (c-vl-update nil (concat "::" st))
	  (error "Not unique in current file!"))))))

(defun c-vl-update-folder ()
  (interactive)
  (c-vl-update default-directory))

(defun f-vl-format (regexp)
  (let ((p t) (pt (point)))
    (goto-char (point-max)) (org-content)
    (while (and p (re-search-backward regexp nil t))
      (if (>= (how-many regexp 3 (point)) 5) (kill-whole-line)
	(setq p nil)))
    (goto-char pt))
  (align-regexp 3 (point-max) "\\.[0-9]+\\( +\\)\\* \\[\\[" nil 4))

(defun f-vl-occur (regexp &optional beg end)
  (let ((para org-occur-parameters))
    (org-remove-occur-highlights nil nil t)
    (if para (org-content)
      (push regexp org-occur-parameters)
      (save-excursion
	(goto-char 3)
	(org-overview)
	(while (re-search-forward regexp nil t)
	  (org-highlight-new-match
	   (+ (or beg 0) (match-beginning 0))
	   (+ (or end 0) (match-end 0)))
	  (org-show-context 'occur-tree)))
      (org-add-hook 'before-change-functions
		    'org-remove-occur-highlights nil 'local)
      (recenter))))

(defvar vl_log_file (concat default_dir "..org"))
