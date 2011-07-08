
(add-to-list 'load-path (concat vendor-directory "/yas"))

(eval-after-load "yasnippet"
  '(progn 
     (setq yas/root-directory (concat vendor-directory "/yas/snippets"))
     (yas/load-directory yas/root-directory)))
