#!/bin/bash
:; exec emacs -Q --script "$0" -f main -- "$@" # -*- mode:lisp -*-

(defun main ()
  (require 'package)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.org/packages/"))
  (package-install 'w3m)
  (kill-emacs))
