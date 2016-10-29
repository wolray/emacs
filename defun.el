(defmacro m-cycle-values (var values)
  `(let ((i (cl-position ,var ,values)))
     (setq ,var (elt ,values (if (and i (< (1+ i) (length ,values))) (1+ i) 0)))))

(defmacro m-map-key (obj key)
  `(let ((ks (cadr ',key)) mk vs)
     (define-key key-translation-map
       ,key (if (not (symbolp ,obj)) ,obj
	      (setq mk (kbd (concat "M-g " ks)))
	      (global-set-key mk ,obj) mk))
     (setq vs (substring ks -1))
     (when (and (string= "C" (substring ks 0 1))
		(string-match "[a-z]" vs)
		(or (= 3 (length ks))
		    (when (string= "S" (substring ks 2 3))
		      (setq vs (upcase vs)) t)))
       (define-key visual-mode-map
	 (kbd vs) (if (symbolp ,obj) ,obj (key-binding ,obj))))))

(defmacro m-set-number (num obj)
  `(let ((s (number-to-string ,num)) cs)
     (setq cs (concat "C-" s))
     (define-key number-mode-map
       (kbd cs) (if (symbolp ,obj) ,obj (key-binding ,obj)))
     (define-key key-translation-map (kbd s) (kbd cs))
     (define-key key-translation-map (kbd cs) (kbd s))))

(defun c-backward-kill-line ()
  (interactive)
  (kill-region (line-beginning-position) (point))
  (indent-for-tab-command))

(defun c-clear-shell ()
  (interactive)
  (unless (minibufferp)
    (let ((modes '(python-mode ess-mode)) (buffers '("*Python*" "*R*")) i)
      (setq i (cl-position major-mode modes))
      (if i (with-temp-buffer
	      (switch-to-buffer (elt buffers i))
	      (f-clear-shell)
	      (switch-to-prev-buffer))
	(f-clear-shell)))))

(defun c-copy-buffer ()
  (interactive)
  (save-excursion
    (goto-char (point-max))
    (unless (or (eobp) buffer-read-only) (newline)))
  (delete-trailing-whitespace)
  (kill-ring-save (point-min) (point-max))
  (unless (minibufferp) (message "Current buffer copied")))

(defun c-cua-rectangle-mark-mode (arg)
  (interactive "P")
  (unless (minibufferp)
    (visual-mode -1)
    (if cua-rectangle-mark-mode
	(cua-exchange-point-and-mark arg)
     (cua-rectangle-mark-mode))))

(defun c-cua-sequence-rectangle (first incr fmt)
  (interactive
   (let ((seq (split-string
	       (read-string (concat "1 (+1) ("
				    (substring cua--rectangle-seq-format 1)
				    "): ") nil nil))))
     (list (string-to-number (or (car seq) "1"))
    	   (string-to-number (or (cadr seq) "1"))
	   (concat "%" (cadr (cdr seq))))))
  (if (string= fmt "%") (setq fmt cua--rectangle-seq-format)
    (setq cua--rectangle-seq-format fmt))
  (cua--rectangle-operation 'clear nil t 1 nil
			    (lambda (s e _l _r)
			      (delete-region s e)
			      (insert (format fmt first))
			      (setq first (+ first incr)))))

(defun c-cycle-paren-shapes ()
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

(defun c-cycle-search-whitespace-regexp ()
  (interactive)
  (unless (minibufferp)
    (m-cycle-values search-whitespace-regexp '("\\s-+" ".*?"))
    (message "search-whitespace-regexp: \"%s\"" search-whitespace-regexp)))

(defun c-dired ()
  (interactive)
  (switch-to-buffer (dired-noselect default-directory))
  (revert-buffer))

(defun c-highlight-symbol ()
  (interactive)
  (unless (minibufferp)
    (visual-mode -1)
    (let ((s (highlight-symbol-get-symbol)))
      (if (or (not s) (highlight-symbol-symbol-highlighted-p s))
	  (highlight-symbol-remove-all)
	(highlight-symbol)
	(f-visual-mode)))))

(defun c-indent-paragraph ()
  (interactive)
  (save-excursion
    (mark-paragraph)
    (indent-region (region-beginning) (region-end))))

(defun c-kill-region ()
  (interactive)
  (if (use-region-p)
      (kill-region (region-beginning) (region-end))
    (kill-whole-line)
    (back-to-indentation)))

(defun c-kill-ring-save ()
  (interactive)
  (if (use-region-p)
      (kill-ring-save (region-beginning) (region-end))
    (save-excursion
      (f-beginning-of-line)
      (kill-ring-save (point) (line-end-position)))
    (unless (minibufferp) (message "Current line copied"))))

(defun c-kmacro-cycle-ring-next ()
  (interactive)
  (if (and last-kbd-macro (not kmacro-ring))
      (kmacro-display last-kbd-macro nil "Last macro")
    (kmacro-cycle-ring-next)))

(defun c-kmacro-cycle-ring-previous ()
  (interactive)
  (if (and last-kbd-macro (not kmacro-ring))
      (kmacro-display last-kbd-macro nil "Last macro")
    (kmacro-cycle-ring-previous)))

(defun c-kmacro-end-or-call-macro (arg)
  (interactive "P")
  (visual-mode -1)
  (cond ((minibufferp)
	 (if (eq last-command 'c-kmacro-end-or-call-macro) (insert "'()")
	   (insert "\\,(f-each )"))
	 (left-char))
	(defining-kbd-macro (kmacro-end-macro arg))
	((use-region-p)
	 (apply-macro-to-region-lines (region-beginning) (region-end)))
	(t (kmacro-call-macro arg t))))

(defun c-kmacro-start-macro (arg)
  (interactive "P")
  (visual-mode -1)
  (cond ((minibufferp)
	 (insert "\\,(f-incf)")
	 (left-char))
	(t (setq defining-kbd-macro nil)
	   (kmacro-start-macro arg))))

(defun c-move-backward-line ()
  (interactive)
  (if (eq major-mode 'org-mode)
      (cond ((f-bolp) (end-of-line 0))
	    (t (f-beginning-of-line)))
    (cond ((bolp) (end-of-line 0) (setq -move 2))
	  ((f-bolp) (beginning-of-line))
	  (t (f-beginning-of-line) (setq -move 1)))))

(defun c-move-down ()
  (interactive)
  (f-move-up-or-down 2))

(defun c-move-forward-line ()
  (interactive)
  (cond ((eolp) (f-beginning-of-line 2) (setq -move 1))
	((and (bolp) (not (f-bolp))) (f-beginning-of-line))
	(t (end-of-line))))

(defun c-move-up ()
  (interactive)
  (f-move-up-or-down 0))

(defun c-org-evaluate-time-range ()
  (interactive)
  (or
   (org-clock-update-time-maybe)
   (save-excursion
     (unless (org-at-timestamp-p)
       (beginning-of-line)
       (re-search-forward org-tsr-regexp (line-end-position) t))
     (unless (org-at-timestamp-p)
       (user-error "")))
   (let* ((ts1 (match-string 0))
	  (time1 (org-time-string-to-time ts1))
	  (t1 (time-to-days time1))
	  (t2 (time-to-days (current-time)))
	  (diff (- t2 t1)))
     (message "%s" (f-org-make-tdiff-string diff)))))

(defun f-org-make-tdiff-string (diff)
  (let ((y (floor (/ diff 365))) (d (mod diff 365)) (fmt "") (l nil))
    (cond ((= diff 0) (setq fmt "today"))
	  ((< diff 0)
	   (if (< y 0) (setq fmt (concat fmt "%d year"  (if (< y -1) "s") " ")
			     l (push (- y) l)))
	   (setq fmt (concat fmt "%d day"  (if (< d 364) "s") " until")
		 l (push (- 365 d) l)))
	  ((> diff 0)
	   (if (> y 0) (setq fmt (concat fmt "%d year"  (if (> y 1) "s") " ")
			     l (push y l)))
	   (setq fmt (concat fmt "%d day"  (if (> d 1) "s") " since")
		 l (push d l))))
    (apply 'format fmt (nreverse l))))

(defun c-page-down ()
  (interactive)
  (unless (minibufferp) (beginning-of-line (1+ -page))))

(defun c-page-up ()
  (interactive)
  (unless (minibufferp) (beginning-of-line (- (1- -page)))))

(defun c-paragraph-backward ()
  (interactive)
  (unless (minibufferp)
    (if (not (eq major-mode 'org-mode))
	(backward-paragraph)
      (org-backward-element)
      (skip-chars-forward -chars))
    (f-visual-mode)))

(defun c-paragraph-forward ()
  (interactive)
  (unless (minibufferp)
    (if (not (eq major-mode 'org-mode))
	(forward-paragraph)
      (org-forward-element)
      (skip-chars-forward -chars))
    (f-visual-mode)))

(defun c-python-shell-send-line ()
  (interactive)
  (python-shell-send-region
   (line-beginning-position) (line-end-position)))

(defun c-query-replace ()
  (interactive)
  (unless (minibufferp)
    (if (highlight-symbol-symbol-highlighted-p
	 (highlight-symbol-get-symbol))
	(call-interactively 'highlight-symbol-query-replace)
      (call-interactively 'query-replace))))

(defun c-query-replace-regexp ()
  (interactive)
  (unless (minibufferp) (call-interactively 'query-replace-regexp)))

(defun c-racket-send-buffer ()
  (interactive)
  (set-mark (point))
  (racket-send-region
   (point-min) (point-max)))

(defun c-revert-buffer ()
  (interactive)
  (when (and (not (minibufferp)) (buffer-modified-p))
    (revert-buffer t t)))

(defun c-set-or-exchange-mark (arg)
  (interactive "P")
  (if (use-region-p) (exchange-point-and-mark)
    (set-mark-command arg)))

(defun c-sort-lines-or-paragraphs ()
  (interactive)
  (unless (minibufferp)
    (if (use-region-p)
	(sort-lines nil (region-beginning) (region-end))
      (when (y-or-n-p (format "Sort all paragraphs?"))
	(sort-paragraphs nil (point-min) (point-max))))))

(defun c-switch-to-scratch ()
  (interactive)
  (switch-to-buffer "*scratch*"))

(defun c-toggle-comment (beg end)
  (interactive
   (if (use-region-p) (list (region-beginning) (region-end))
     (list (line-beginning-position) (line-beginning-position 2))))
  (unless (minibufferp)
    (comment-or-uncomment-region beg end)))

(defun c-toggle-frame ()
  (interactive)
  (m-cycle-values -frame '(100 70))
  (set-frame-parameter (selected-frame) 'alpha -frame))

(defun c-toggle-number-mode ()
  (interactive)
  (number-mode (and number-mode -1)))

(defun c-toggle-page ()
  (interactive)
  (unless (minibufferp)
    (m-cycle-values -page '(10 20 50))
    (message "-page: %s" -page)))

(defun c-toggle-visual-mode ()
  (interactive)
  (visual-mode (and visual-mode -1)))

(defun c-transpose-lines-down ()
  (interactive)
  (unless (minibufferp)
    (delete-trailing-whitespace)
    (end-of-line)
    (unless (eobp)
      (forward-line)
      (unless (eobp)
	(transpose-lines 1)
	(forward-line -1)
	(end-of-line)))))

(defun c-transpose-lines-up ()
  (interactive)
  (unless (minibufferp)
    (delete-trailing-whitespace)
    (beginning-of-line)
    (unless (or (bobp) (eobp))
      (forward-line)
      (transpose-lines -1)
      (beginning-of-line -1))
    (skip-chars-forward -chars)))

(defun c-transpose-paragraphs-down ()
  (interactive)
  (unless (minibufferp)
    (let ((p nil))
      (delete-trailing-whitespace)
      (backward-paragraph)
      (when (bobp) (setq p t) (newline))
      (forward-paragraph)
      (unless (eobp) (transpose-paragraphs 1))
      (when p (save-excursion (goto-char (point-min)) (kill-line))))))

(defun c-transpose-paragraphs-up ()
  (interactive)
  (unless (or (minibufferp) (save-excursion (backward-paragraph) (bobp)))
    (let ((p nil))
      (delete-trailing-whitespace)
      (backward-paragraph 2)
      (when (bobp) (setq p t) (newline))
      (forward-paragraph 2)
      (transpose-paragraphs -1)
      (backward-paragraph)
      (when p (save-excursion (goto-char (point-min)) (kill-line))))))

(defun c-word-capitalize ()
  (interactive)
  (capitalize-word -1))

(defun c-word-downcase ()
  (interactive)
  (downcase-word -1))

(defun c-word-upcase ()
  (interactive)
  (upcase-word -1))

(defun f-beginning-of-line (&optional n)
  (beginning-of-line n)
  (skip-chars-forward -chars))

(defun f-bolp ()
  (let ((pt (point)))
    (save-excursion
      (f-beginning-of-line)
      (eq pt (point)))))

(defun f-clear-shell ()
  (if (not (get-buffer-process (current-buffer)))
      (message "No inferior process")
    (delete-region (point-min) (point-max))
    (comint-send-input)
    (goto-char (point-min))
    (kill-line)))

(defun f-each (ls &optional repeat)
  (let ((index (floor (/ (cl-incf count 0) (or repeat 1)))))
    (if (< index (length ls)) (elt ls index)
      (keyboard-quit))))

(defun f-incf (&optional first incr repeat)
  (let ((index (floor (/ (cl-incf count 0) (or repeat 1)))))
    (+ (or first 1) (* (or incr 1) index))))

(defun f-move-up-or-down (n)
  (unless (minibufferp)
    (cond ((and (not (bolp)) (eolp))
	   (end-of-line n)
	   (setq -move 2))
	  ((and (not (bolp)) (f-bolp))
	   (f-beginning-of-line n)
	   (setq -move 1))
	  ((and (bolp) -move (or (eolp) (f-bolp)))
	   (cond ((= -move 1)
		  (f-beginning-of-line n))
		 ((= -move 2)
		  (end-of-line n))))
	  (t (next-line (1- n) (setq -move nil))))
    (f-visual-mode)))

(defun f-paragraph-set ()
  (setq paragraph-start "\f\\|[ \t]*$"
	paragraph-separate "[ \t\f]*$"))

(defun f-visual-mode ()
  (unless
      (or visual-mode
	  defining-kbd-macro
	  executing-kbd-macro
	  (not (cl-position major-mode
			    '(
			      emacs-lisp-mode
			      ess-mode
			      lisp-interaction-mode
			      matlab-mode
			      org-mode
			      python-mode
			      ))))
    (visual-mode)))

(defvar -chars " \t")
(make-variable-buffer-local '-chars)

(defvar -frame 100)

(defvar -move nil)
(make-variable-buffer-local '-move)

(defvar -page 10)
(make-variable-buffer-local '-page)
