(defun lnn-to-hex-string (lnn)
  (let ((res "0x"))
    (dolist (num lnn res)
      (setq res (concat res 
                        (format "%04x" num))))))

(defun bits-in-T ()
  (let ((x (lognot 0))
        (res 0))
    (while (not (equal 0 x))
      (setq x (lsh x -1)
            res (1+ res)))
    res))

(bits-in-T)

(defun int-to-binary-string (i)
  "convert an integer into it's binary representation in string format"
  (let ((res ""))
    (while (not (= i 0))
      (setq res (concat (if (= 1 (logand i 1)) "1" "0") res))
      (setq i (lsh i -1)))
    (if (string= res "")
        (setq res "0"))
    res))

(int-to-binary-string (lognot 0))

(lnn-to-hex-string '((1- (expt 2 16))))

(lnn-to-hex-string '(65535))

(lnn-to-hex-string (list (1- (expt 2 16))))
