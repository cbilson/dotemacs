;;
;; powershell mode
;;
(autoload 'powershell-mode "powershell-mode" "Major mode for editing powershell scripts." t)
(add-to-list 'auto-mode-alist '("\\.ps1$" . powershell-mode))
(add-to-list 'auto-mode-alist '("\\.psm1$" . powershell-mode))

(setq powershell-indent 2)
