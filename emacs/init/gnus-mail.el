(defun gnus-mail-imap-conf (imap-addres)
  `(setq gnus-select-method
         '(nnimap ,imap-addres
                  (nnimap-address ,imap-addres)
                  (nnimap-server-port 993)
                  (nnimap-stream ssl))))

(defun gnus-mail-smtp-conf (smtp-server)
  `(setq smtpmail-smtp-server ,smtp-server
         smtpmail-smtp-service 587
         gnus-ignored-newsgroups
         "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]"))


(defun gnus-dc ()
  (interactive)
  (let ((user-login-name user-mail-address))
    (setq user-full-name user-login-name)
    (eval (gnus-mail-imap-conf "imap.dc.uba.ar"))
    (eval (gnus-mail-smtp-conf "smtp.dc.uba.ar"))
    (setq gnus-message-archive-group
          (format-time-string "nnimap+imap.dc.uba.ar:INBOX.Sent.%Y"))
    (gnus)))

(defun gnus-gmail () (interactive)
       (customize-set-variable 'gnus-always-read-dribble-file
			       t)
       (setq user-login-name (replace-regexp-in-string
                              "@.*" "" user-mail-address))
       (setq user-full-name user-login-name)
	    (eval (gnus-mail-imap-conf "imap.gmail.com"))
	    (eval (gnus-mail-smtp-conf "smtp.gmail.com"))
	    (gnus))


(defun gnus-outlook () (interactive)
       (eval (gnus-mail-imap-conf "imap-mail.outlook.com"))
       (eval (gnus-mail-smtp-conf "smtp-mail.outlook.com"))
       (gnus))

(defun gnus-office365-imap () (interactive)
       (eval (gnus-mail-imap-conf "outlook.office365.com"))
       (eval (gnus-mail-smtp-conf "smtp.office365.com"))
       (gnus))

(defun gnus-office365-pop3 () (interactive)
       (let ((user (read-string "user: ")))
         (setq pop3-leave-mail-on-server t
               gnus-secondary-select-methods
               '((nnml "outlook"))
               mail-sources
               `((pop :server "outlook.office365.com"
                      :user ,user
                      :port 995
                      :stream ssl
		      :leave t)))
         (gnus)))


