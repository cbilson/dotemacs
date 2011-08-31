(add-to-list 'load-path (concat vendor-directory "/ess/lisp"))
(load (concat vendor-directory "/ess/lisp/ess-site"))
(set 'auto-mode-alist (cons '("\\.R$" . r-mode) auto-mode-alist))

(defun load-ess ()
  (interactive)
  '(progn) 
  )




