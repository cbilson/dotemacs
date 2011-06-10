
;;
;; misc
;;
(column-number-mode t)
(blink-cursor-mode t)
(auto-compression-mode 1)
(set-variable 'scroll-step 1)
(set-variable 'scroll-conservatively 5)
(set-variable 'default-truncate-lines 1)
(set-variable 'suggest-key-bindings t)
(set-variable 'transient-mark-mode nil)

(add-to-list 'load-path (concat dotfiles-dir "vendor"))
(add-to-list 'load-path (concat dotfiles-dir "vendor/clojure-mode"))
(add-to-list 'load-path (concat dotfiles-dir "vendor/midje"))
(add-to-list 'load-path (concat dotfiles-dir "elpa-to-submit/fsharp"))

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome")
; some other filename patterns that are XML
(setq auto-mode-alist (cons '("\\.xaml$" . nxml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.msbuild$" . nxml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.build$" . nxml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.proj$" . nxml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.csproj$" . nxml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.fsproj$" . nxml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.kml$" . nxml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.conkererrc$" . js2-mode) auto-mode-alist))

(org-remember-insinuate)

(defun toggle-fullscreen (&optional f)
  "Toggles whether or not the window is fullscreen"
  (interactive)
  (set-frame-parameter nil 'fullscreen
                       (if (frame-parameter nil 'fullscreen) nil 'fullboth)))

;;
;; Rotates window positions
;;
(defun rotate-windows ()
  "Rotate your windows"
  (interactive)
  (cond ((not (> (count-windows) 1)) (message "You can't rotate a single window!"))
        (t
         (setq i 1)
         (setq numWindows (count-windows))
         (while  (< i numWindows)
           (let* (
                  (w1 (elt (window-list) i))
                  (w2 (elt (window-list) (+ (% i numWindows) 1)))
                  (b1 (window-buffer w1))
                  (b2 (window-buffer w2))
                  (s1 (window-start w1))
                  (s2 (window-start w2))
                  )
             (set-window-buffer w1  b2)
             (set-window-buffer w2 b1)
             (set-window-start w1 s2)
             (set-window-start w2 s1)
             (setq i (1+ i)))))))

(defun push-mark-no-activate ()
  "Pushes `point' to `mark-ring' and does not activate the region
Equivalent to \\[set-mark-command] when \\[transient-mark-mode] is disabled"
  (interactive)
  (push-mark (point) t nil)
  (message "Pushed mark to ring"))

(defun jump-to-mark ()
  "Jumps to the local mark, respecting the `mark-ring' order.
This is the same as using \\[set-mark-command] with the prefix argument."
  (interactive)
  (set-mark-command 1))

(defun exchange-point-and-mark-no-activate ()
  "Identical to \\[exchange-point-and-mark] but will not activate the region."
  (interactive)
  (exchange-point-and-mark)
  (deactivate-mark nil))

;;
;; Rebind a few keys
;;
(global-set-key (kbd "C-<left>") 'backward-word)
(global-set-key (kbd "C-<right>") 'forward-word)
(global-set-key (kbd "C-c C-r") 'remember)
(global-set-key (kbd "C-c w") 'rotate-windows)
(global-set-key (kbd "C-x C-a") '(lambda () (interactive) (ansi-term "/bin/zsh")))
(global-set-key (kbd "C-@") 'push-mark-no-activate)
(global-set-key (kbd "M-`") 'jump-to-mark)
(global-set-key (kbd "C-x c") 'comment-region)
(global-set-key (kbd "<f5>") 'durendal-jack-in)

(define-key global-map [remap exchange-point-and-mark] 'exchange-point-and-mark-no-activate)

;; (eval-after-load 'paredit
;;   '(progn (define-key paredit-mode-map (kbd "C-<left>") 'backward-word)
;;           (define-key paredit-mode-map (kbd "C-<right>") 'forward-word)))

(require 'visible-mark)
(visible-mark-mode)

(defun remove-dos-eol ()
  "Removes the disturbing '^M' showing up in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))
