#!/bin/sh
":"; exec emacs --quick --script "$0" "$@" # -*-emacs-lisp-*-

(while argv
  (princ (format "Hello %s!" (pop argv)))
  (terpri))

(kill-emacs 0)
