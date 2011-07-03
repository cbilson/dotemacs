(add-to-list 'load-path (concat default-directory "cbilson/ess/lisp"))
(add-to-list 'auto-mode-alist '("\\.R$" . ess-site))

(defun load-ess ()
  (interactive)
  '(progn 
     (require 'ess-site)
     (set 'auto-mode-alist (cons '("\\.R$" . r-mode) auto-mode-alist))))




