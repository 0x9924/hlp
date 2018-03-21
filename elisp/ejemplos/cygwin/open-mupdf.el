
(defun mupdf ()
  (interactive)                          
  (let ((filename (expand-file-name (read-file-name "File: "))))
    (async-shell-command
     (concat "\"/cygdrive/c/Program Files (x86)/mupdf-1.8-windows-x64/mupdf.exe\" "
             (replace-regexp-in-string (expand-file-name default-directory) "" filename))))) 


