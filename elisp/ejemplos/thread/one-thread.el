(defun foo ()
  (interactive)
  (insert "previous to call") (newline)
  (make-thread (lambda ()
                 (mapc (lambda (x)
                         (insert (format "%s %s" "in the lambda " x))
                         (sleep-for 1.5)
                         (insert (format "%s %s" "in the lambda" x) (newline))))))
  (insert "after call") (newline))
previous to call
after call




