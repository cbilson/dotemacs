;;
;; clojure stuff
;;
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs$" . clojurescript-mode))

(add-hook 'clojure-mode-hook
          '(lambda ()
             (require 'durendal)
             (durendal-enable)

             (require 'clojure-test-mode)
             (save-excursion
               (goto-char (point-min))
               (if (search-forward "(deftest" nil t)
                   (clojure-test-mode)))

             (require 'midje-mode)
             (save-excursion
               (goto-char (point-min))
               (if (search-forward "(fact" nil t)
                   (midje-mode)))

             (require 'paredit)
             (paredit-mode)
             (projectile-mode)

             (require 'yasnippet)
             (yas/minor-mode)))

(add-hook 'clojurescript-mode-hook
          (lambda ()
            (require 'paredit)
            (paredit-mode)
            (define-clojure-key-maps)

            (require 'yas/minor-mode)))

(add-hook 'slime-mode-hook
          (lambda ()
            (paredit-mode)
            (set-up-slime-ac)))

