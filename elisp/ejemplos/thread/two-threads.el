;; -*- lexical-binding: t -*-


(defvar thread1 nil)
(defvar thread2 nil)
(defun insert-th (indent th-num num msecs)
  (insert (format "%sthread %s: %s\n" indent th-num num))
  (sleep-for 0 (+ num msecs))
  (1+ num))

(defun two-threads ()
  (interactive)
  (let ((buf (generate-new-buffer "foo")))
    (setq thread1
          (lambda ()
            (let ((counter 0))
              (mapc (lambda (c) (insert-th "" 1 c 160))
                    (number-sequence 1 10))))
          
          thread2
          (lambda ()
            (let ((counter 0))
              (dolist (c (number-sequence 1 10))
                (insert-th "  " 2 c 99)))))


    (pop-to-buffer buf)
    (insert "In two-threads")
    (newline)
    (make-thread thread1)
    (make-thread thread2) ))


(defun foo ()
  (interactive)
  (dolist (x (number-sequence 1 20))
    (insert (format "%s\n" x))
    (sleep-for 0 120)))


(defun bar ()
  (interactive)
  (loop for x being (number-sequence 1 20)
        do (progn
             (insert (format "%s\n" x))
             (sleep-for 0 120))))

