; .emacs

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

(ido-mode)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(unless (package-installed-p 'magit)
  (package-refresh-contents) (package-install 'magit))

(setq grep-command "grep -ri -nH -e ")

(global-set-key (kbd "M-F") 'ffap)
(global-set-key (kbd "M-+") 'text-scale-increase)
(global-set-key (kbd "M-_") 'text-scale-decrease)

(setq exec-path (append exec-path (list "/Users/nealsid/bin" )))

(c-set-offset 'innamespace 0)
(defconst my-cc-style
  '("cc-mode"
    (c-offsets-alist . ((innamespace . [0])))))
(c-add-style "my-cc-mode" my-cc-style)

(setq display-buffer-reuse-frames t)
(windmove-default-keybindings)

(require 'cc-mode)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-buffer-reuse-frames t)
 '(js2-basic-offset 2)
 '(ns-command-modifier (quote meta))
 '(scroll-bar-mode nil)
 '(show-trailing-whitespace t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun initialize-java-class-list ()
  (with-temp-buffer
    (insert-file-contents "/Users/nealsid/jre-classes.txt")
    (setq java-classes (split-string (buffer-string) "\n"))))

(defun add-java-class (use-killring)
  (interactive
   (cond
    ((equal current-prefix-arg '(4))
     (list t))
    (t (list nil))))

  (insert (ido-completing-read "class> " java-classes nil nil (if use-killring (current-kill 0) nil))))

(initialize-java-class-list)
(global-set-key (kbd "M-J") 'add-java-class)
(server-start)

(defun find-dot-emacs ()
  (interactive)
  (find-file "/Users/nealsid/.emacs"))

(global-set-key (kbd "C-c e") 'find-dot-emacs)

(defun add-try-catch (catch-clause-count)
  (interactive
   (cond
    ((numberp current-prefix-arg)
     (list current-prefix-arg))
    (t (list 1))))
  (save-excursion
    (goto-char (region-beginning))
    (insert "try {
"))
  (goto-char (region-end))
  (insert (apply 'concat (make-list catch-clause-count "} catch () {
")))
  (insert "}
")
  (save-excursion
    (indent-region (region-beginning) (region-end))))

(global-set-key (kbd "C-c j t") 'add-try-catch)
