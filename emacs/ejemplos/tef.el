;;; tef.el --- text editor functions

;; Copyright (C) 2014-2015 Nicolás San Martín

;; Author: Nicolás San Martín <smnicolas@gmail.com>
;; Version: 0.2
;; Created: 23 Dec 2014
;; Keywords: funciones útiles
;; URL: https://github.com/smnicolas/tef


;; This is not part of GNU Emacs

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This package is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;; ===================================================================
;;
;;; Comentary:

;; Este package provee de algunas funciones U`tiles para editar texto.
;; Son pequeñas funciones que me han resultado U`tiles y que junto en un
;; mismo archivo para usarlas comodamente.

;;; Installation:

;; M-x package-install-file RET tef.el
;; (add-to-list 'auto-mode-alist '("\\.tef\\'" . tef-mode))
;; (autoload 'tef-mode "tef" "Some documentation." t)

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; listas
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;(defun remove-nth (n list)
;;;  (declare
;;;    (type (integer 0) n)
;;;    (type list list))
;;;  (if (or (zerop n) (null list))
;;;    (cdr list)
;;;    (cons (car list) (remove-nth (1- n) (cdr list)))))


(defun rnd-asoc (argList)
  (let ((rndNum (random (length argList)))
	(retu nil))
    (if (= 1 (length argList))
	(car argList)
      (list (nth rndNum argList) (rnd-asoc (remove-nth rndNum argList))))))

(defun remove-nth (n list)
;  (declare
;    (type (integer 0) n)
;    (type list list))
  (if (or (zerop n) (null list))
    (cdr list)
    (cons (car list) (remove-nth (1- n) (cdr list)))))

;;;(defun rnd-perm (argList)
;;;  (if (null argList)
;;;      ()
;;;    (let ((rand-pos (random (length argList))))
;;;      (cons (nth rand-pos argList) (remove-nth rand-pos rnd-perm argList))))))

(defun flatten (orig-list)
"Combina todos los elementos de las sublistas del la list original
en una única lista de elementos atomicos. "
  (if (eql orig-list nil)
        nil
        (let ((elem (car orig-list)) (resto-list (cdr orig-list)))
            (if (listp elem)
                (append (flatten elem) (flatten resto-list))
                (append (cons elem nil) (flatten resto-list))))))


;;; mmm

(defun concat-with-strings-whithin-list (arg1 arg2)
  "Esta funcion todavia no esta terminada.
Los ARG1 y ARG2 son una lista y una string. El orden en 
que se den da el orden el concat."
  (let ((lista ()) (string ()) (nueva-lista ()))
    (if (and (listp arg1) (stringp arg2))
        (progn (setq lista arg1 string arg2)
	       (dolist (str lista)
		 (setq nueva-lista
		       (cons
			(concat str string) nueva-lista)))
	       nueva-lista))
    (if (and (listp arg2) (stringp arg1))
	(progn	(setq lista arg2 string arg1)
		(dolist (str lista)
		  (setq nueva-lista
			(cons
			 (concat string str) nueva-lista)))
		nueva-lista))
    (if (or (and (not (stringp arg1)) (not (stringp arg2)))
	    (and (not (listp arg1)) (not (listp arg2))))
	(error "Los args deben ser una lista y una string")
      nueva-lista)))


(defun nth-or-id (n arg)
  "Devuelve nth n si arg es lista, arg si es string"
(if (stringp arg) arg
  (if (listp arg)
      (nth n arg))))

;;;(defun concat-with-strings-whithin-list (arg1 arg2)
;;;  "Esta funcion todavia no esta terminada.
;;;arg1 es lista en esta versión"
;;;  (let ((nueva-lista ()) (largo 0))
;;;    (if (listp arg1) (setq largo (length arg1))
;;;      (if (listp arg2) (setq largo (length arg2))))
;;;    (dotimes (n largo)
;;;      (setq nueva-lista
;;;            (cons
;;;             (concat
;;;              (nth-or-id n arg1)
;;;              (nth-or-id n arg2)) nueva-lista)))
;;;    (setq nueva-lista (reverse nueva-lista))))


