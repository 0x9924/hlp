(setq ps-lpr-command
      (cond ((eq system-type 'windows-nt)
	     "c:/Program Files/gs/gs9.20/bin/gswin64.exe")
	    ((eq system-type 'cygwin)
	     "/cygdrive/c/Program Files/gs/gs9.20/bin/gswin64.exe")
            ((eq system-type 'gnu/linux)
             "/usr/bin/gtklp")))

      

(defun ps-imprimir-noninteractive (margins &optional paper font-size ncols header)
  (let  ((ps-printer-name t)
	 (ps-paper-type paper)
	 (ps-font-size font-size)
	 (ps-print-header header)
	 (ps-left-margin (nth 0 margins))
	 (ps-bottom-margin (nth 1 margins))
	 (ps-right-margin (nth 2 margins))
	 (ps-top-margin (nth 3 margins))
	 (ps-number-of-columns (or ncols 1))
	 (ps-landscape-mode (and ncols (> ncols 1 )))
	 (ps-inter-column 5)
         (ps-lpr-switches (if (eq paper 'a4)
                              '("-q" "-dNOPAUSE" "-dBATCH"
                                "-sDEVICE=mswinpr2"
                                "-sPAPERSIZE=a4")
                            '("-q" "-dNOPAUSE" "-dBATCH"
                              "-sDEVICE=mswinpr2"
                              "-sPAPERSIZE=legal"))))
         (ps-print-buffer)))
  
(defun imprimir-a4 () (interactive)
       (ps-imprimir-noninteractive '(60 35 20 70) 'a4 8.5))

(defun imprimir-a4-header () (interactive)
       (ps-imprimir-noninteractive '(60 35 20 70) 'a4 8.5 1 t))

(defun imprimir-a4-fontsize (fontsize)
  (interactive "s fontsize: ")
  (ps-imprimir-noninteractive
   '(60 35 20 70) 'a4 (string-to-number fontsize)))


(defun imprimir-a4-margenes (margenes)
  (interactive "sdefauls: 60 35 20 70. margenes: ")
       (ps-imprimir-noninteractive
        (mapcar 'string-to-number (split-string margenes))
        'a4 8.5))


(defun imprimir-sopas-a4 ()
  (interactive)
  (ps-imprimir-noninteractive '(45 5 15 20) 'a4 14))

(defun imprimir-oficio-margenes (margenes) (interactive "smargenes: ")
       (ps-imprimir-noninteractive
        (mapcar 'string-to-number (split-string margenes))
        'legal 8.5))

(defun imprimir-oficio () (interactive)
       (ps-imprimir-noninteractive
        '(40 35 45 20) 'legal 8.5))

(defun imprimir-columnas-dos-a4 () (interactive)
       (ps-imprimir-noninteractive '(15 15 15 15) 'a4 8 2))



(defun imprimir-rfc () (interactive)
       (ps-imprimir-noninteractive
	'(15 20 15 20) 'a4 8 2))
 
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



       
