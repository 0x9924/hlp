:;exec emacs -batch -l   "$0" -f : "$@" --no-site-file -q # -*- Emacs-Lisp -*-
;;     @emacs -batch -l "%~f0" -f :  %*  --no-site-file -q  & goto :EOF
;;
;; This script will obfuscate a text file, by loading it in, then repeatedly
;; doing pairs of ^F and ^T commands throughout, and then saving it.  The original
;; file is kept as a tilde (~) backup.
;;
;; Usage:  script-name  text-file-name
;;         To reverse the process and get your original file as a result,
;;         run the script again.
;;
;; (No it will not fool any serious cryptographer/programmer, but it will keep folks
;;  from reading over your shoulder (the results are -really- hard on the eyes) and
;;  will probably keep your children from ever decoding it.)
;;
(defun : ()
  (find-file (nth 5 command-line-args))
  (condition-case nil
      (execute-kbd-macro "\^f\^[1\^t" 0)
    (error nil) )
  (save-buffer) )
;:EOF
