#!/bin/bash
":"; exec emacs -Q  --script "$0" -f main -- "$@" # -*-emacs-lisp-*-

(defun main ()
  (message "Hello world")
  (kill-emacs))
