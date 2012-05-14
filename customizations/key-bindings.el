;;
;; Global Keybindings
;;
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x c") 'comment-or-uncomment-region)
(global-set-key (kbd "M-`") 'jump-to-mark)
(global-set-key (kbd "C-x C-j") 'dired-jump)
(global-set-key (kbd "C-c C-j") 'clojure-jack-in)

;;
;; Unicode shortcuts
;;
(define-prefix-command 'symbols-keymap)
(define-key symbols-keymap (kbd "a") "α")
(define-key symbols-keymap (kbd "b") "β")
(define-key symbols-keymap (kbd "d") "δ")
(define-key symbols-keymap (kbd "g") "γ")
(define-key symbols-keymap (kbd "s") "σ")
(define-key symbols-keymap (kbd "S") "Σ")
(define-key symbols-keymap (kbd "t") "θ")
(define-key symbols-keymap (kbd "T") "Θ")

(add-to-list 'load-path vendor-directory)

(require 'ace-jump-mode)
(global-set-key (kbd "C-0") 'ace-jump-mode)
