;; defaults
(require 'auto-complete)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq-default c-default-style "k&r")
(add-to-list 'auto-mode-alist '("\\.asm\\'" . nasm-mode))
 
(global-set-key (kbd "C-x a m") 'auto-complete-mode)
(global-set-key (kbd "<f5>") 'compile)

;;(load-file "~/packages/browse-kill-ring/browse-kill-ring.el")
(load-file "~/hlp/emacs/gnus/ejemplos/gnus-mail.el")
(load-file "~/hlp/emacs/hlp.el")



(column-number-mode)
(add-hook 'prog-mode-hook 'auto-complete-mode)
(add-hook 'fundamental-mode-hook 'auto-fill-mode)
(add-hook 'org-mode-hook 'auto-fill-mode)


(when (display-graphic-p) (load-theme 'manoj-dark))

(unless (string= "windows-nt" system-type)
  (require 'w3m)
  (setq-default browse-url-browser-function 'w3m-browse-url))
