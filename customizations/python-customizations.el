;;
;; python stuff
;;
(add-hook 'python-mode-hook
          (lambda ()
            (require 'nose)
            (local-set-key "\C-ca" 'nosetests-all)
            (local-set-key "\C-cm" 'nosetests-module)
            (local-set-key "\C-c." 'nosetests-one)
            (local-set-key "\C-cpa" 'nosetests-pdb-all)
            (local-set-key "\C-cpm" 'nosetests-pdb-module)
            (local-set-key "\C-cp." 'nosetests-pdb-one)

            (require 'yasnippet)
            (yas/minor-mode)

            (if (eq system-type 'darwin)
                (setq python-shell-interpreter "/Library/Frameworks/Python.framework/Versions/2.7/bin/python"
                      python-shell-interpreter-args "-i"))))

