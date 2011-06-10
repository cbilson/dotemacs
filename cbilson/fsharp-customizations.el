;;
;; fsharp-mode
;;
(add-to-list 'load-path (concat dotfiles-dir "cbilson/fsharp"))

(require 'fsharp)
(setq auto-mode-alist (cons '("\\.fs[iylx]?$" . fsharp-mode) auto-mode-alist))
(autoload 'fsharp-mode "fsharp" "Major mode for editing F# code." t)
(autoload 'run-fsharp "inf-fsharp" "Run an inferior F# process." t)
(set 'fsharp-indent-offset 3)

(setq inferior-fsharp-program
      (if (eq system-type 'windows-nt)
          "\"C:\\Program Files\\Microsoft F#\\v4.0\\fsi.exe\""
        "~/bin/fsi.exe --readline-"))

(setq fsharp-compiler
      (if (eq system-type 'windows-nt)
          "\"C:\\Program Files\\Microsoft F#\\v4.0\\fsc.exe\""
        "~/bin/fsc.exe --resident"))

