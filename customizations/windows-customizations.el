;;(add-hook 'window-setup-hook 'toggle-fullscreen)

(if (eq system-type 'windows-nt)
    (progn 
      ;; without this emacs pauses a lot on window
      ;; see http://groups.google.com/group/gnu.emacs.help/browse_thread/thread/e3142de71f27b71b/72a40de2061f1a33?lnk=raot
      (setq w32-get-true-file-attributes nil)
      
      ;; to get a list of all the fonts: (insert (prin1-to-string (x-list-fonts "*")))
      (setq w32-enable-synthesized-fonts t)

      (set-default-font "-outline-Consolas-normal-r-normal-normal-*-*-*-*-c-*-iso8859-1")
      (set-face-font 'italic "-outline-Consolas-normal-italic-normal-mono-*-*-*-*-c-*-iso8859-1")
      (set-face-font 'bold "-outline-Consolas-bold-normal-normal-mono-*-*-*-*-c-*-iso8859-1")
      
      ;; (set-default-font "-outline-Envy Code R-normal-normal-normal-mono-*-*-*-*-c-*-iso10646-1")
      ;; (set-face-font 'italic "-outline-Envy Code R-normal-italic-normal-mono-*-*-*-*-c-*-iso10646-1")
      ;; (set-face-font 'bold "-outline-Envy Code R-bold-normal-normal-mono-*-*-*-*-c-*-iso10646-1")
      ;; (set-default-font "-outline-Inconsolata-normal-normal-normal-mono-*-*-*-*-c-*-iso10646-1"))
      ))

