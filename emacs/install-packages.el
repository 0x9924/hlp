(let
    ((install-list '(auto-complete w3m)))
  (package-initialize)
  (mapc 'package-install install-list))

(setq packages-to-install-list '('auto-complete 'w3m))
(mapc 'package-install packages-to-install-list)

 
(package-install 'auto-complete)
