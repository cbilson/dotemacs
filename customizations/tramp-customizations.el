
; on Windows, I'll just use putty to define connections I want to use
(if (eq system-type 'windows-nt)
    (setq tramp-default-method "plinkx")
  (setq tramp-default-method "ssh"))
