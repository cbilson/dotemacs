;;
;; Global Keybindings
;;
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x c") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c C-r") 'remember)
(global-set-key (kbd "C-c w") 'rotate-windows)
(global-set-key (kbd "C-@") 'push-mark-no-activate)
(global-set-key (kbd "M-`") 'jump-to-mark)
(global-set-key (kbd "C-x C-j") 'dired-jump)

(define-key global-map [remap exchange-point-and-mark] 'exchange-point-and-mark-no-activate)

(global-set-key (kbd "M-RET") 'toggle-fullscreen)
(global-set-key (kbd "C-c C-j") 'clojure-jack-in)

;;
;; Clojure specific keybindings
;;
(defun define-clojure-key-maps ()
  (define-key clojure-mode-map (kbd "C-c c") 'comment-region)
  (define-key clojure-mode-map (kbd "C-c u") 'uncomment-region)
  (define-key clojure-mode-map (kbd "C-S-w") 'mark-sexp)
  (define-key clojure-test-mode-map (kbd "C-1") 'midje-check-fact)
  (define-key clojure-test-mode-map (kbd "C-2") 'midje-recheck-last-fact-checked))

;;
;; Fastnav Keybindings
;;
(global-set-key"\C-\M-z" 'fastnav-zap-up-to-char-forward)
(global-set-key "\C-\M-Z" 'fastnav-zap-up-to-char-backward)
(global-set-key "\C-\M-s" 'fastnav-jump-to-char-forward)
(global-set-key "\C-\M-S" 'fastnav-jump-to-char-backward)
(global-set-key "\C-\M-r" 'fastnav-replace-char-forward)
(global-set-key "\C-\M-R" 'fastnav-replace-char-backward)
(global-set-key "\C-\M-i" 'fastnav-insert-at-char-forward)
(global-set-key "\C-\M-I" 'fastnav-insert-at-char-backward)
(global-set-key "\C-\M-j" 'fastnav-execute-at-char-forward)
(global-set-key "\C-\M-J" 'fastnav-execute-at-char-backward)
(global-set-key "\C-\M-k" 'fastnav-delete-char-forward)
(global-set-key "\C-\M-K" 'fastnav-delete-char-backward)
(global-set-key "\C-\M-m" 'fastnav-mark-to-char-forward)
(global-set-key "\C-\M-M" 'fastnav-mark-to-char-backward)
(global-set-key "\C-\M-p" 'fastnav-sprint-forward)
(global-set-key "\C-\M-P" 'fastnav-sprint-backward)
