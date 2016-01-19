
(defun my-buffer-paragraph-style ()
  (interactive)
  (when (y-or-n-p (format "my-buffer-paragraph-style?"))
    (save-excursion
      (beginning-of-buffer)
      (while (not (eobp))
	(open-line 2)
	(delete-blank-lines)
	(forward-paragraph 1)))))

(defvar page-range 5)
(make-variable-buffer-local 'page-range)
(defun my-page-jump-minus ()
  (interactive)
  (cond ((= page-range 5) nil)
	((= page-range 10) (setq page-range 5))
	((= page-range 20) (setq page-range 10))
	((= page-range 50) (setq page-range 20))
	((= page-range 100) (setq page-range 50))
	(t (setq page-range 5)))
  (message (format "page-range %d" page-range)))
(defun my-page-jump-plus ()
  (interactive)
  (cond ((= page-range 5) (setq page-range 10))
	((= page-range 10) (setq page-range 20))
	((= page-range 20) (setq page-range 50))
	((= page-range 50) (setq page-range 100))
	((= page-range 100) nil)
	(t (setq page-range 5)))
  (message (format "page-range %d" page-range)))
(defun my-page-up ()
  (interactive)
  (move-beginning-of-line (- (1- page-range))))
(defun my-page-down ()
  (interactive)
  (move-beginning-of-line (1+ page-range)))

(defun my-switch-to-minibuffer ()
  (interactive)
  (when (active-minibuffer-window)
    (select-window (active-minibuffer-window))))

(defun my-ac-sources ()
  (interactive)
  (unless auto-complete-mode (auto-complete-mode))
  (if (<= (length ac-sources) 2)
      (progn
	(setq ac-sources
	      (append ac-sources
		      '(
			ac-source-files-in-current-dir
			ac-source-functions
			ac-source-variables
			)))
	(message "(length ac-sources) %d" (length ac-sources)))
    (progn
      (nbutlast ac-sources 3)
      (message "(length ac-sources) %d" (length ac-sources)))))

(defun my-search-whitespace-regexp ()
  (interactive)
  (if (equal search-whitespace-regexp "\\s-+")
      (progn
	(setq search-whitespace-regexp ".*?")
	(message "search-whitespace-regexp \".*?\""))
    (progn
      (setq search-whitespace-regexp "\\s-+")
      (message "search-whitespace-regexp \"\\\\s-+\""))))

(defun my-kill-region ()
  (interactive)
  (if (region-active-p)
      (kill-region (region-beginning) (region-end))
    (kill-whole-line 1)))
(defun my-kill-ring-save ()
  (interactive)
  (if (region-active-p)
      (kill-ring-save
       (region-beginning) (region-end))
    (kill-ring-save
     (line-beginning-position) (line-end-position))))

(defun my-upcase-word ()
  (interactive)
  (upcase-word -1))
(defun my-capitalize-word ()
  (interactive)
  (capitalize-word -1))
(defun my-downcase-word ()
  (interactive)
  (downcase-word -1))

(defun my-comment (beg end)
  (interactive (if (use-region-p)
		   (list (region-beginning) (region-end))
		 (list (line-beginning-position)
		       (line-beginning-position 2))))
  (comment-or-uncomment-region beg end))

(defun my-move-beginning-of-line ()
  (interactive)
  (move-beginning-of-line (if (bolp) 0 1)))
(defun my-move-end-of-line ()
  (interactive)
  (move-end-of-line (if (eolp) 2 1)))

(defun my-org-make-tdiff-string (diff)
  (let ((y (floor (/ diff 365)))
	(d (mod diff 365))
	(fmt "")
	(l nil))
    (cond ((= diff 0)
	   (setq fmt "today"))
	  ((< diff 0)
	   (if (< y 0)
	       (setq fmt (concat fmt "%d year"  (if (< y -1) "s") " ")
		     l (push (- y) l)))
	   (setq fmt (concat fmt "%d day"  (if (< d 364) "s") " until")
		 l (push (- 365 d) l)))
	  ((> diff 0)
	   (if (> y 0)
	       (setq fmt (concat fmt "%d year"  (if (> y 1) "s") " ")
		     l (push y l)))
	   (setq fmt (concat fmt "%d day"  (if (> d 1) "s") " since")
		 l (push d l))))
    (apply 'format fmt (nreverse l))))
(defun my-org-evaluate-time-range ()
  (interactive)
  (or
   (org-clock-update-time-maybe)
   (save-excursion
     (unless (org-at-timestamp-p)
       (goto-char (point-at-bol))
       (re-search-forward org-tsr-regexp (point-at-eol) t))
     (unless (org-at-timestamp-p)
	 (user-error "")))
   (let* ((ts1 (match-string 0))
	  (time1 (org-time-string-to-time ts1))
	  (t1 (time-to-days time1))
	  (t2 (time-to-days (current-time)))
	  (diff (- t2 t1)))
     (message "%s" (my-org-make-tdiff-string diff)))))

(defun my-transpose-lines-up ()
  (interactive)
  (move-beginning-of-line 1)
  (unless (or (bobp) (eobp))
    (progn (next-line 1)
	   (transpose-lines -1)
	   (previous-line 2))))
(defun my-transpose-lines-down ()
  (interactive)
  (move-end-of-line 1)
  (unless (eobp)
    (progn
      (next-line 1)
      (unless (eobp) (transpose-lines 1))
      (previous-line 1)
      (move-end-of-line 1))))

(defun my-transpose-paragraphs-up ()
  (interactive)
  (backward-paragraph 1)
  (if (bobp) (forward-paragraph)
    (progn
      (forward-paragraph 1)
      (transpose-paragraphs -1)
      (backward-paragraph 1))))
(defun my-transpose-paragraphs-down ()
  (interactive)
  (backward-paragraph 1)
  (forward-paragraph 1)
  (unless (eobp)
    (transpose-paragraphs 1)))
