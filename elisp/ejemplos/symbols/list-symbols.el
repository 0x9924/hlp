(defun get-variables ()
    (loop for x being the symbols
          if (boundp)
          collect x))
          
(defun get-functions ()
    (loop for x being the symbols
          if (fboundp)
          collect x))