(defun cars (lista)
  (let ((retu ()))
    (dolist (sublista lista retu)
      (setq retu
	    (cons (car sublista) retu)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; reemplazos
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun remplazar-str-entre (strDe strA desde hasta)
  (if case-fold-search
      (setq case-fold-search nil))
  (let ((dife (- (length strDe) (length strA))))
    (goto-char desde)
    (while (search-forward strDe hasta t)
      (goto-char desde)
      (replace-match strA t t);;cambie FIXEDCASE
      (setq hasta (- hasta dife))))
  (unless case-fold-search
    (setq case-fold-search t)))

(defun remplazar-regexp-entre (regexp to-str desde hasta)
    (if case-fold-search
	(setq case-fold-search nil))
    (goto-char desde)
    (while (re-search-forward regexp hasta t)
      (let* ((current-match (match-string 0))
	     (len-match (length current-match))
	     (len-str-to (length (replace-regexp-in-string
				  regexp to-str current-match))))
	(replace-match to-str nil nil)
	(setq hasta (- hasta (- len-match len-str-to)))))
    (unless case-fold-search
      (setq case-fold-search t)))

(defun reemplazos-string (desde hasta)
  "Esta funcion realiza una serie de reemplazos identificada por listas.
Es decir, reemplaza cada elemento n de una lista por el elemento n de la
otra. Desde point en adelante."
(let ((punto (point)))
  (if (= (length desde) (length hasta))
      (dotimes (n (length desde))
	(remplazar-str-entre (nth n desde) (nth n hasta) punto (point-max))))
  (goto-char punto)))


(defun reemplazos-regexp (desde hasta)
    "Esta funcion realiza una serie de reemplazos identificada por listas.
Es decir, reemplaza cada elemento n de una lista por el elemento n de la
otra. Desde point en adelante."
    (let ((punto (point)))
      (if (= (length desde) (length hasta))
	  (dotimes (n (length desde))
	    (remplazar-regexp-entre (nth n desde) (nth n hasta)
				    punto (point-max))))
      (goto-char punto)))

(defun html-tildes (&optional arg)
  "Reemplaza los acentos de un texto plano para poder hacer un html.
Requiere de la funcion 'reemplazos'"
  (interactive "P")
  (let ((vocales-con-tilde
	  '("Á" "É" "Í" "Ó" "Ú" "á" "é" "í" "ó" "ú"))
	(vocales-sin-tilde
	 '("A" "E" "I" "O" "U" "a" "e" "i" "o" "u")))
    (if arg (reemplazos-string
	     (concat-with-strings-whithin-list
	      (concat-with-strings-whithin-list
	       "&" vocales-sin-tilde)
	      "acute;")
	     vocales-con-tilde)
      (reemplazos-string
       vocales-con-tilde
       (concat-with-strings-whithin-list
	(concat-with-strings-whithin-list
	 "&" vocales-sin-tilde)
	"acute;")))))

(defun html-enies (&optional arg)
  "Reemplaza las ñ y Ñ para html"
  (interactive "P")
  (let ((n-con-tilde '("Ñ" "ñ"))
	(n-sin-tilde '("N" "n")))
    (if arg (reemplazos-string
	     (concat-with-strings-whithin-list
	      (concat-with-strings-whithin-list
	       "&" n-sin-tilde)
	      "tilde;")
	     n-con-tilde)
      (reemplazos-string
       n-con-tilde
       (concat-with-strings-whithin-list
	"&"
	(concat-with-strings-whithin-list
	 n-sin-tilde "tilde;"))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; edicion de texto
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun flush-right-1st-match-with (arg)
  "Borra la parte derecha de todas las líneas del búffer debajo del
point desde primera ocurrencia en cada una de ARG, sin incluir ARG."
  (interactive "sIngrese string: ")
  (while (re-search-forward (concat arg ".*$") nil t)
    (replace-match arg nil nil)))


(defun flush-right-1st-match-without (arg)
  "Borra la parte derecha de todas las líneas del búffer debajo del
point desde la primera ocurrencia en cada una de ARG, incluyendo ARG."
  (interactive "sIngrese string: ")
  (while (re-search-forward (concat arg ".*$") nil t)
    (replace-match "" nil nil)))

(defun flush-right-last-match-with (arg)
  "Borra la parte derecha de todas las líneas del búffer debajo del
point desde última ocurrencia en cada una de ARG, incluyendo ARG."
  (interactive "sIngrese string: ")
  (while (re-search-forward (concat arg ".*?$") nil t)
    (replace-match arg nil nil)))

(defun flush-right-last-match-without (arg)
  "Borra la parte derecha de todas las líneas del búffer debajo del
point desde última ocurrencia en cada una de ARG, sin incluir ARG."
  (interactive "sIngrese string: ")
    (while (re-search-forward (concat arg ".*?$") nil t)
    (replace-match "" nil nil)))

(defun flush-left-1st-match-with (arg)
    "Borra la parte izquierda de todas las líneas del búffer debajo del
point hasta la última ocurrencia en cada una de ARG, sin incluir ARG."
    (interactive "sIngrese string: ")
    (while (re-search-forward (concat arg "^.*?") nil t)
      (replace-match arg nil nil)))

(defun flush-left-first-match-without (arg)
  "Borra la parte izquierda de todas las líneas del búffer debajo del
point hasta la última ocurrencia en cada una de ARG, incluyendo ARG."
  (interactive "sIngrese string: ")
  (while (re-search-forward (concat arg "^.*?") nil t)
	(replace-match "" nil nil)))

(defun delete-left-last-match-without (arg)
  "Borra la parte izquierda de todas las líneas del búffer debajo del
point hasta la primera ocurrencia en cada una de ARG, incluyendo ARG."
  (interactive "sIngrese string: ")
  (while (re-search-forward (concat arg "^.*") nil t)
    (replace-match "" nil nil)))

(defun taguear (tag-ini tag-fin &optional string)
  (if mark-active
    (taguear-c-reg tag-ini tag-fin)
    (progn
      (unless (stringp string) (setq string ""))
      (insert tag-ini string tag-fin)
      (if (string= string "")
	  (backward-char (length tag-fin))))))



(defun taguear-c-reg (tag-ini tag-fin)
  "Si hay región, inserta antes y despues tag-ini y tag-fin.
Si no, no hace nada."
  (interactive)
  (if mark-active
      (let ((desde (region-beginning)) (hasta (+ (length tag-ini) (region-end))))
	(goto-char desde)
	(insert tag-ini)
	(goto-char hasta)
	(insert tag-fin))
    (progn
      (insert tag-ini tag-fin)
      (backward-char (length tag-fin)))))

(defun colapsar-espacios-no-region ()
       "Se reduce toda secuencia de espacios seguidos en el buffer a uno solo."
       (goto-char (point-min))
       (while (> (count-matches "  " 0 (point-max)) 0)
	 (goto-char (point-min))
	 (while (search-forward  "  " nil t)
	   (replace-match "" nil nil))))

;;;(defun colapsar-espacios-entre (desde hasta)
;;;     "Se reduce toda secuencia de espacios seguidos entre los puntos
;;;indicados a uno solo."
;;;     (let ((counter 0))
;;;       (goto-char desde)
;;;       (while (and (> (count-matches "  " desde hasta) 0)
;;;		   (< counter 99))
;;;	 (goto-char desde)
;;;	 (while (and (search-forward  "  " hasta t)
;;;		     (< counter 99))
;;;	   (replace-match "" nil nil)
;;;	   (setq hasta (- hasta 2))
;;;	   (setq counter (1+ counter)))
;;;	 (setq counter (1+ counter)))
;;;       (message "%d" counter)))


(defun colapsar-espacios-entre (desde hasta)
  "Se reduce toda secuencia de espacios seguidos entre los puntos
indicados a uno solo."
  (let ((counter 0) (max-counter 999))
    (goto-char desde)
    (while (and (search-forward  "  " hasta t)
		(< counter max-counter))
      (replace-match "" nil nil)
      (setq hasta (- hasta 2))
      (setq counter (1+ counter)))
    (message "%d" counter)))

  
(defun colapsar-espacios-region ()
  "Se reduce toda secuencia de espacios seguidos en la región a uno solo."
       (let ((desde (region-beginning)) (hasta (region-end)) (matches 0))
	 (while (< 0  (setq matches (count-matches "  " desde hasta)))
	   (goto-char desde)
	   (while (re-search-forward "  " hasta t)
	     (replace-match " " nil t)
	     (setq hasta (1- hasta))))))

(defun colapsar-espacios () (interactive)
       "Invoca colapsar-espacios-no-region o colapsar-espacion-region
según haya o no región."
       (if mark-active
	   (colapsar-espacios-region)
	 (colapsar-espacios-no-region)))

(defun marcar-region () (interactive)
  (let ((desde (region-beginning)) (hasta (region-end)))
    (goto-char desde)
    (insert "<|")
    (goto-char (+ 2 hasta))
    (insert "|>")))

(defun insert-left (string)
  "Agrega al principio de cada línea ocupada por la region la string STRING.
Si STRING es una string vacía, entonces agrega al principio y al final
de la región /* y */ respectivamente.
Si no hay región no hace nada."
  (interactive "s\ Insertar string: ")
  (if mark-active
      (let ((desde (region-beginning))
	    (hasta-linea (line-number-at-pos (region-end))))
	(if (not (string= string ""))
            (progn
	      (unless (save-excursion (goto-char (region-end))
				      (eq 0 (current-column)))
		(setq hasta-linea (1+ hasta-linea)))
              (goto-char desde)
              (while (< (line-number-at-pos)  hasta-linea)
                (beginning-of-line)
                (insert string)
                (end-of-line) (forward-char))
	      (goto-char desde))
	  (progn
	    (if (save-excursion (goto-char (region-end))
				(eq 0 (current-column)))
		(backward-char))
	    (ccmt)))))
  (message "No hay región."))


(defun ccmt ()
  "Insert '/*' and '*/' at the end and the beginning of region."
  (interactive)
  (taguear "/*" "*/"))

(defun uncomment-c () (interactive)
       (let ((desde (region-beginning)) (hasta (region-end)))
	 (goto-char desde)
	 (if (search-forward "/*" hasta t)
	     (if (search-forward "*/" hasta t)
		 (progn
		   (remplazar-str-entre "/*" "" desde hasta)
		   (remplazar-str-entre "*/" "" desde hasta))
	       (message "El comentario no 'cierra' en la región!"))
	   (message "No hay comentario en la región!"))))

(defun insert-right (string)
    "Agrega al final de cada línea ocupada por la region la string STRING.
Si STRING es una string vacía, entonces agrega al principio y al final
de la región /* y */ respectivamente.
Si no hay región no hace nada."
    (interactive "s\ Insertar string: ")
    (if mark-active
	(let ((desde (region-beginning))
	      (hasta-linea (line-number-at-pos (region-end))))
	  (if (not (string= string ""))
	      (progn
		(goto-char desde)
		(while (< (line-number-at-pos)  hasta-linea)
		  (end-of-line)
		  (insert string)
		  (forward-char)))
	    (message "No hay región.")))))

(defun remove-left (arg)  (interactive "n\ escribir numero de caracteres a borrar: ")
"Sacar ARG caracteres desde el pricnipio de cada línea en la región.
Si la línea tiene menos de ese número de carateres queda vacía pero no se borra."
       (if mark-active
	   (let ((hasta (1- (region-end)))
		 (desde (region-beginning)))
	     (goto-char (region-beginning))
	     (deactivate-mark)
	     (while (< (point) hasta)
	       (beginning-of-line)
	       (dotimes (veces arg) (if (not (eolp)) (delete-char 1)))
	       (forward-line)
	       (setq hasta (- hasta arg)))
	     (goto-char desde))))


(defun enumerar-lineas (arg)
  "Agrega al principio de cada línea su numero de orden."
  (interactive "n\ Comenzar con: ")
  (if arg
      (let ((count 1))
	(if mark-active
	    (let ((hasta (region-end)))
	      (while (> (point) (region-beginning)) (backward-char))
	      (insert (number-to-string arg))
	      (forward-line)
	    (beginning-of-line)
	    (while (< (point) (1+ hasta))
	      (setq hasta (1+ hasta))
	      (insert (number-to-string (+ count  arg)))
	      (setq count (1+ count))
	      (forward-line)
	      (beginning-of-line)))))))


(defun insert-left-if-num (arg)
  "Antepone a las lineas que empiezan con números en la region la string ARG.
Si no har región, lo hace desde el punto hasta el final del buffer."
  (interactive "s\ anteponer: ")
  (if mark-active
      (remplazar-regexp-entre "\\(^[0-9]\\)"
			      (concat arg "\\1")
			      (region-beginning)
			      (region-end)))
  (remplazar-regexp-entre "\\(^[0-9]\\)"
			  (concat arg "\\1")
			  (point)
			  (point-max)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; HTML

(defun html-element (arg)
  "Taguea con el elemento indicado, para HTML."
  (interactive "s\ Escribir nombre: ")
  (let ((tag-ini
	 (concat "<" arg ">"))
	(tag-fin
	 (concat "</" arg ">")))
    (taguear tag-ini tag-fin)))

(defun insert-newLine (times) (interactive "p")
  (dotimes (n times) (insert "<br />"))
  (insert "\n"))

(defun html-comment () (interactive)
       (taguear "<!--" "-->"))


(defun sacar-hipervinculos () (interactive)
       (remplazar-regexp-entre "<a[^>]*?>" "" 0 (point-max))
       (remplazar-str-entre "</a>" ""  0 (point-max)))

(defun indent-html-par ()
  (interactive)
  (let* ((inicio (search-backward "<p>"))
	 (fin (search-forward "</p>"))
	 (newlines (count-matches "\n" inicio fin)))
    (if (not (and inicio fin))
	(message "No hay inicio o fin.")
      (progn
	(remplazar-regexp-entre "\n" " " inicio fin)
	(colapsar-espacios-entre inicio fin)
	(goto-char (+ inicio 3))
	(insert "\n")
	;;	  (setq fin (search-forward "</p>" fin))
	(search-forward "</p>" fin)
	(backward-char 4)
	(newline)
	(indent-region inicio fin)
	(goto-char inicio)
	(search-forward "</p>")
	(forward-line -1)
	(end-of-line)
	(delete-char -1)))))

(defun txt-para-imprimir () (interactive)
       (remplazar-regexp-entre "^\\(.+?\\)$"
			       "<p>\n\\1\n</p>\n"
			       (point-min) (point-max))
       (goto-char (point-min))
       (insert "<html>\n<head>\n<title></title>\n</head>\n<body>\n")
       (goto-char (point-max))
       (insert "\n</body>\n</html>")
       (indent-region (point-min) (point-max)))



       
;;;; html ==>>>

;;; funciones útiles para escribir LATEX

(defun latex-element (arg)
  "Taguea con el nombre indicado, para TEX.
Es decir:
\\begin{ARG}
/* ... */
\\end{ARG}"
  (interactive "s\ Escribir nombre: ")
  (let ((tag-ini
	 (concat "\\begin{" arg "}\n\n"))
	(tag-fin
	 (concat "\n\\end{" arg "}\n")))
    (save-excursion  (taguear tag-ini tag-fin))
    (if mark-active
	(goto-char (region-beginning)))
    	(forward-line)	))

(defun latex-tag (arg)
  "Taguea \\tag{arg}"
  (interactive "sEscribir nombre: ")
  (taguear (concat "\\" arg "{") "}")
  (backward-char))


(defun latex-math-inline (formula)
  "Falta doc."
  (interactive "sIngrese fórmula: ")
  (if (string="" formula)
      (taguear "\\( " " \\) ")
    (insert "\\( " formula " \\) ")))


(defun latex-math-display (formula)
  "Falta doc."
  (interactive "sIngrese fórmula: ")
  (if (string="" formula)
      (taguear "\n\\[ " " \\]\n")
    (insert "\n\\[ " formula " \\]\n")))

(defun latex-limite-math (variable tiende-a limite)
  (interactive "s\ Variable: \nsTiende a:  \nsLímite: " )
  (if (string= variable "") (setq variable "x"))
  (if (string= tiende-a "") (setq tiende-a "c"))
  (if (string= limite "") (setq limite "l"))
  (if (string-match "_" variable)
      (insert (message "\\lim_{%s \\to %s} f( %s )= %s"
		       (substring variable (1+ (string-match "_" variable))
				  (length variable))
		        tiende-a variable limite))
    (insert (message "\\lim_{%s \\to %s} f( %s )= %s"
		     variable tiende-a variable limite))))

(defun latex-limite-log (variable tiende-a limite)
  (interactive "s\ Variable: \nsTiende a:  \nsLímite: " )
  (if (string= variable "") (setq variable "x"))
  (if (string= tiende-a "") (setq tiende-a "c"))
  (if (string= limite "") (setq limite "l"))
  (if (string= tiende-a "\\infty")
      (if (string-match "_" variable)
	  (insert
	   (message
	    "\\forall \\epsilon > 0 \\ \\exists N \\ \\forall %s \\quad  (%s > N) \\quad \\to \\quad (|%s - %s| < \\epsilon)"
	    (substring variable (1+ (string-match "_" variable))
		       (length variable))
	    (substring variable (1+ (string-match "_" variable))
		       (length variable))
	    variable limite))
	(insert
	 (message
	  "\\forall \\epsilon > 0 \\ \\exists N \\ \\forall %s \\quad  (%s > N) \\quad \\to \\quad (|f(%s) - %s| < \\epsilon)"
	  variable variable variable limite)))
    (insert
     (message
      "\\forall \\epsilon > 0 \\ \\exists \\delta > 0 \\ \\forall x \\quad  (0<|%s-%s|< \\delta) \\quad \\to \\quad (|f(%s) - %s| < \\epsilon)"
      variable tiende-a variable limite))))


(defun latex-fraccion-s-region-old (numerador denominador)
  (interactive "sNumerador: \nsDenoninador: ")
  (taguear
   (concat "\\frac{" numerador "}{")
   (concat denominador "}")))

(defun latex-fraccion-s-region (frac)
;  (interactive "sFracción: ")
  (if (string-match "/" frac)
      (let ((denominador
	     (substring frac (1+ (string-match "/" frac)) (length frac)))
	    (numerador
	     (substring frac 0  (string-match "/" frac))))
	(taguear
	 (concat "\\frac{" numerador "}{")
	 (concat denominador "}")))
    (message "Numerador y denominador deben estar separados por una \"/\".")))


(defun latex-fraccion-c-region (); (interactive)
(let ((contador 0) (hasta (region-end)))
  (if mark-active
      (if (< 0 (count-matches "/" (region-beginning) (region-end)))
	  (progn
	    (goto-char (region-beginning))
	    (insert "\\frac{")
	    (while (and (< contador 99) (not (char-equal 47 (char-after))))
	      (forward-char)
	      (setq contador (1+ contador)))
	    (delete-char 1)
	    (insert "}{")
	    (setq hasta (+ hasta
			   (length "_frac{}")))
	    (goto-char hasta) ;(max hasta (region-end)))
	    (insert "}"))
        (message "La fraccón debe tener una ocurrencia de \"/\""))
        (message "No hay región, intente de nuevo..."))))




(defun latex-fraccion () (interactive)
(if mark-active
    (latex-fraccion-c-region)
  (latex-fraccion-s-region   (read-from-minibuffer "Ingrese fracción: ") )))

;;; latex ==>>>

;;; C

(defun insert-printf ()
  (interactive)
  (taguear "printf(\""  "\");"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; <<<  Plain text

(defun insert-bold () (interactive)
  (taguear "`b" "`B"))

(defun insert-plain-format (formato)
  (interactive "s\ Escribir formato: ")
  (let ((tag-ini (concat "`" formato))
	(tag-fin (concat "`" (capitalize formato))))
    (taguear tag-ini tag-fin)))



(defun limitar-lineas (numero)
  (interactive "nIngrese número: ")
  (while
      (>= (count-lines 1 (point-max)) (string-to-number (substring (what-line) 5  (length (what-line)))))
    (if (<= numero (move-to-column numero))
	(kill-line))
    (forward-line)))

(defun get-number-of-lines ()
  (interactive)
  (message"%d" (count-lines 1 (point-max))))

(defun pln-highligthings () (interactive)
       ;;(setq pln-highligth-active t)
       (highlight-regexp "`b.*?`B" 'bold)
       (highlight-regexp "`i.*?`I" 'bold-italic)
       (highlight-regexp "`[a-zA-Z]" 'shadow))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; files and buffer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun get-file-name-without-path ()
  "Muesra en echo area el nombre del buffer y lo guarda en
el kill-ring."
  (interactive)
       (kill-new (buffer-name))
       (message (buffer-name)))

(defun get-file-name ()
  "Muesra en echo area el nombre del buffer y lo guarda en
el kill-ring."
  (interactive)
  (kill-new (buffer-file-name))
  (message (buffer-file-name)))



(defun current-line ()
  (let (p1 p2 myLine)
    (setq p1 (line-beginning-position)
	  p2 (line-end-position)
	  myLine (buffer-substring-no-properties p1 p2))))

(defun buffer-to-list () (interactive)
  (let ((retu nil) (volver (point)))
    (goto-char 0)
    (while (<= (line-number-at-pos) (count-lines 1 (point-max)))
      (setq retu (cons (current-line) retu))
      (forward-line))
    (goto-char volver)
    retu))
;; (insert (format "%s" (reverse (buffer-to-list))))
(defun abrirArchivos (listaDeArchivos)
  (let ((bufferInicial (current-buffer)))
    (dolist (archivo listaDeArchivos)
      (find-file archivo))
    (switch-to-buffer bufferInicial)))

(defun abrirArchivosEnBuffer (arg)
"Abre los archivos que figuran listados, uno por línea, en el presente buffer."
  (interactive "sabrir archivos en buffer? yes or no ")
  (if (string= arg "yes") (abrirArchivos (buffer-to-list))))

(defun guardar-backup ()
  "Guarda el buffer abierto y también una copia de él con su
 nombre agregandole \".bkp\" en la misma carpeta."
  (interactive)
    (save-buffer)
  (let ((punto (point)) (buffer-actual (buffer-name)))
    (write-file (concat  buffer-actual ".bkp") t)
    (find-file buffer-actual)
    (goto-char punto)
    (if (string=
         (message "%s" major-mode)
         "org-mode")
        (org-reveal))
    (kill-buffer (concat  buffer-actual ".bkp"))))

;;; nuevo



(defun filtrar-strings (lista-de-strings regexp)
  "Filtra de la lista-de-strings las strings que no coincidan con regexp."
(let ((ret-list ()))
  (dolist (m lista-de-strings ret-list)
    (unless (string-match regexp m)
      (setq ret-list (cons m ret-list))))))


(defun archivos-matching (match-string)
  (filtrar-strings (directory-files "." t match-string) "#\\|~"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;  etc

(defun ordenar-numeros (arg)
  "Devuelve una lista de numeros del 0 a arg, ordenadas de manera que si
se agrupan primero los números impares y luego los pares, el orden que
se obtiene de la función es el que habría que disponerlos  para obtener
el odenamiento original (es decir, ya no primero los impares, luego los
pares).
Esto es útil para imprimir cuando tengo en un pdf primero las paginas
impares y después las pares.

To do: Habria que modificar el comportamiento cuando ARG es un numero impar."
  (interactive "nCantidad de numeros (solo pares) (pags.): ")
  (let ((retu ()))
    (setq retu (reverse
		(dolist (n (number-sequence 1 (/ arg 2)) retu)
		  (setq retu
			(cons (+ n (/ arg 2)) (cons n retu)))))
    ;;	(require 'cl)
    ;;    (setq retu (loop for n from 1 to (/ arg 2)
    ;;		     collect (list n (+ n (/ arg 2))))
	  retu (format "%s" retu)
	  retu (replace-regexp-in-string "(" "" retu)
	  retu (replace-regexp-in-string ")" "" retu)
	  retu (replace-regexp-in-string " " "," retu))
    (insert retu )))


(defun contar-paginas ()
  "Esta función sirve para contar el número de páginas que
uno quiere imprimir, indicando las mismas como por ejemplo:
1-9, 11-25, 44-56"
  (interactive)
  (let ((str ()))
    (if mark-active
	(setq str
	      (buffer-substring
	       (region-beginning)
	       (region-end)))
      (setq str (read-string "Paginas: ")))
    (message
     "%d"
     (let ((ret ())
	   (ret2 0))
       (dolist (e2 
		(dolist
		    (e (split-string str  ",") ret)
		  (setq ret (cons (split-string e "-" t " ") ret)))
		ret2)
	 (setq ret2 (+ (1+ (- (string-to-number (cadr e2))
			      (string-to-number (car e2))))
		       ret2)))))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; PARA CSV
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun get-col-point (coln col-delim)
  (if (= coln 0)
      (save-excursion
	(beginning-of-line)
	(point))
    (let ((bound-point nil)
	  (call-point (point)))
      (save-excursion
	(setq bound-point (re-search-forward "$" nil t))
	(beginning-of-line)
;;;	(or
	 (search-forward col-delim bound-point t coln) ))))
;;;	 nil)))))

(defun replace-str-in-col-in-line (coln col-delim from-str to-str)
  (save-excursion
    (let ((col-ini (get-col-point coln col-delim))
	  (col-fin (get-col-point (1+ coln) col-delim))
	  (e-o-l (re-search-forward "$" nil t)))
      (unless col-fin
	(setq col-fin e-o-l))
      (and col-ini
	   (progn
	     (goto-char col-ini)
	     (while (search-forward from-str col-fin t)
	       (replace-match to-str nil t)))))))

(defun replace-str-in-cols (coln col-delim from-str to-str)
  (goto-char (point-min))
  (let ((counter 0)
	(last-line (count-lines (point-min) (point-max))))
    (while (< counter last-line)
      (replace-str-in-col-in-line coln col-delim from-str to-str)
      (forward-line)
      (setq counter (1+ counter)))))

(defun replace-csv-str (coln col-delim from-str to-str)
  (interactive "ncol number:\nscolumn delimiter:\nsReplace string:\nsReplace string with:" )
  (replace-str-in-cols coln col-delim from-str to-str))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; NUEVAS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun guardar-html ()
  "Guarda el buffer abierto y también una copia de él, pero habiendo
modificado sus tildes para ver en un buscador de internet. La copia
se llama igual, pero con \"-cp.html\" agregado al final."
  (interactive)
  (save-buffer)
  (let ((punto (point))
	(buffer-actual (buffer-name))
	(file-path (buffer-file-name)))
    (goto-char (point-min))
    (html-tildes)
    (goto-char (point-min))
    (html-enies)
;;;
    (write-file (concat  buffer-actual "-cp.html") t)
    (find-file buffer-actual)
    (kill-buffer (concat buffer-actual "-cp.html"))
    (goto-char punto)
;;;    (kill-buffer (concat  buffer-actual "-cp.html"))
    (kill-new (concat  file-path "-cp.html"))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; functions to insert files in buffer
(defun insert-files-in-dir (pattern &optional dir cmt)
  "Insert every file matching pattern from current dir
 in current buffer."
  (interactive "sinsert files: ")
  (if (null dir) (setq dir (file-name-directory buffer-file-name)))
  (if (null cmt) (setq cmt (read-string "Cmt str: ")))
  (let ((files (directory-files dir nil pattern))
	(cmt-str (concat cmt " " "file: ")))
    (dolist (f files)
      (goto-char (point-max))
      (insert (concat "\n" cmt-str f "\n"))
      (insert-file-contents f))
    (goto-char (point-max))))


    
(defun get-subdirs (&optional dir)
  "Return list of string with subdirectories names"
  (if (null dir) (setq dir (file-name-directory buffer-file-name)))
  (remove-if-not #'file-directory-p
		 (remove-if
		  #'(lambda (s) (or (string-match "/\\.\\.$" s)
				    (string-match "/\\.$" s)))
		  (directory-files dir t))))

(defun get-subdirs-recu (&optional dirs)
  (if (null dirs) (setq dirs (file-name-directory buffer-file-name)))
  (cond ((null dirs))
	((stringp  dirs)
	 (cons dirs (get-subdirs dirs)))
	((listp dirs)
	 (append (cons (car dirs) (get-sub-dirs-recu (car-dirs)))
		 (get-subdirs-recu (cdr dirs))))))


(defun insert-files-in-dir-recu (pattern cmt)
  "Insert every file matching pattern from current dir
 in current buffer."
  (interactive "sinsert files: ")
  (if (null cmt) (setq cmt (read-string "Cmt str: ")))
  (mapcar
   #'(lambda (dir) (insert-files-in-dir
		    pattern
		    dir;;(file-name-directory buffer-file-name)
		    cmt))
   (get-subdirs-recu (file-name-directory buffer-file-name))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; key bindings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

					; GRAL.
(global-set-key (kbd "\C-c r s") 'replace-string)
(global-set-key (kbd "\C-c r r") 'replace-regexp)
(global-set-key (kbd "\C-c i l") 'insert-left)
(global-set-key (kbd "\C-c i r") 'insert-right)
(global-set-key (kbd "\C-c r l") 'remove-left)
(global-set-key (kbd "\C-c e") 'enumerar-lineas)
(global-set-key (kbd "\C-c c e") 'colapsar-espacios)
					; HTML
(global-set-key (kbd "\C-c h e") 'html-element)
(global-set-key (kbd "\C-c c h") 'html-comment)
(global-set-key (kbd "\C-c c c") 'ccmt)
(global-set-key (kbd "\C-c u c") 'uncomment-c)
					; LATEX
(global-set-key (kbd "\C-c l e") 'latex-element)
(global-set-key (kbd "\C-c l t") 'latex-tag)
(global-set-key (kbd "\C-c l m i") 'latex-math-inline)
(global-set-key (kbd "\C-c l m d") 'latex-math-display)
(global-set-key (kbd "\C-c l l m") 'latex-limite-math)
(global-set-key (kbd "\C-c l l l") 'latex-limite-log)
(global-set-key (kbd "\C-c l /") 'latex-fraccion)
					; plain text
(global-set-key (kbd "\C-c p b") 'insert-bold)


;;; De files-and-buffers.el
(global-set-key (kbd "\C-c f n") 'get-file-name)
(global-set-key (kbd "\C-x w") 'guardar-backup)
(global-set-key (kbd "\C-c w h") 'guardar-html)

;;;;;;;;
;; (defvar tef-mode-map
;;   (let ((map (make-sparse-keymap)))
;;     (define-key map [(control ?c) (control ?v)] 'csv-toggle-invisibility)
;;     (define-key map [(control ?c) (control ?t)] 'csv-transpose)
;;     (define-key map [(control ?c) (control ?c)] 'csv-set-comment-start)
;;     (define-key map [(control ?c) (control ?u)] 'csv-unalign-fields)
;;     (define-key map [(control ?c) (control ?a)] 'csv-align-fields)
;;     (define-key map [(control ?c) (control ?z)] 'csv-yank-as-new-table)
;;     (define-key map [(control ?c) (control ?y)] 'csv-yank-fields)
;;     (define-key map [(control ?c) (control ?k)] 'csv-kill-fields)
;;     (define-key map [(control ?c) (control ?d)] 'csv-toggle-descending)
;;     (define-key map [(control ?c) (control ?r)] 'csv-reverse-region)
;;     (define-key map [(control ?c) (control ?n)] 'csv-sort-numeric-fields)
;;     (define-key map [(control ?c) (control ?s)] 'csv-sort-fields)
;;     map))


;;;###autoload
(define-minor-mode tef-mode "emacs text editor functions
					; GRAL.
(global-set-key (kbd \"\C-c r s\") 'replace-string)
(global-set-key (kbd \"\C-c r r\") 'replace-regexp)
(global-set-key (kbd \"\C-c i l\") 'insert-left)
(global-set-key (kbd \"\C-c i r\") 'insert-right)
(global-set-key (kbd \"\C-c r l\") 'remove-left)
(global-set-key (kbd \"\C-c e\") 'enumerar-lineas)
(global-set-key (kbd \"\C-c c e\") 'colapsar-espacios)
					; HTML
(global-set-key (kbd \"\C-c h e\") 'html-element)
(global-set-key (kbd \"\C-c c h\") 'html-comment)
(global-set-key (kbd \"\C-c c c\") 'ccmt)
(global-set-key (kbd \"\C-c u c\") 'uncomment-c)
					; LATEX
(global-set-key (kbd \"\C-c l e\") 'latex-element)
(global-set-key (kbd \"\C-c l t\") 'latex-tag)
(global-set-key (kbd \"\C-c l m i\") 'latex-math-inline)
(global-set-key (kbd \"\C-c l m d\") 'latex-math-display)
(global-set-key (kbd \"\C-c l l m\") 'latex-limite-math)
(global-set-key (kbd \"\C-c l l l\") 'latex-limite-log)
(global-set-key (kbd \"\C-c l /\") 'latex-fraccion)
					; plain text
(global-set-key (kbd \"\C-c p b\") 'insert-bold)

;;; De files-and-buffers.el
(global-set-key (kbd \"\C-c f n\") 'get-file-name)
(global-set-key (kbd \"\C-x w\") 'guardar-backup)

")

;;; tef.el ends here
