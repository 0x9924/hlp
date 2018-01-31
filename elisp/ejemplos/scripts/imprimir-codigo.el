#!/bin/bash
":"; exec emacs -Q  --script "$0" -f main -- "$@" # -*-emacs-lisp-*-

(defun main ()
  (mapc 'cat-file (cdr argv))
  (kill-emacs))
  

(defun cat-file (filename)
  (send-string-to-terminal
   (with-temp-buffer
     (insert 
      "#+LaTex_HEADER: \\usepackage[margin=2cm]{geometry}")
     (newline)
     (insert "#+BEGIN_SRC")
     (newline)
     (insert-file-contents filename)
     (newline)
     (insert "#+END_SRC")
     (buffer-string))))




