(defun so-count-s (s &optional note)
  (let ((case-fold-search nil)
	(keyword (assoc s so-keywords))
	bounds overlay)
    (when keyword
      (setq bounds (bounds-of-thing-at-point 'symbol)
	    overlay (car (overlays-at (car bounds))))
      (when (stringp note) (setq note (concat " (" note ")")))
      (message (concat (substring s 3 -3) ": %d/%d" note)
	       (- (cl-position overlay keyword) 1)
	       (- (length keyword) 2)))))

(defun so-get-s (&optional str)
  (let ((s (or str (thing-at-point 'symbol))))
    (when s (concat "\\_<" (regexp-quote s) "\\_>"))))

(defun so-jump-s (s dir)
  (let* ((case-fold-search nil)
	 (bounds (bounds-of-thing-at-point 'symbol))
	 (offset (- (point) (if (> dir 0) (cdr bounds) (car bounds)))))
    (goto-char (- (point) offset))
    (let ((target (re-search-forward s nil t dir)))
      (unless target
	(goto-char (if (> dir 0) (point-min) (point-max)))
	(setq target (re-search-forward s nil nil dir)))
      (goto-char (+ target offset)))))

(defun so-jump-call (jump-function &optional back)
  (unless (minibufferp)
    (let ((s (so-get-s)))
      (when s
	(setq mark-active nil)
	(push-mark nil t)
        (funcall jump-function s (if back -1 1))
	(so-count-s s)))))

(defun so-jump-next ()
  (interactive)
  (so-jump-call 'so-jump-s))

(defun so-jump-prev ()
  (interactive)
  (so-jump-call 'so-jump-s t))

(defun so-jump-to-def ()
  (interactive)
  (so-jump-call
   '(lambda (s dir)
      (let ((p t) (pt (point)))
	(so-jump-s s dir)
	(while (and p (not (save-excursion
			     (beginning-of-line)
			     (skip-chars-forward " \t")
			     (looking-at-p
			      (funcall so-def-function s)))))
	  (so-jump-s s dir)
	  (when (= pt (point)) (setq p nil)))))))

(defun so-put ()
  (interactive)
  (unless (minibufferp)
    (let ((s (so-get-s)))
      (when s
	(if (assoc s so-keywords) (so-remove-s s)
	  (so-count-s s (so-put-s s)))))))

(defun so-put-s (s)
  (let* ((case-fold-search nil)
	 (limit (length so-colors))
	 (index (random limit))
	 (indexes (mapcar 'cadr so-keywords))
	 color face keyword overlay)
    (when (>= (length so-keywords) limit) (user-error "No more color"))
    (while (cl-find index indexes)
      (setq index (random limit)))
    (setq color (elt so-colors index)
	  face `((foreground-color . "black")
		 (background-color . ,color))
	  keyword `(,s ,index))
    (save-excursion
      (goto-char (point-min))
      (while (re-search-forward s nil t)
	(setq overlay (make-overlay (match-beginning 0) (match-end 0))
	      keyword (append keyword `(,overlay)))
	(overlay-put overlay 'face face)))
    (push keyword so-keywords)
    color))

(defun so-query-replace-s (s)
  (let ((replacement (read-string "Replacement: ")))
    (so-remove-s s)
    (beginning-of-thing 'symbol)
    (query-replace-regexp s replacement)
    (setq query-replace-defaults `(,(cons s replacement)))
    (so-put-s (so-get-s replacement))))

(defun so-remove-all ()
  (interactive)
  (unless (minibufferp)
    (mapc 'so-remove-s (mapcar 'car so-keywords))))

(defun so-remove-s (s)
  (let ((keyword (assoc s so-keywords)))
    (setq so-keywords (delq keyword so-keywords))
    (mapc 'delete-overlay (cddr keyword))))

(defvar so-colors)
(setq so-colors '("dodger blue"
		    "hot pink"
		    "orange"
		    "orchid"
		    "red"
		    "salmon"
		    "spring green"
		    "turquoise"))

(defvar so-def-function
  '(lambda (s) (concat "(?def[a-z-]* " s)))
(make-variable-buffer-local 'so-def-function)

(defvar so-keywords)
(make-variable-buffer-local 'so-keywords)
