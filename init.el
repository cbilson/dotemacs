
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
                            starter-kit-js idle-highlight-mode))
    (when (not (package-installed-p p))
      (package-install p))))

(setq vendor-directory (concat user-emacs-directory "vendor"))
(add-to-list 'load-path vendor-directory)

(let ((customizations-directory (concat user-emacs-directory "customizations")))
  (progn 
    (add-to-list 'load-path customizations-directory)
    (mapc 'load (directory-files customizations-directory nil ".*el$"))))

(put 'narrow-to-region 'disabled nil)

(put 'set-goal-column 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(python-indent-offset 2)
 '(tab-width 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
