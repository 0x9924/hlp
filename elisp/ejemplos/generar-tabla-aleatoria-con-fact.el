;; En primer lugar deben setearse las siguientes variables, que determinarán:
;; el numero de sujetos
;; el número de factores
;; el número de variables y
;; el conjujunto de operaciones.

(setq numero-de-sujetos 250
      factores '(f1 f2 f3)
      fac1 () fac2 () fac3 () ; para los datos-factores
      Nvars (make-list 16 nil); p las al. func.
      operaciones '(+ - * expt)) ; p generar al. func.(le saque log, expt, /))




(progn
  ;; funciones q voy a usar  
  (defun remove-nth (n list)
    (if (or (zerop n) (null list))
	(cdr list)
      (cons (car list) (remove-nth (1- n) (cdr list)))))
  (defun rnd-perm (argList)
    (if (null argList)
	()
      (let ((rand-pos (random (length argList))))
	(cons (nth rand-pos argList)
	      (remove-nth rand-pos rnd-perm(argList))))))
  (require 'cl) ; esto es para usar `loop.
  (defun seq (desde hasta &rest cada)
    (if (eq nil cada)
	(setq cada 1)
      (setq cada (car cada)))
    (loop for x from desde to (/ hasta cada)
	  collect (* cada x)))
  (defun rnd-asoc-op (argList)
    (let ((rndNum (random (length argList))))
      (if (= 1 (length argList))
	  (car argList)
	(cons (nth (random (length operaciones)) operaciones) 
	      (list (nth rndNum argList) 
		    (rnd-asoc-op (remove-nth rndNum argList)))))))
  (defun exportar (lista archivo)
    (write-region  (format "%s" lista) nil archivo 'append))


  ;; variables que necesito
  (setq vars '() 
	sujetos (seq 1 numero-de-sujetos)
	matriz ()
	data ()
	nvariables (seq 1 (length Nvars)))


  (dolist (x Nvars) 
    (setq vars (cons (rnd-asoc-op factores) vars)))
  ;; ahora vars es una lista con (length Nvars) funciones de 3 variablews
  ;; genero los "factores".
  (progn
    (dolist (x sujetos)
      (setq fac1 (cons (1+ (/ (random 100) 75.0)) fac1)))
    (dolist (x sujetos)
      (setq fac2 (cons (1+ (/ (random 100) 75.0)) fac2)))
    (dolist (x sujetos)
      (setq fac3 (cons (1+ (/ (random 100) 75.0)) fac3)))
    (setq fact_data (list fac1 fac2 fac3)))

  ;; genero las variables
  (dolist (f nvariables) 
    (dolist (s sujetos)
      (setq s (1- s)
	    data (cons
		  (format "%0.2f" ((lambda (f1 f2 f3) (eval (nth (1- f) vars)))
				   (nth s fac1) (nth s fac2) (nth s fac3)))
		  data)))))

(setq data-str (replace-regexp-in-string "(" "" (format "%s" data))
      data-str (replace-regexp-in-string ")" "" data-str)
      data-str (replace-regexp-in-string " " "\n" data-str))



;; (length data)
;; (exportar data "data-0.txt")
;; (exportar data-str "data-srt-0.txt")

