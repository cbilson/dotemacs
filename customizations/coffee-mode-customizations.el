(autoload 'coffee-mode "coffee-mode" t)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

(defun use-jcoffee-compiler ()
  (let ((jcoffee-jar (concat vendor-directory "/jcoffeescript-1.1.jar")))
    (setq coffee-command (concat "java -jar " jcoffee-jar))
    (setq coffee-args-compile "")))

(defun coffee-custom ()
  "coffee-mode-hook"
  (setq coffee-command "/usr/local/bin/coffee")
  (setq coffee-js-mode 'javascript-mode)
  (define-key coffee-mode-map (kbd "C-c C-c") 'coffee-compile-buffer)
  (define-key coffee-mode-map (kbd "C-c C-r") 'coffee-compile-region)
  (define-key coffee-mode-map (kbd "C-c C-s") 'coffee-repl)
  (define-key coffee-mode-map [remap comment-dwim] 'coffee-comment-dwim)
  (define-key coffee-mode-map "\C-m" 'coffee-newline-and-indent)
  (define-key coffee-mode-map "\C-c\C-o\C-s" 'coffee-cos-mode))

(add-hook 'coffee-mode-hook '(lambda () (coffee-custom)))
