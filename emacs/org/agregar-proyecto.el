(require 'ox-publish)
(setq org-publish-project-alist
      `(("nombre-del-proyecto"
	 :base-directory "~/..."
	 :recursive t
	 :publishing-directory "~/..."
	 :publishing-function org-html-publish-to-html)))
