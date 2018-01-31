(defun filtrar-palabras-cortas-lento (&optional nletras)
  (interactive "P")
  (let ((lines (line-number-at-pos (point-max)))
	(n (or nletras 5)))
    (save-excursion
    (while
	(progn
	  (if (< (- (line-end-position) (line-beginning-position)) n)
	      (kill-whole-line))
	  (next-line)
	  (< (line-number-at-pos) lines))))))

(defun filtrar-palabras-cortas-regexp (&optional nletras)
  (interactive)
  (let ((n (or nletras 5)))
    (flush-lines (concat "^.\\{0," (number-to-string n) "\\}$"))))
