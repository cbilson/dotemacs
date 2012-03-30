
(require 'package)
(setq vendor-directory (concat user-emacs-directory "vendor"))
(add-to-list 'load-path vendor-directory)
(add-to-list 'package-archives
               '("marmalade" . "http://marmalade-repo.org/packages/") t)

(package-initialize)

(let ((customizations-directory (concat user-emacs-directory "customizations")))
  (progn 
    (add-to-list 'load-path customizations-directory)
    (mapc 'load (directory-files customizations-directory nil ".*el$"))))

(set-face-foreground 'vertical-border
                     (face-attribute 'vertical-border :background))

(add-hook 'eshell-mode-hook
          '(lambda () (fmakunbound 'eshell/sudo)
             (fmakunbound 'eshell/su)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-alphabetical-lists t)
 '(org-modules (quote (org-bbdb org-bibtex org-docview org-gnus org-info org-jsinfo org-habit org-inlinetask org-irc org-mac-message org-mew org-mhe org-rmail org-special-blocks org-vm org-wl org-w3m)))
 '(python-indent-offset 2)
 '(tab-width 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
