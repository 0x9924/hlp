;; (defun gnus-office365 () (interactive)
;;        (eval (gnus-mail-smtp-conf "smtp-mail.outlook.com"))
;;        (gnus))

(defun gnus-office365 () (interactive)
       (let ((user (read-string "user: ")))
         (setq pop3-leave-mail-on-server t
               gnus-secondary-select-methods
               '((nnml "outlook"));;(nntp "outlook.office365.com"))
               mail-sources
               `((pop :server "outlook.office365.com"
                      :user ,user
                      :port 995
                      :stream ssl)))
         ;;(add-to-list 'gnus-secondary-select-methods '(nnml "outlook"))
         (gnus)))
