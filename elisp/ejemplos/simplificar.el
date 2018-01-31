(defun agregar-var (op x vars)
  (message "falta implementar")
  (cons x vars))

(defun simplificar (formula)
  (simplificar-cdr (car formula) (cdr formula)))

(defun simplificar-cdr (op args &optional nums vars subfs)
  (cond
   ;; args == ()
   ((null args)
    (cond
     ((and (null nums) (null vars) (null subfs))
      (error "error: llamado a (simplificar op ())"))
     ((not (null nums))
      (cons op (cons (apply op nums) (append vars subfs))))
     (t 
      (cons op (cons (apply op nums) vars)))))
   ;; (car args) == number
   ((numberp (car args))
    (simplificar-cdr op (cdr args) (cons (car args) nums) vars subfs))
   ;; (car args) == symbol (variable mat)
   ((symbolp (car args))
    (simplificar-cdr
     op (cdr args) nums (agregar-var op (car args) vars) subfs))
   ;; (car args) == list (es una subformula)
   ((listp (car args))
    (message "falta implementar")
    (if
	(null (car args))
	(simplifcar-cdr op (cdr args) nums vars subfs))
     
    (let ((simple (simplificar-cdr (caar args) (cdar args))))
      (cond
       ((null simple) ;; ??
	(cons op (append (cdr args) nums vars subfs)))
       ((numberp (car simple))
	(simplificar-cdr op (cdr args) (cons (car args) nums) vars))	
      )))))
    


(simplificar-cdr '+ '(a a a 1 4 4564 8))
