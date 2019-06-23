(defun ordenar-numeros (arg)
  "Devuelve una lista de numeros del 0 a arg, ordenadas de manera que si 
se agrupan primero los números impares y luego los pares, el orden que
se obtiene de la función es el que habría que disponerlos  para obtener
el odenamiento original (es decir, ya no primero los impares, luego los
pares).
Esto es útil para imprimir cuando tengo en un pdf primero las paginas
impares y después las pares."
  (interactive "n")
  (let ((retu ()))
    (require 'cl)
    (setq retu (loop for n from 1 to (/ arg 2)
		     collect (list n (+ n (/ arg 2))))
	  retu (format "%s" retu)
	  retu (replace-regexp-in-string "(" "" retu)
	  retu (replace-regexp-in-string ")" "" retu)
	  retu (replace-regexp-in-string " " "," retu))
    (insert retu )))
