(add-to-list 'load-path (concat default-directory "/vendor/elib"))

(eval-after-load "java-mode"
  '(progn
      (require 'jde)))
