(defun c-so-jump-next ()
  (interactive)
  (unless (minibufferp)
    (let ((s (f-so-get-s)))
      (setq mark-active nil)
      (when s (f-so-jump s 1)))))

(defun c-so-jump-prev ()
  (interactive)
  (unless (minibufferp)
    (let ((s (f-so-get-s)))
      (setq mark-active nil)
      (when s (f-so-jump s -1)))))

(defun c-so-jump-to-definition ()
  (interactive)
  (unless (minibufferp)
    (let ((p t) (pt (point)) (s (f-so-get-s)))
      (when s
	(setq mark-active nil)
	(push-mark nil t)
	(while (and p (not (save-excursion
			     (f-beginning-of-line)
			     (looking-at-p (concat v-so-definition s)))))
	  (f-so-jump s 1 t t)
	  (when (= pt (point)) (setq p nil)))
	(f-so-count s)))))

(defun c-so-put ()
  (interactive)
  (unless (minibufferp)
    (let ((s (f-so-get-s)))
      (when s
	(if (assoc s v-so-kws) (f-so-remove-s s)
	  (f-so-count s (f-so-put-s s)))))))

(defun c-so-remove-all ()
  (interactive)
  (unless (minibufferp)
    (mapc 'f-so-remove-s (mapcar 'car v-so-kws))))

(defun f-so-count (s &optional note)
  (let* ((case-fold-search nil)
         (count (how-many s (point-min) (point-max))))
    (when (stringp note) (setq note (concat " (" note ")")))
    (message (concat (substring s 3 -3) ": %d/%d" note)
	     (1+ (how-many s (point-min) (1- (point))))
	     count)))

(defun f-so-get-s (&optional str)
  (let ((s (or str (thing-at-point 'symbol))))
    (when s (concat "\\_<" (regexp-quote s) "\\_>"))))

(defun f-so-jump (s dir &optional no-mark no-msg)
  (let* ((case-fold-search nil)
	 (bounds (bounds-of-thing-at-point 'symbol))
	 (offset (- (point) (if (> dir 0) (cdr bounds) (car bounds)))))
    (goto-char (- (point) offset))
    (let ((target (re-search-forward s nil t dir)))
      (unless target
	(goto-char (if (> dir 0) (point-min) (point-max)))
	(setq target (re-search-forward s nil nil dir)))
      (goto-char (+ target offset)))
    (unless no-mark (push-mark nil t))
    (unless no-msg (f-so-count s))))

(defun f-so-put-s (s)
  (let* ((case-fold-search nil)
	 (limit (length v-so-colors))
	 (ind (random limit))
	 (inds (mapcar 'cadr v-so-kws))
	 color face kw overlay)
    (unless (< (length v-so-kws) limit) (user-error "No more color"))
    (while (cl-find ind inds)
      (setq ind (random limit)))
    (setq color (elt v-so-colors ind)
	  face `((foreground-color . "black")
		 (background-color . ,color))
	  kw `(,s ,ind))
    (save-excursion
      (goto-char (point-min))
      (while (re-search-forward s nil t)
	(setq overlay (make-overlay (match-beginning 0) (match-end 0))
	      kw (append kw `(,overlay)))
	(overlay-put overlay 'face face)))
    (push kw v-so-kws)
    color))

(defun f-so-query-replace (s)
  (let ((replacement (read-string "Replacement: ")))
    (f-so-remove-s s)
    (beginning-of-thing 'symbol)
    (query-replace-regexp s replacement)
    (setq query-replace-defaults `(,(cons s replacement)))
    (f-so-put-s (f-so-get-s replacement))))

(defun f-so-remove-s (s)
  (let ((kw (assoc s v-so-kws)))
    (setq v-so-kws (delq kw v-so-kws))
    (mapc 'delete-overlay (cddr kw))))

(defvar v-so-colors)
(setq v-so-colors '(
		    "dodger blue"
		    "hot pink"
		    "orange"
		    "orchid"
		    "red"
		    "salmon"
		    "spring green"
		    "turquoise"
		    ))

(defvar v-so-definition "(?def[a-z-]* ")
(make-variable-buffer-local 'v-so-definition)

(defvar v-so-kws)
(make-variable-buffer-local 'v-so-kws)
