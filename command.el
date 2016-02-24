;; ba
(defun my-backward-kill-line ()
  (interactive)
  (kill-region
   (line-beginning-position) (point))
  (indent-for-tab-command))

;; bu
(defun my-buffer-paragraph-style ()
  (interactive)
  (when (y-or-n-p (format "my-buffer-paragraph-style?"))
    (save-excursion
      (beginning-of-buffer)
      (while (not (eobp))
	(open-line 1)
	(delete-blank-lines)
	(forward-paragraph 1)))))

;; co
(defun my-copy-buffer ()
  (interactive)
  (kill-ring-save
   (point-min) (point-max))
  (message "my-copy-buffer"))

;; cy
(defun my-cycle-paren-shapes ()
  (interactive)
  (save-excursion
    (unless (looking-at-p (rx (any "([")))
      (backward-up-list))
    (let ((pt (point))
          (new (cond ((looking-at-p (rx "(")) (cons "[" "]"))
                     ((looking-at-p (rx "[")) (cons "(" ")"))
                     (t (beep) nil))))
      (when new
        (forward-sexp)
        (delete-char -1)
        (insert (cdr new))
        (goto-char pt)
        (delete-char 1)
        (insert (car new))))))

;; ki
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

;; or
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
       (goto-char (line-beginning-position))
       (re-search-forward org-tsr-regexp (line-end-position) t))
     (unless (org-at-timestamp-p)
       (user-error "")))
   (let* ((ts1 (match-string 0))
	  (time1 (org-time-string-to-time ts1))
	  (t1 (time-to-days time1))
	  (t2 (time-to-days (current-time)))
	  (diff (- t2 t1)))
     (message "%s" (my-org-make-tdiff-string diff)))))

;; pa
(defvar page-range 10)
(make-variable-buffer-local 'page-range)
(defun my-page-range-toggle ()
  (interactive)
  (cond ((= page-range 10) (setq page-range 20))
	((= page-range 20) (setq page-range 50))
	((= page-range 50) (setq page-range 10))
	(t (setq page-range 10)))
  (message (format "(page-range ?%d)" page-range)))
(defun my-page-up ()
  (interactive)
  (move-beginning-of-line (- (1- page-range))))
(defun my-page-down ()
  (interactive)
  (move-beginning-of-line (1+ page-range)))

;; py
(defun my-python-shell-send-line ()
  (interactive)
  (python-shell-send-region
   (line-beginning-position) (line-end-position)))

;; ra
(defun my-racket-send-buffer ()
  (interactive)
  (set-mark (point))
  (racket-send-region
   (point-min) (point-max)))

;; se
(defun my-search-whitespace-regexp ()
  (interactive)
  (if (equal search-whitespace-regexp "\\s-+")
      (progn
	(setq search-whitespace-regexp ".*?")
	(message "(search-whitespace-regexp ?\".*?\")"))
    (progn
      (setq search-whitespace-regexp "\\s-+")
      (message "(search-whitespace-regexp ?\"\\\\s-+\")"))))

;; sk
(defvar skip-chars " \t")
(make-variable-buffer-local 'skip-chars)
(defun my-move-beginning-of-line ()
  (interactive)
  (skip-chars-backward skip-chars)
  (move-beginning-of-line (if (bolp) 0 1))
  (skip-chars-forward skip-chars))
(defun my-move-end-of-line ()
  (interactive)
  (move-end-of-line (if (eolp) 2 1)))

;; so
(defun my-sort-lines ()
  (interactive)
  (when (region-active-p)
    (sort-lines nil (region-beginning) (region-end))))
(defun my-sort-paragraphs ()
  (interactive)
  (sort-paragraphs nil (point-min) (point-max)))

;; sw
(defun my-switch-to-buffer-scratch ()
  (interactive)
  (switch-to-buffer "*scratch*"))

;; to
(defun my-toggle-comment (beg end)
  (interactive (if (use-region-p)
		   (list (region-beginning) (region-end))
		 (list (line-beginning-position)
		       (line-beginning-position 2))))
  (comment-or-uncomment-region beg end))

;; tr-l
(defun my-transpose-lines-up ()
  (interactive)
  (move-beginning-of-line 1)
  (unless (or (bobp) (eobp))
    (next-line 1)
    (transpose-lines -1)
    (previous-line 2))
  (back-to-indentation))
(defun my-transpose-lines-down ()
  (interactive)
  (move-end-of-line 1)
  (unless (eobp)
    (next-line 1)
    (unless (eobp)
      (transpose-lines 1)
      (previous-line 1)
      (move-end-of-line 1))))

;; tr-p
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

;; wo
(defun my-upcase-word ()
  (interactive)
  (upcase-word -1))
(defun my-capitalize-word ()
  (interactive)
  (capitalize-word -1))
(defun my-downcase-word ()
  (interactive)
  (downcase-word -1))
