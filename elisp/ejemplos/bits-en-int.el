(defun bits-en-int ()
  (let ((n 1)
	(nbits 0))
    (while (not (eq n 0))
      (setq n (lsh n 1)
	    nbits (1+ nbits)))
    nbits))


