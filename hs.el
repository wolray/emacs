(defun c-hs-highlight ()
  (interactive)
  (unless (minibufferp)
    (let ((s (f-hs-get-s)))
      (when s
	(if (assoc s v-hs-kws) (f-hs-remove-s s)
	  (f-hs-count s (f-hs-highlight-s s)))))))

(defun c-hs-jump-next ()
  (interactive)
  (unless (minibufferp)
    (let ((s (f-hs-get-s)))
      (setq mark-active nil)
      (when s (f-hs-jump s 1)))))

(defun c-hs-jump-prev ()
  (interactive)
  (unless (minibufferp)
    (let ((s (f-hs-get-s)))
      (setq mark-active nil)
      (when s (f-hs-jump s -1)))))

(defun c-hs-jump-to-definition ()
  (interactive)
  (unless (minibufferp)
    (let ((p t) (pt (point)) (s (f-hs-get-s)))
      (when s
	(setq mark-active nil)
	(push-mark nil t)
	(while (and p (not (save-excursion
			     (f-beginning-of-line)
			     (looking-at-p (concat v-hs-definition s)))))
	  (f-hs-jump s 1 t t)
	  (when (= pt (point)) (setq p nil)))
	(f-hs-count s)))))

(defun c-hs-remove-all ()
  (interactive)
  (unless (minibufferp)
    (mapc 'f-hs-remove-s (mapcar 'car v-hs-kws))))

(defun f-hs-count (s &optional note)
  (let* ((case-fold-search nil)
         (count (how-many s (point-min) (point-max))))
    (when (stringp note) (setq note (concat " (" note ")")))
    (message (concat (substring s 3 -3) ": %d/%d" note)
	     (1+ (how-many s (point-min) (1- (point))))
	     count)))

(defun f-hs-get-s (&optional str)
  (let ((s (or str (thing-at-point 'symbol))))
    (when s (concat "\\_<" (regexp-quote s) "\\_>"))))

(defun f-hs-highlight-s (s)
  (let* ((case-fold-search nil)
	 (limit (length v-hs-colors))
	 (ind (random limit))
	 (inds (mapcar 'cadr v-hs-kws))
	 color face kw overlay)
    (unless (< (length v-hs-kws) limit) (user-error "No more color"))
    (while (cl-find ind inds)
      (setq ind (random limit)))
    (setq color (elt v-hs-colors ind)
	  face `((foreground-color . "black")
		 (background-color . ,color))
	  kw `(,s ,ind))
    (save-excursion
      (goto-char (point-min))
      (while (re-search-forward s nil t)
	(setq overlay (make-overlay (match-beginning 0) (match-end 0))
	      kw (append kw `(,overlay)))
	(overlay-put overlay 'face face)))
    (push kw v-hs-kws)
    color))

(defun f-hs-jump (s dir &optional no-mark no-msg)
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
    (unless no-msg (f-hs-count s))))

(defun f-hs-query-replace (s)
  (let ((replacement (read-string "Replacement: ")))
    (f-hs-remove-s s)
    (beginning-of-thing 'symbol)
    (query-replace-regexp s replacement)
    (setq query-replace-defaults `(,(cons s replacement)))
    (f-hs-highlight-s (f-hs-get-s replacement))))

(defun f-hs-remove-s (s)
  (let ((kw (assoc s v-hs-kws)))
    (setq v-hs-kws (delq kw v-hs-kws))
    (mapc 'delete-overlay (cddr kw))))

(defvar v-hs-colors)
(setq v-hs-colors '(
		    "dodger blue"
		    "hot pink"
		    "orange"
		    "orchid"
		    "red"
		    "salmon"
		    "spring green"
		    "turquoise"
		    ))

(defvar v-hs-definition "(?def[a-z-]* ")
(make-variable-buffer-local 'v-hs-definition)

(defvar v-hs-kws)
(make-variable-buffer-local 'v-hs-kws)
