(defun start-android-emulator ()
  (andinteractive)
  (shell-command "emulator -avd NexusOne &" "*emulator*"))

(defun install-robbie ()
  (interactive)
  (shell-command "lein cljsbuild once && ant debug install &" "*robbie*"))

(defun run-robbie ()
  (interactive)
  (let* ((project-root (locate-dominating-file default-directory "project.clj"))
         (cmd (format "cd %s && lein cljsbuild once && ant debug install && adb logcat &" project-root)))
    (shell-command cmd "*robbie*")))

(defun android-logcat ()
  (interactive)
  (shell-command "adb logcat &" "*adb logcat*"))
