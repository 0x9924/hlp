;; defaults
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq-default c-default-style "k&r")
(add-to-list 'auto-mode-alist '("\\.asm\\'" . nasm-mode))
 
(global-set-key (kbd "<f5>") 'compile)

;;(load-file "~/packages/browse-kill-ring/browse-kill-ring.el")
(load-file "~/hlp/emacs/gnus/ejemplos/gnus-mail.el")
(load-file "~/hlp/emacs/hlp.el")



(column-number-mode)
(add-hook 'fundamental-mode-hook 'auto-fill-mode)
(add-hook 'org-mode-hook 'auto-fill-mode)


(load-theme 'manoj-dark)

(package-initialize)

(if (and (package-installed-p 'w3m) (not window-system))
    (and (require 'w3m)
     (setq-default browse-url-browser-function 'w3m-browse-url)))

(if (package-installed-p 'auto-complete)
    (and (require 'auto-complete)
         (add-hook 'prog-mode-hook 'auto-complete-mode)))

;; (if (file-directory-p "~/packages/emacs/text-translator")
;;     (progn
;;      (add-to-list 'load-path "~/packages/emacs/text-translator")
;;      (customize-set-variable
;;       'text-translator-default-engine
;;       "google.com_enes")
;;      (require 'text-translator)))
  
    
