;; Funciones para bajar una página como html y editarla para luego obtener
;; un archivo latex que se pueda imprimir como pdf.
;; tags a sacar preservando su contenido>

  (defun sacar-tags-a () (interactive)
    (reemplazos-regexp
     '("<a\\([^<]\\|\n\\)*?>" "</a>")
     '("" ""))
    (reemplazos-regexp
     '("<var\\([^<]\\|\n\\)*?>" "</var>")
     '("" ""))
    (reemplazos-regexp
     '("<dfn\\([^<]\\|\n\\)*?>" "</dfn>")
     '("" ""))
    (replace-regexp ;; chequear despues no indent!!! en <p no indent...
     "<p.*?>"
     ""
     nil 0 (point-max) ))



(defun sacar-divs () (interactive)
       (replace-regexp "<div\\(.\\|\n\\)*?</div>" "" nil 0 (point-max)))

(defun html-to-latex-tabla () (interactive)
       (replace-regexp
	"<table\\([^<]\\|\n\\)*?>"
	"\\\\begin{tabular}{NUMERO-DE-COLUMNAS}"
	nil 0 (point-max))
       (replace-string
	"</table>"
	"\\end{tabular}"
	nil 0 (point-max))
       (replace-regexp
	"<tr>[^<]*?<td\\(.\\|\n\\)*?>"
	"" nil 0 (point-max))
       (replace-regexp
	"</td>[^<]*?</tr>"
	"\\\\\\\\"
	nil 0 (point-max))
       (replace-regexp
	"</td>[^<]*?<td>"
	" & "
	 nil 0 (point-max)))

(defun i-y-b-tags () (interactive)
    (replace-regexp
     "<b \\([^<]\\|\n\\)*?>"
     "\\\\emph{"
     nil 0 (point-max))
        (replace-regexp
     "<b>"
     "\\\\emph{"
     nil 0 (point-max))

    (replace-regexp
     "</b>"
     "}"
     nil 0 (point-max))
        (replace-regexp
     "<i\\([^<]\\|\n\\)*?>"
     "\\\\emph{"
     nil 0 (point-max))
    (replace-regexp
     "</i>"
     "}"
     nil 0 (point-max)))


(defun h2-h3 () (interactive)
       (replace-regexp
	"<h2\\([^<]\\|\n\\)*?>" "\\\\section{" nil 0 (point-max))
       (replace-regexp
	"<h3\\([^<]\\|\n\\)*?>" "\\\\subsection{" nil 0 (point-max))
       (replace-regexp
	"</h[23]>" "}" nil 0 (point-max)))


(defun pre-texttt () (interactive)
       (replace-regexp
	"<pre\\([^<]\\|\n\\)*?>" "\\\\texttt{" nil 0 (point-max))
       (replace-string
	"</pre>" "}" nil 0 (point-max))
       (replace-regexp
	"<code\\([^<]\\|\n\\)*?>" "\\\\texttt{" nil 0 (point-max))
       (replace-string
	"</code>" "}" nil 0 (point-max)))

(defun html-to-latex () (interactive)
       (pre-texttt)
       (sacar-tags-a)
       (sacar-divs)
       (html-to-latex-tabla)
       (i-y-b-tags)
       (h2-h3)
       (html-to-latex))


