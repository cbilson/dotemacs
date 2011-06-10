;;
;; haskel stuff
;;
(add-to-list 'load-path (concat dotfiles-dir "cbilson/haskell-mode"))
(require 'haskell-mode)
(setq auto-mode-alist (cons '("\\.hs$" . haskell-mode) auto-mode-alist))

