;;
;; haskel stuff
;;
(eval-after-load "haskell-mode"
  '(progn
     (add-to-list 'load-path (concat user-emacs-directory
                                     "cbilson/haskell-mode"))
     (require 'haskell-mode)
     (setq auto-mode-alist (cons '("\\.hs$" . haskell-mode) auto-mode-alist))))

