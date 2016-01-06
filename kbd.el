
;; C-

(global-set-key (kbd "C-v") 'open-line)
(global-unset-key (kbd "C-o"))
(define-key key-translation-map (kbd "C-z") (kbd "C-/"))
(global-set-key (kbd "C-`") 'universal-argument)
(global-unset-key (kbd "C-u"))
(define-key key-translation-map (kbd "C-<tab>") (kbd "C-x o"))
(global-set-key (kbd "C-\\") 'delete-indentation)
;; (global-unset-key nil)

(global-set-key (kbd "C-<return>")
		'(lambda ()
		   (interactive)
		   (forward-paragraph 1)
		   (newline 2)
		   (previous-line 1)))
(define-key key-translation-map (kbd "M-RET") (kbd "C-j"))

;; M-

(define-key key-translation-map (kbd "M-j") (kbd "<left>"))
(define-key key-translation-map (kbd "M-l") (kbd "<right>"))
(define-key key-translation-map (kbd "M-i") (kbd "<up>"))
(define-key key-translation-map (kbd "M-k") (kbd "<down>"))

(define-key key-translation-map (kbd "M-u") (kbd "DEL"))
(define-key key-translation-map (kbd "M-o") (kbd "<deletechar>"))

(define-key key-translation-map (kbd "M-h") (kbd "C-h"))
(define-key key-translation-map (kbd "M-n") (kbd "C-x o"))
(define-key key-translation-map (kbd "M-,") (kbd "C-/"))
(define-key key-translation-map (kbd "M-.") (kbd "C-g"))

;; kill

(define-key key-translation-map (kbd "C-a") (kbd "C-k"))
(define-key key-translation-map (kbd "C-e") (kbd "C-y"))

(global-set-key (kbd "C-d") 'kill-word)
(global-unset-key (kbd "M-d"))
(global-set-key (kbd "C-f") 'kill-sexp)
(global-unset-key (kbd "C-M-k"))
(global-set-key (kbd "C-t") 'kill-paragraph)
;; (global-unset-key nil)

(global-set-key (kbd "C-<backspace>") 'backward-kill-word)
(global-unset-key (kbd "M-DEL"))
(global-set-key (kbd "C-M-<backspace>") 'backward-kill-sexp)
(global-unset-key (kbd "ESC <C-backspace>"))
(global-set-key (kbd "M-<backspace>") 'backward-kill-paragraph)
;; (global-unset-key nil)

(global-set-key (kbd "C-w")
		'(lambda ()
		   (interactive)
		   (if (region-active-p)
		       (kill-region (region-beginning) (region-end))
		     (kill-whole-line 1))))
(global-set-key (kbd "M-w")
		'(lambda ()
		   (interactive)
		   (if (region-active-p)
		       (kill-ring-save
			(region-beginning) (region-end))
		     (kill-ring-save
		      (line-beginning-position) (line-end-position)))))

;; comment

(global-set-key (kbd "M-'") 'comment-kill)
;; (global-unset-key nil)
(defun my-comment (beg end)
  (interactive (if (use-region-p)
		   (list (region-beginning) (region-end))
		 (list (line-beginning-position)
		       (line-beginning-position 2))))
  (comment-or-uncomment-region beg end))
(global-set-key (kbd "M-[") 'my-comment)

;; cursor

(global-set-key (kbd "C-p")
		'(lambda ()
		   (interactive)
		   (move-beginning-of-line (if (bolp) 0 1))))
(global-set-key (kbd "C-]")
		'(lambda ()
		   (interactive)
		   (move-end-of-line (if (eolp) 2 1))))

(global-set-key (kbd "C--") 'left-word)
;; (global-unset-key (kbd "C-<left>"))
;; (global-unset-key (kbd "M-<left>"))
(global-set-key (kbd "C-=") 'right-word)
;; (global-unset-key (kbd "C-<right>"))
;; (global-unset-key (kbd "M-<right>"))

(global-set-key (kbd "C-M-p") 'backward-paragraph)
(global-unset-key (kbd "M-{"))
(global-set-key (kbd "C-M-]") 'forward-paragraph)
(global-unset-key (kbd "M-}"))

(global-set-key (kbd "C-M--") 'backward-sexp)
(global-unset-key (kbd "C-M-b"))
(global-set-key (kbd "C-M-=") 'forward-sexp)
(global-unset-key (kbd "C-M-f"))

;; region

(global-set-key (kbd "C-x C-x") 'set-mark-command)
(global-unset-key (kbd "C-@"))
(define-key key-translation-map (kbd "C-M-[") (kbd "M-h"))

;; transpose

(global-set-key (kbd "M-p")
		'(lambda ()
		   (previous-line 1)
		   (next-line 1)
		   (interactive)
		   (transpose-lines 1)
		   (previous-line 2)))
(global-set-key (kbd "M-]")
		'(lambda ()
		   (interactive)
		   (next-line 1)
		   (if (eobp) (next-line 1)
		     (progn (transpose-lines 1) (previous-line 1)))))

(global-set-key (kbd "M--")
		'(lambda ()
		   (interactive)
		   (transpose-paragraphs -1)
		   (backward-paragraph 1)))
(global-set-key (kbd "M-=")
		'(lambda ()
		   (interactive)
		   (backward-paragraph 1)
		   (forward-paragraph 1)
		   (if (eobp) (next-line 1) (transpose-paragraphs 1))))

;; buffer

(global-set-key (kbd "C-_") 'previous-buffer)
(global-unset-key (kbd "C-x <left>"))
(global-unset-key (kbd "C-x C-<left>"))
(global-set-key (kbd "C-+") 'next-buffer)
(global-unset-key (kbd "C-x <right>"))
(global-unset-key (kbd "C-x C-<right>"))

(global-set-key (kbd "C-x C-p") 'beginning-of-buffer)
(global-unset-key (kbd "M-<"))
(global-set-key (kbd "C-x C-]") 'end-of-buffer)
(global-unset-key (kbd "M->"))

(global-set-key (kbd "C-x a") 'mark-whole-buffer)
(global-unset-key (kbd "C-x h"))
(global-set-key (kbd "C-x c") 'kill-buffer)
(global-unset-key (kbd "C-x k"))

(global-set-key (kbd "C-x '")
		'(lambda ()
		   (interactive)
		   (switch-to-buffer "*scratch*")))

;; window

(global-set-key (kbd "C-x -") 'delete-window)
;; (global-unset-key (kbd "C-x 0"))
(global-set-key (kbd "C-x =") 'delete-other-windows)
(global-unset-key (kbd "C-x 1"))
(global-set-key (kbd "C-x p") 'split-window-below)
(global-unset-key (kbd "C-x 2"))
(global-set-key (kbd "C-x ]") 'split-window-right)
(global-unset-key (kbd "C-x 3"))
(define-key key-translation-map (kbd "C-x [") (kbd "C-c <left>"))

(global-set-key (kbd "C-S-p") 'scroll-down-command)
(global-unset-key (kbd "M-v"))
(global-set-key (kbd "C-{") 'recenter-top-bottom)
(global-unset-key (kbd "C-l"))
(global-set-key (kbd "C-}") 'scroll-up-command)
;; (global-unset-key (kbd "C-v"))
(global-set-key (kbd "C-x C-=") 'scroll-other-window)
(global-unset-key (kbd "C-M-v"))
(global-set-key (kbd "C-x C--") 'scroll-other-window-down)
(global-unset-key (kbd "C-M-S-v"))

(global-set-key (kbd "C-M-i") 'enlarge-window)
(global-unset-key (kbd "C-x ^"))
(global-set-key (kbd "C-M-k") 'shrink-window)
;; (global-unset-key nil)
(global-set-key (kbd "C-M-j") 'shrink-window-horizontally)
(global-unset-key (kbd "C-x {"))
(global-set-key (kbd "C-M-l") 'enlarge-window-horizontally)
(global-unset-key (kbd "C-x }"))

;; C-x

(global-set-key (kbd "C-x g") 'magit-status)
;; (global-unset-key nil)
(global-set-key (kbd "C-x q") 'query-replace)
(global-unset-key (kbd "M-%"))
(global-set-key (kbd "C-x r") 'query-replace-regexp)
(global-unset-key (kbd "M-%"))

(global-set-key (kbd "C-x C-\\") 'auto-complete-mode)
;; (global-unset-key nil)

;; C-c

(define-key key-translation-map (kbd "C-c ;") (kbd "C-c }"))
(define-key key-translation-map (kbd "C-c C-s") (kbd "C-c ^"))
(define-key key-translation-map (kbd "C-c C-d") (kbd "C-c /"))

(define-key key-translation-map (kbd "C-c [") (kbd "C-c C-u"))
(define-key key-translation-map (kbd "C-c C-p") (kbd "C-c C-b"))
(define-key key-translation-map (kbd "C-c C-]") (kbd "C-c C-f"))

(define-key key-translation-map (kbd "C-c C-M-p") (kbd "C-c C-x C-i"))
(define-key key-translation-map (kbd "C-c M-ESC") (kbd "C-c C-x C-q"))
(define-key key-translation-map (kbd "C-c C-M-]") (kbd "C-c C-x C-o"))

(defun my-org-evaluate-time-range (&optional to-buffer)
  (interactive "P")
  (or
   (org-clock-update-time-maybe)
   (save-excursion
     (unless (org-at-timestamp-p t)
       (goto-char (point-at-bol))
       (re-search-forward org-tsr-regexp (point-at-eol) t))
     (if (not (org-at-timestamp-p t))
	 (user-error "")))
   (let* ((ts1 (match-string 0))
	  (havetime (> (length ts1) 15))
	  (match-end (match-end 0))
	  (time1 (org-time-string-to-time ts1))
	  (t1 (org-float-time time1))
	  (t2 (org-float-time (butlast (current-time) 2)))
	  (diff (abs (- t2 t1)))
	  (negative (< (- t2 t1) 0))
	  (ys (floor (* 365 24 60 60)))
	  (ds (* 24 60 60))
	  (hs (* 60 60))
	  (fy "%dy %dd %02d:%02d")
	  (fy1 "%dy %dd")
	  (fd "%dd %02d:%02d")
	  (fd1 "%dd")
	  (fh "%02d:%02d")
	  y d h m align)
     (if havetime
	 (setq
	  y (floor (/ diff ys))  diff (mod diff ys)
	  ;; y 0
	  d (floor (/ diff ds))  diff (mod diff ds)
	  h (floor (/ diff hs))  diff (mod diff hs)
	  m (floor (/ diff 60)))
       (setq
	y (floor (/ diff ys))  diff (mod diff ys)
	;; y 0
	d (floor (+ (/ diff ds) 0.5))
	h 0 m 0))
     (if (not to-buffer)
	 (message "%s" (org-make-tdiff-string y d h m))
       (if (org-at-table-p)
	   (progn
	     (goto-char match-end)
	     (setq align t)
	     (and (looking-at " *|") (goto-char (match-end 0))))
	 (goto-char match-end))
       (if (looking-at
	    "\\( *-? *[0-9]+y\\)?\\( *[0-9]+d\\)? *[0-9][0-9]:[0-9][0-9]")
	   (replace-match ""))
       (if negative (insert " -"))
       (if (> y 0) (insert " " (format (if havetime fy fy1) y d h m))
	 (if (> d 0) (insert " " (format (if havetime fd fd1) d h m))
	   (insert " " (format fh h m))))
       (if align (org-table-align))
       (message "Time difference inserted")))))
(global-set-key (kbd "C-c C--") 'my-org-evaluate-time-range)
(define-key key-translation-map (kbd "C-c C-=") (kbd "C-c ."))
(define-key key-translation-map (kbd "C-c C-M-=") (kbd "C-c C-s"))
(define-key key-translation-map (kbd "C-c C-M--") (kbd "C-c C-d"))

;; unset-key

(global-unset-key (kbd "C-0"))

(define-key key-translation-map (kbd "C-o") (kbd "C-0"))
(define-key key-translation-map (kbd "C-l") (kbd "C-0"))
(define-key key-translation-map (kbd "C-,") (kbd "C-0"))
(define-key key-translation-map (kbd "C-.") (kbd "C-0"))

(define-key key-translation-map (kbd "M-a") (kbd "C-0"))
(define-key key-translation-map (kbd "M-e") (kbd "C-0"))
(define-key key-translation-map (kbd "M-f") (kbd "C-0"))
(define-key key-translation-map (kbd "M-r") (kbd "C-0"))
(define-key key-translation-map (kbd "M-s") (kbd "C-0"))
(define-key key-translation-map (kbd "M-q") (kbd "C-0"))

(define-key key-translation-map (kbd "C-x C-b") (kbd "C-0"))
(define-key key-translation-map (kbd "C-x C-d") (kbd "C-0"))
(define-key key-translation-map (kbd "C-x DEL") (kbd "C-0"))
