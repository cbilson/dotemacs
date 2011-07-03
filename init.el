
(require 'package)
(add-to-list 'package-archives
               '("marmalade" . "http://marmalade-repo.org/packages/") t)

(setq slime-net-coding-system 'utf-8-unix)

(set-face-foreground 'vertical-border
                     (face-attribute 'vertical-border :background))

(add-hook 'eshell-mode-hook
          '(lambda () (fmakunbound 'eshell/sudo)
             (fmakunbound 'eshell/su)))

(defun package-updates ()
  (interactive)
  (package-refresh-contents)
  (dolist (p '(clojure-mode slime slime-repl clojure-test-mode magit
                            paredit starter-kit starter-kit-lisp
                            scpaste idle-highlight-mode))
    (when (not (package-installed-p p))
      (package-install p))))

(let ((customizations-directory (concat user-emacs-directory "customizations")))
  (progn 
    (add-to-list 'load-path customizations-directory)
     (mapc 'load (directory-files customizations-directory nil ".*el$"))))
