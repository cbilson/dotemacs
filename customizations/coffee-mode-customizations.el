(autoload 'coffee-mode "coffee-mode" t)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

(defun use-jcoffee-compiler ()
  (let ((jcoffee-jar (concat vendor-directory "/jcoffeescript-1.1.jar")))
    (setq coffee-command (concat "java -jar " jcoffee-jar))
    (setq coffee-args-compile "")))

(defun use-iron-coffee-compiler ()
  (let ((iron-coffee-exe (concat vendor-directory "/IronCoffee.exe")))
    (setq coffee-command iron-coffee-exe)))

(defun coffee-custom ()
  "coffee-mode-hook"
  (use-iron-coffee-compiler))

(add-hook 'coffee-mode-hook '(lambda () (coffee-custom)))
