;;
;; misc
;;
(column-number-mode t)
(blink-cursor-mode t)
(auto-compression-mode 1)
(global-subword-mode 1)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq slime-net-coding-system 'utf-8-unix)
(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled t)

(set-variable 'scroll-step 1)
(set-variable 'scroll-conservatively 5)
(set-variable 'default-truncate-lines 1)
(set-variable 'suggest-key-bindings t)
(set-variable 'transient-mark-mode t)
(put 'narrow-to-region 'disabled nil)
 
(defun browse-url-on-mac (url &optional new-window)
  (interactive (browse-url-interactive-arg "URL: "))
  (let ((url (if (aref (url-generic-parse-url url) 0)
                 url
               (concat "http://" url))))
    (start-process (concat "open " url) nil "open" "-a" "Conkeror" url)))

(setq browse-url-browser-function 'browse-url-on-mac)

(setq user-full-name "Chris Bilson")
(setq user-mail-address "cbilson@pobox.com")

(if (eq system-type 'darwin)
    (setq ispell-program-name "/usr/local/bin/aspell"))

;; (require 'gnus)
;; (setq nnml-directory "~/gmail")
;; (setq message-directory "~/gmail")
;; (setq gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\”]\”[#’()]")
;; (setq gnus-select-method
;;       '(nnimap "gmail"
;;                (nnimap-address "imap.gmail.com")
;;                (nnimap-server-port 993)
;;                (nnimap-stream ssl)))

;; (setq message-send-mail-function 'smtpmail-send-it
;;       smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
;;       smtpmail-auth-credentials '(("smtp.gmail.com" 587 "cbilson@gmail.com" nil))
;;       smtpmail-default-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-service 587
;;       starttls-use-gnutls t)

;; (setq mm-attachment-override-types '("image/.*"))
;; (setq mm-discouraged-alternatives '("text/html" "text/richtext"))

(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map "b" 'my-browser-find-file)))

(defun my-dired-browser-find-file ()
  "Dired function to view a file in a web browser"
  (interactive)
    (browse-url (browse-url-file-url (dired-get-filename))))

;; some other filename patterns that are XML
(setq auto-mode-alist
      (append
             '(("\\.xaml$" . nxml-mode)
               ("\\.spark$" . html-mode)
               ("\\.msbuild$" . nxml-mode)
               ("\\.build$" . nxml-mode)
               ("\\.proj$" . nxml-mode)
               ("\\.csproj$" . nxml-mode)
               ("\\.fsproj$" . nxml-mode)
               ("\\.kml$" . nxml-mode)
               ("\\.conkerorrc$" . javascript-mode)
               ("\\.Guardfile$" . ruby-mode)
               ("\\.md$" . markdown-mode)
               ("\\.markdown$" . markdown-mode)
               ("README" . markdown-mode)
               ("HACKING" . markdown-mode))
               auto-mode-alist))

(require 'flymake)

(defun remove-dos-eol ()
  "Removes the disturbing '^M' showing up in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

