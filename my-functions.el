;; Duplicate line
(defun duplicate-line (arg)
  "Duplicate current line, leaving point in lower line."
  (interactive "*p")

  ;; save the point for undo
  (setq buffer-undo-list (cons (point) buffer-undo-list))

  ;; local variables for start and end of line
  (let ((bol (save-excursion (beginning-of-line) (point)))
	eol)
    (save-excursion

      ;; don't use forward-line for this, because you would have
      ;; to check whether you are at the end of the buffer
      (end-of-line)
      (setq eol (point))

      ;; store the line and disable the recording of undo information
      (let ((line (buffer-substring bol eol))
	    (buffer-undo-list t)
	    (count arg))
	;; insert the line arg times
	(while (> count 0)
	  (newline)         ;; because there is no newline in 'line'
	  (insert line)
	  (setq count (1- count)))
	)

      ;; create the undo information
      (setq buffer-undo-list (cons (cons eol (point))
				   buffer-undo-list)))
    ) ; end-of-let

  ;; put the point in the lowest line and return
  (next-line arg))

;; Comment or uncomment current line
(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
	(setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position))
      (next-line))
    (comment-or-uncomment-region beg end)))

;; Set env variables from buffer
(defun env-from-buffer ()
  "Set env variables from buffer"
  (interactive)
  (dolist (line (split-string (buffer-string) "\n" t))
    (let* ((kv (split-string line "=" t))
          (key (nth 0 kv))
          (value (nth 1 kv)))
      (message "key %s value %s" key value)
      (setenv key value)
      )
    )
  )

