(setq o '+
      a '(1 2 3 4 5))

(defun simplificar-numeros (op args &rest nums vars)
  (let ((car (car args))
	(cdr (cdr args)))
    (cond
     ((numberp car)
      (push car nums)
      (simplificar-numeros (cons op (append cdr nums vars))))
     ((null car) (cons op (append (apply op nums) vars))))))


(defun simplificar-numeros2 (op args &optional nums vars)
  (cond
   ((null (car args)) (cons op (append (apply op nums) vars)))
   ((numberp (car args))
      (push (car args) nums)
      (simplificar-numeros op (cdr args) nums vars))))



;; (defun simplificar-numeros3 (op args &optional nums vars)
;;   (cond
   
;;    ((numberp car)
;;       (push car nums)  )
;;      ;; (simplificar-numeros op cdr nums vars))
;;      ((null car) (cons op (append (apply op nums) vars))))))

;; (simplificar-numeros o a)
(defun test (X &optional a)
  a)
