;;
;; fsharp-mode
;;
(add-to-list 'load-path (concat vendor-directory "fsharp"))
(autoload 'fsharp-mode "fsharp" "Major mode for editing F# code." t)
(autoload 'run-fsharp "inf-fsharp" "Run an inferior F# process." t)
(add-to-list 'auto-mode-alist '("\\.fs$" . fsharp))
(add-to-list 'auto-mode-alist '("\\.fsx$" . fsharp))
(add-to-list 'auto-mode-alist '("\\.fsi$" . fsharp))

(eval-after-load "fsharp"
  '(progn 
     (set 'fsharp-indent-offset 3)
     (setq inferior-fsharp-program
           (if (eq system-type 'windows-nt)
               "\"C:\\Program Files\\Microsoft F#\\v4.0\\fsi.exe\""
             "~/bin/fsi.exe --readline-"))
     (setq fsharp-compiler
           (if (eq system-type 'windows-nt)
               "\"C:\\Program Files\\Microsoft F#\\v4.0\\fsc.exe\""
             "~/bin/fsc.exe --resident"))))

