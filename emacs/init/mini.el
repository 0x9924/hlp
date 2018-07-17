;; indentation
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq-default c-default-style "k&r")

(column-number-mode)


(load-theme 'manoj-dark)


(defun load-init-file ()
  (interactive)
  (load-file "~/hlp/emacs/init/habit.el"))

(global-set-key (kbd "C-c lh") 'load-init-file)
