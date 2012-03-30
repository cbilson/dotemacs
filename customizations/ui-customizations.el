
(require 'color-theme-tomorrow-night)

;; stolen from https://github.com/nimms/emacs-starter-kit/commit/b43f4f7e5f885c6f2c804e6221fe5c99db4908db
(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                           nil
                                         'fullboth)))


