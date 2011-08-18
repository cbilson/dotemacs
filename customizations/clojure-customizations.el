;;
;; clojure stuff
;;
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))

(eval-after-load "clojure-mode"
  '(progn (add-hook 'clojure-mode-hook
                    '(lambda ()
                       (require 'paredit)
                       (paredit-mode)
                       
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

                       (define-clojure-key-maps)))))

(add-hook 'slime-mode-hook (lambda () (setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)))

