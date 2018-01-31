(defun remove-nth (n list)
  (declare
    (type (integer 0) n)
    (type list list))
  (if (or (zerop n) (null list))
    (cdr list)
    (cons (car list) (remove-nth (1- n) (cdr list)))))


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

(defun rnd-perm (argList)
  (if (null argList)
      ()
    (let ((rand-pos (random (length argList))))
      (cons (nth rand-pos argList) (remove-nth rand-pos rnd-perm(argList))))))


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
arg1 es lista en esta versión"
  (let ((lista ()) (string ()) (nueva-lista ()))
    (if (and (listp arg1) (stringp arg2))
        (setq lista arg1 string arg2))
    (dolist (str lista)
      (setq nueva-lista
            (cons
             (concat string str) nueva-lista)))
  nueva-lista))
 

(defun nth-or-id (n arg)
  "Devuelve nth n si arg es lista, arg si es string"
(if (stringp arg) arg
  (if (listp arg)
      (nth n arg)))) 

(defun concat-with-strings-whithin-list (arg1 arg2)
  "Esta funcion todavia no esta terminada.
arg1 es lista en esta versión"
  (let ((nueva-lista ()) (largo 0))
    (if (listp arg1) (setq largo (length arg1))
      (if (listp arg2) (setq largo (length arg2))))
    (dotimes (n largo)
      (setq nueva-lista
            (cons
             (concat
              (nth-or-id n arg1)
              (nth-or-id n arg2)) nueva-lista)))
    (setq nueva-lista (reverse nueva-lista))))


(defun cars (lista)
  (let ((retu ()))
    (dolist (sublista lista retu)
      (setq retu
	    (cons (car sublista) retu)))))
