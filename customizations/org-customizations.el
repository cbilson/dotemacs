
(org-babel-do-load-languages
 'org-babel-load-languages
 '((C . t)
   (clojure . t)
   (dot . t)
   (emacs-lisp . t)
   (gnuplot . t)
   (haskell . t)
   (latex . t)
   (ocaml . t)
   (octave . t)
   (python . t)
   (R . t)
   (ruby . t)
   (sh . t)
   (sql . nil)
   (sqlite . nil)))

(defun yas/org-very-safe-expand ()
  (let ((yas/fallback-behavior 'return-nil)) (yas/expand)))

(add-hook 'org-mode-hook
          (let ((original-command (lookup-key org-mode-map [tab])))
            `(lambda ()
               (setq yas/fallback-behavior
                     '(apply ,original-command))
               (local-set-key [tab] 'yas/expand))))

(org-remember-insinuate)
(setq org-src-fontify-natively t)

;(add-hook 'org-mode-hook 'turn-on-org-cdlatex)
(setq org-confirm-babel-evaluate nil)

(setq org-latex-to-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

(require 'org-macs)
(setq org-directory "~/Dropbox/org")
(setq org-mobile-directory "~/Dropbox/org")
(setq org-mobile-inbox-for-pull "~/Dropbox/org")
