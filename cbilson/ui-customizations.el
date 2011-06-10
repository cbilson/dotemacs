
(if window-system
    (progn
      (require 'color-theme)
      (add-to-list 'load-path (concat dotfiles-dir "cbilson/themes"))
      (load (concat dotfiles-dir "cbilson/themes/color-theme-library"))
      (load (concat dotfiles-dir "cbilson/themes/color-theme-solarize"))
      ;(color-theme-arjen)
      ;(color-theme-clarity)
      ;(color-theme-dark-blue2)
      ;(color-theme-sunburst)
      ;(color-theme-solarized 'dark)
      ;(color-theme-solarized 'light)
      (color-theme-blackboard)
      ))

;; stolen from https://github.com/nimms/emacs-starter-kit/commit/b43f4f7e5f885c6f2c804e6221fe5c99db4908db
(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                           nil
                                         'fullboth)))

(global-set-key [(meta return)] 'toggle-fullscreen)
