(defun sacar-encabezado-rfc (autor)
  (interactive "sAutor: ")
  (save-excursion
    (replace-regexp (concat "^" autor " .*\n\nRFC.*")
                    "" nil (point-min) (point-max))))


(defun colapsar-newlines () (interactive)
       "Se reduce toda secuencia de espacios seguidos en el buffer a uno solo."
       (save-excursion
	 (goto-char (point-min))
	 (while (> (count-matches "\n\n\n" 0 (point-max)) 0)
	   (goto-char (point-min))
	   (while (search-forward  "\n\n\n" nil t)
	     (replace-match "\n" nil nil)))))
  
