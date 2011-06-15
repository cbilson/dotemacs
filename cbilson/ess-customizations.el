(add-to-list 'load-path (concat user-emacs-directory "cbilson/ess/lisp"))

(defun load-ess ()
  (interactive)
  (do (load (concat user-emacs-directory "cbilson/ess/lisp/ess-site"))
      (set 'auto-mode-alist (cons '("\\.R$" . r-mode) auto-mode-alist))))




