(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

(defun use-jcoffee-script ()
  (let ((jcoffee-jar (concat vendor-directory "/jcoffeescript-1.1.jar")))
    (setq coffee-command (concat "java -jar " jcoffee-jar))
    (setq coffee-args-compile "")))

(defun coffee-custom ()
  "coffee-mode-hook"
  (use-jcoffee-script))

(add-hook 'coffee-mode-hook '(lambda () (coffee-custom)))
