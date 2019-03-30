(defvar a-global-var nil)

(defun set-a-global-var-fun (arg)
  `(setq a-global-var ,arg))

(defmacro set-a-global-var (arg)
  `(setq a-global-var ,arg))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(eval (set-a-global-var-fun "set in fun"))

(set-a-global-var "set in macro")
