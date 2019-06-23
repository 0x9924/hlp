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
            (with-temp-buffer
              (insert-file-contents "./file" nil nil nil t)
              (while (= 0 (forward-line))
                (let ((l (thing-at-point 'line t)))
                  (with-current-buffer buf
                    (insert "th 1: ")
                    (insert l)))))))
    (setq thread2
          (lambda ()
            (with-temp-buffer
              (insert-file-contents "./file" nil nil nil t)
              (while (= 0 (forward-line))
                (let ((l (thing-at-point 'line t)))
                  (with-current-buffer buf
                    (insert "th 2: ")
                    (insert l)))))))

    (pop-to-buffer buf)
    (insert "In two-threads")
    (newline)
    (make-thread thread1)
    (make-thread thread2) ))

