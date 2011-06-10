
;;
;; Package Management
;;
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

;; additional packages I want installed
(dolist (package '(clojure-mode
                   clojure-test-mode
                   color-theme
                   dired-isearch
                   durendal
                   haml-mode
                   idle-highlight
                   markdown-mode
                   muse
                   org
                   paredit
                   rinari
                   rspec-mode
                   ruby-electric
                   rvm
                   sass-mode
                   slime
                   yasnippet-bundle
                   zenburn))
  (add-to-list 'starter-kit-packages package))

