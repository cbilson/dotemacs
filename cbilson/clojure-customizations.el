;;
;; clojure stuff
;;
(add-to-list 'load-path (concat dotfiles-dir "cbilson/midje"))

(require 'slime)
(require 'clojure-mode)
(require 'clojure-test-mode)
(require 'midje-mode)

(add-hook 'clojure-mode-hook
          '(lambda ()
             (define-key clojure-mode-map (kbd "C-c c") 'comment-region)
             (define-key clojure-mode-map (kbd "C-c u") 'uncomment-region)
             (define-key clojure-mode-map (kbd "C-S-w") 'mark-sexp)
             (define-key clojure-test-mode-map (kbd "C-1") 'midje-check-fact)
             (define-key clojure-test-mode-map (kbd "C-2") 'midje-recheck-last-fact-checked)))

(add-hook 'clojure-mode-hook 'midje-mode)

(defvar clojure-jar-file 
  (cond ((file-exists-p "/home/cbilson/src/clojure/clojure/clojure.jar") "/home/cbilson/src/clojure/clojure/clojure.jar")
        ((file-exists-p "C:/Tools/clojure.jar") "C:/Tools/clojure.jar")))

(defvar clojure-src-dir
  (cond ((file-exists-p "/home/cbilson/src/clojure") "/home/src/clojure")
        ((file-exists-p "C:/projects/personal/clojure") "C:/projects/personal/clojure")))

(defvar clojure-scratch-project-dir
  (cond ((file-exists-p "/home/cbilson/src/clojure/scratch") "/home/cbilson/src/clojure/scratch")
        ((file-exists-p "C:/projects/personal/clojure/scratch") "C:/projects/personal/clojure/scratch")))

(setq clojure-command (concat "java -cp "
                              clojure-jar-file
                              " clojure.main"))

(setq inferior-lisp-program clojure-command)

(add-hook 'clojure-mode-hook 'paredit-mode)
(autoload 'clojure-test-mode "clojure-test-mode" "Clojure test mode" t)
(add-hook 'clojure-mode-hook
          (lambda () (save-excursion
                       (goto-char (point-min))
                       (if (search-forward "(deftest" nil t)
                           (clojure-test-mode)))))

(add-hook 'clojure-mode-hook 'esk-remove-elc-on-save)

(add-hook 'slime-mode-hook (lambda () (setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)))
(add-hook 'slime-repl-mode-hook 'clojure-mode-font-lock-setup)

(defun sl4 ()
  "Make it easier to connect to slime"
  (interactive)
  (slime-connect "localhost" 4005))

(defun lein-swank ()
  (interactive)
  (let* ((project-file (locate-dominating-file default-directory "project.clj"))
         (root (if (not project-file)
                   (concat clojure-scratch-project-dir "/project.clj")
                    project-file)))
    (when (not root)
      (error "Not in a Leiningen project."))
    ;; you can customize slime-port using .dir-locals.el
    (shell-command (format "cd %s && lein swank %s &" root slime-port)
                   "*lein-swank*")
    (set-process-filter (get-buffer-process "*lein-swank*")
                        (lambda (process output)
                          (when (string-match "Connection opened on" output)
                            (slime-connect "localhost" slime-port)
                            (set-process-filter process nil))))
    (message "Starting swank server...")))

(defun lein-scratch ()
  (interactive)
  (cd clojure-scratch-project-dir)
  (lein-swank))

