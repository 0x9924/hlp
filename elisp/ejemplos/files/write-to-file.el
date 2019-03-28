(defun write-string-to-file (string filename)
  (with-temp-file filename (insert string)))
