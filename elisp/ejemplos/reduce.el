;;;; ejemplo
(reduce (lambda (rec x) (cons x rec) '(1 2 3 4 5 6)
  :initial-value ())
