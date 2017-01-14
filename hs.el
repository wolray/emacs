(defun c-hs-higlight ()
  (interactive)
  (unless (minibufferp)
    (let ((s (f-hs-get-s)))
      (when s
	(if (assoc s v-hs-keywords-alist)
	    (f-hs-remove-s s)
	  (f-hs-count s (f-hs-add-s s)))))))

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
	  (f-hs-jump s -1 t t)
	  (when (= pt (point)) (setq p nil)))
	(f-hs-count s)))))

(defun c-hs-remove-all ()
  (interactive)
  (unless (minibufferp)
    (mapc 'f-hs-remove-s
	  (mapcar 'car v-hs-keywords-alist))))

(defun f-hs-add-s (s)
  (unless (assoc s v-hs-keywords-alist)
    (let* ((color (m-cycle-values v-hs-color v-hs-colors))
	   (face `((background-color . ,color)
		   (foreground-color . "black")))
	   (keywords `(,s 0 ',face prepend)))
      (push keywords v-hs-keywords-alist)
      (font-lock-add-keywords nil (list keywords) 'append)
      (font-lock-fontify-buffer)
      color)))

(defun f-hs-count (s &optional note)
  (let* ((case-fold-search nil)
         (count (how-many s (point-min) (point-max))))
    (when (stringp note) (setq note (concat " (" note ")")))
    (if (= count 0)
	(message (concat "Only occurrence in buffer" note))
      (message (concat "Occurrence %d/%d in buffer" note)
	       (1+ (how-many s (point-min) (1- (point))))
	       count))))

(defun f-hs-get-s ()
  (let ((s (thing-at-point 'symbol)))
    (when s (concat "\\_<" (regexp-quote s) "\\_>"))))

(defun f-hs-jump (s dir &optional no-mark no-msg)
  (let* ((case-fold-search nil)
	 (bounds (bounds-of-thing-at-point 'symbol))
	 (offset (- (point) (if (> dir 0) (cdr bounds) (car bounds)))))
    (unless no-mark (push-mark nil t))
    (goto-char (- (point) offset))
    (let ((target (re-search-forward s nil t dir)))
      (unless target
	(goto-char (if (> dir 0) (point-min) (point-max)))
	(setq target (re-search-forward s nil nil dir)))
      (goto-char (+ target offset)))
    (unless no-msg (f-hs-count s))
    (setq this-command 'f-hs-jump)))

(defun f-hs-query-replace ()
  (let ((s (f-hs-get-s))
	(replacement (read-string "Replacement: ")))
    (goto-char (beginning-of-thing 'symbol))
    (query-replace-regexp s replacement)
    (setq query-replace-defaults `(,(cons s replacement)))))

(defun f-hs-remove-s (s)
  (let ((keywords (assoc s v-hs-keywords-alist)))
    (setq v-hs-keywords-alist
          (delq keywords v-hs-keywords-alist))
    (font-lock-remove-keywords nil (list keywords))
    (f-hs-flush)))

(defvar v-hs-color nil)

(defvar v-hs-colors)
(setq v-hs-colors '(
		    "dark orange"
		    "dodger blue"
		    "hot pink"
		    "orchid"
		    "red"
		    "salmon"
		    "spring green"
		    "tomato"
		    "turquoise"
		    ))

(defvar v-hs-definition "(?def[a-z-]* ")
(make-variable-buffer-local 'v-hs-definition)

(defvar v-hs-keywords-alist nil)
(make-variable-buffer-local 'v-hs-keywords-alist)
