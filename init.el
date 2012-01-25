
(require 'package)
(setq vendor-directory (concat user-emacs-directory "vendor"))
(add-to-list 'load-path vendor-directory)

(add-to-list 'package-archives
               '("marmalade" . "http://marmalade-repo.org/packages/") t)

;; (when (not package-archive-contents)
;;   (package-refresh-contents))

(defvar my-packages '(starter-kit
                      starter-kit-lisp
                      starter-kit-eshell
                      starter-kit-js
                      starter-kit-bindings
                      clojure-mode
                      clojure-test-mode
                      csharp-mode
                      ctags
                      dired-single
                      durendal
                      elisp-slime-nav
                      find-file-in-git-repo
                      flymake-coffee
                      gist
                      ghc
                      gnuplot
                      graphviz-dot-mode
                      haskell-mode
                      magit
                      markdown-mode
                      marmalade
                      midje-mode
                      nose
                      ntcmd
                      org
                      python-mode
                      scala-mode
                      slime
                      slime-repl
                      tuareg
                      w32-browser
                      yas-jit
                      yasnippet
                      yasnippet-bundle))

(defun install-my-packages ()
  (dolist (package my-packages)
  (when (not (package-installed-p package))
    (package-install package))))

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
