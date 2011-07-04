;;
;; clojure stuff
;;
(add-to-list 'load-path (concat user-emacs-directory "cbilson/midje"))
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))

(eval-after-load "clojure-mode"
  '(progn (add-hook 'clojure-mode-hook
                    '(lambda ()
                       (require 'paredit)
                       (paredit-mode)
                       
                       (require 'midje-mode)
                       (midje-mode)
                       
                       (require 'durendal)
                       (durendal-enable)
                       
                       (require 'clojure-test-mode)
                       (save-excursion
                         (goto-char (point-min))
                         (if (search-forward "(deftest" nil t)
                             (clojure-test-mode)))
                       
                       (define-key clojure-mode-map (kbd "C-c c") 'comment-region)
                       (define-key clojure-mode-map (kbd "C-c u") 'uncomment-region)
                       (define-key clojure-mode-map (kbd "C-S-w") 'mark-sexp)
                       (define-key clojure-test-mode-map (kbd "C-1") 'midje-check-fact)
                       (define-key clojure-test-mode-map (kbd "C-2") 'midje-recheck-last-fact-checked)))))

(add-hook 'slime-mode-hook (lambda () (setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)))
(global-set-key (kbd "C-c C-j") 'clojure-jack-in)
