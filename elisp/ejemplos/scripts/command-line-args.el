#!/bin/bash
":"; exec emacs -Q  --script "$0" -f main -- "$@" # -*-emacs-lisp-*-

(defun main ()
  (print argv)
  
  (if (member "-f" argv)
      (print (getoptarg "-f" argv)))
  (kill-emacs))

          
(defun getoptarg (opt argvec)
  "Si argv es una lista como (-f FILE param1 param2) y opt es -f entonces
devuelvo FILE. Si no null."
  (cond
   ((null argvec) (error (format "No se encontro la opcion %s" opt)))
   ((string= (car argvec) opt)
    (if (null (cadr argvec))
        (error
         (format "La opcion %s debe tener un argumento" opt))
      (cadr argvec)))
   (t (getoptarg opt (cdr argvec)))))



