(require 'cl)

(loop for x from 1 to 10
      do (print "s"))


(loop for x from 1 to 15
      collect x)


(loop for x from 1 to 10
      collect "s")

(defun rep (que cuanto)
  (loop for x from 1 to cuanto
	collect que))

(defun seq (desde hasta &rest cada)
  (if (eq nil cada)
      (setq cada 1)
    (setq cada (car cada)))
  (loop for x from desde to (/ hasta cada)
	collect (* cada x)))

(seq 1 100 .2)
