
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

(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories (concat user-emacs-directory "auto-complete-dict"))

(require 'projectile)
(setq projectile-ctags-command-line "/usr/local/bin/ctags -R %s")

(setq ac-auto-show-menu t
      ac-auto-start t
      ac-dwim t
      ac-candidate-limit ac-menu-height
      ac-quick-help-delay .25
      ac-disable-faces nil)

(set-default 'ac-sources
             '(;;ac-source-semantic-raw
               ac-source-yasnippet
               ac-source-dictionary
               ac-source-abbrev
               ac-source-words-in-buffer
               ac-source-words-in-same-mode-buffers
               ac-source-imenu
               ac-source-files-in-current-dir
               ac-source-filename))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector [zenburn-bg zenburn-red zenburn-green zenburn-yellow zenburn-blue zenburn-magenta zenburn-cyan zenburn-fg])
 '(custom-enabled-themes (quote (twilight)))
 '(custom-safe-themes (quote ("8cf464f2062ca1e148290b594e67c859f745c96e" "4711e8fe63ef13accc884c59469067d2f497e79c" "e254937cba0f82c2d9eb3189a60748df9e486522" "1440d751f5ef51f9245f8910113daee99848e2c0" "485737acc3bedc0318a567f1c0f5e7ed2dfde3fb" default)))
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
