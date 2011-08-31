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
(put 'narrow-to-region 'disabled nil)

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program (if (eq system-type 'windows-nt)
                                     "C:\\Dropbox\\bin\\FirefoxPortable5\\App\\Firefox\\firefox.exe -app C:\\Dropbox\\bin\\conkeror\\application.ini"
                                   "~/bin/conkeror"))

(setq user-full-name "Chris Bilson")
(setq user-mail-address "cbilson@pobox.com")

(require 'gnus)
(setq nnml-directory "~/gmail")
(setq message-directory "~/gmail")
(setq gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\”]\”[#’()]")
(setq gnus-select-method
      '(nnimap "gmail"
               (nnimap-address "imap.gmail.com")
               (nnimap-server-port 993)
               (nnimap-stream ssl)))

(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials '(("smtp.gmail.com" 587 "cbilson@gmail.com" nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      starttls-use-gnutls t)

(setq mm-attachment-override-types '("image/.*"))
(setq mm-discouraged-alternatives '("text/html" "text/richtext"))

(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map "b" 'my-browser-find-file)))

(defun my-dired-browser-find-file ()
  "Dired function to view a file in a web browser"
  (interactive)
    (browse-url (browse-url-file-url (dired-get-filename))))

; some other filename patterns that are XML
(setq auto-mode-alist (cons '("\\.xaml$" . nxml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.msbuild$" . nxml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.build$" . nxml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.proj$" . nxml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.csproj$" . nxml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.fsproj$" . nxml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.kml$" . nxml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.conkerorrc$" . javascript-mode) auto-mode-alist))

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

(require 'flymake)

(defun remove-dos-eol ()
  "Removes the disturbing '^M' showing up in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

