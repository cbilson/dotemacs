(add-to-list 'load-path (concat user-emacs-directory "cbilson/ess/lisp"))

(defun load-ess ()
  (interactive)
  '(progn 
     (require 'ess-site)
     (set 'auto-mode-alist (cons '("\\.R$" . r-mode) auto-mode-alist))))




