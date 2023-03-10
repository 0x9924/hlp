(defun ordenar-numeros (arg)
  "Devuelve una lista de numeros del 0 a arg, ordenadas de manera que si 
se agrupan primero los n?meros impares y luego los pares, el orden que
se obtiene de la funci?n es el que habr?a que disponerlos  para obtener
el odenamiento original (es decir, ya no primero los impares, luego los
pares).
Esto es ?til para imprimir cuando tengo en un pdf primero las paginas
impares y despu?s las pares."
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
