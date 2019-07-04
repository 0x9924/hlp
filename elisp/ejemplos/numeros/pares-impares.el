(require 'cl)
(defun impares (desde hasta)
  (interactive "ndesde: \nnhasta: ")
  (let* ((minimo (/  desde 2))
         (maximo (/ (1- hasta) 2))

         (seq (mapcar (lambda (x) (1+ (* 2 x)))
                      (number-sequence minimo maximo)))
         
         (res (reduce (lambda (x y) (format "%s, %s" x y)) seq)))

    (kill-new res)
    (message "%s" res)))


(defun pares-reverse (desde hasta)
  (interactive "ndesde: \nnhasta: ")
  (let* ((minimo (/ (1+ desde) 2))
         (maximo (/ hasta 2))
         (seq (mapcar (lambda (x) (* 2 x))
                      (number-sequence minimo maximo)))
         (res (reduce (lambda (x y) (format "%s, %s" x y))
                      (reverse seq))))

    (kill-new res)
    (message "%s" res)))


      
