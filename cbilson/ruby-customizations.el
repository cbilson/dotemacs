;;
;; ruby stuffs
;;
(defconst ironruby-ir "C:/Program Files/IronRuby 1.0v4/bin/ir.exe")

(defun inf-iron-ruby ()
  "inferior ruby mode using IronRuby"
  (interactive)
  (run-ruby ironruby-ir "IronRuby"))

(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; (require 'rspec-mode)
;; (add-hook 'rspec-mode-hook (define-key rspec-mode-keymap (kbd "C-1") 'rspec-verify-single))

