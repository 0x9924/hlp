#!/usr/bin/emacs --script

(dolist (elt argv)
  (princ
   (with-temp-buffer
     (insert-file-contents elt)
     (buffer-string))))
