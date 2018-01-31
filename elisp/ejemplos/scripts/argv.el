#!/bin/bash
:; exec emacs -Q --script "$0" -f main -- "$@" # -*- mode:lisp -*-

(defun main ()
 (print argv)
 (foo)
 (kill-emacs))


(defun foo ()
  (print "in foo"))
