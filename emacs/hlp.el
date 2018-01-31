(defun uri->nombre-uri (uri)
  (cons
   (replace-regexp-in-string "-h.org"
                             "" (replace-regexp-in-string ".*hlp/" "" uri))
   uri))

(defconst hlp-org-names
  (mapcar 'uri->nombre-uri
	  (split-string
	   (shell-command-to-string "find $HOME/hlp -name '*-h.org'")
	   "\n")))

(defun nombre->uri (nombre lista-nombre-uri)
  (cond
   ((null lista-nombre-uri) "nota")
   ((string= nombre (caar lista-nombre-uri))
    (cdar lista-nombre-uri))
   (t (nombre->uri nombre (cdr lista-nombre-uri)))))

	 
(defun hlp (nombre)
    (interactive
     (list
      (completing-read  "hlp: "
			(mapcar (lambda (x) (car x))
			hlp-org-names))))
    (find-file-read-only (nombre->uri nombre hlp-org-names)))
