(defmacro set-var-with-value (var value)
  (list 'setq var value))

(defmacro set-var-with-value-bq (var value)
  `(setq ,var ,value))

(defmacro ++ (x)
  (list 'setq x (list '1+ x)))

(defmacro ++bq (x) `(setq ,x (1+ ,x)))
