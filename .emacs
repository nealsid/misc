; .emacs

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

(ido-mode)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
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
(add-hook 'prog-mode-hook (lambda ()
                            (setq show-trailing-whitespace t)))
(add-to-list 'auto-mode-alist '("\\.tcc\\'" . c++-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-message-face 'default)
 '(custom-enabled-themes '(clarity))
 '(custom-safe-themes
   '("4c8372c68b3eab14516b6ab8233de2f9e0ecac01aaa859e547f902d27310c0c3" "6213a6047cc19f580c37ef3f6d47fd5a55ebdf9b5590475d8f7a6aecd79a1cc0" "1a094b79734450a146b0c43afb6c669045d7a8a5c28bc0210aba28d36f85d86f" "5516001c13a43f1f5be2d7df8035445f8d7c73179f637e40c1503afb184d98f2" "ef92efb0f9178b4a1130ffae1571d71983d123f84acd6565e09cb58ca71982c9" "6e03b7f86fcca5ce4e63cda5cd0da592973e30b5c5edf198eddf51db7a12b832" "67b11ee5d10f1b5f7638035d1a38f77bca5797b5f5b21d16a20b5f0452cbeb46" "3fe4861111710e42230627f38ebb8f966391eadefb8b809f4bfb8340a4e85529" "58ef0d9d877d9b1c19183f4215de272fa2938744f077e3a69ea12b8b6e852155" "d9c957b0e8d2d7f1bbb781fc729e06598017ade2d0c18611e5abbdde0f65d981" "1319bfcf42cefb12fad274e5763d0eae0d0401cddc9738bdf220fe89447e9292" "8c867d38498653a86c1071714502d01eabb8d8c9ec976a7ddc4d04c23a991a97" "0c5204945ca5cdf119390fe7f0b375e8d921e92076b416f6615bbe1bd5d80c88" "39a854967792547c704cbff8ad4f97429f77dfcf7b3b4d2a62679ecd34b608da" "10551f0a24d0ac97a109f02178e9e34b448ee12a52357911cf3362a6b249cae6" "9df3ad3ca8a700784a2fbcfcdaca5da3b6149da52212f22d3a10f48da88581c3" "34c1b320a9d35318ca01660d533eee299d538f5a0c505c076511493b0a4f093d" "294c4b6a955149c93945f901a284140df29963a57939e9ed2fc4ad79b3605080" "ff8be9ed2696bf7bc999423d909a603cb23a9525bb43135c0d256b0b9377c958" default))
 '(display-buffer-reuse-frames t)
 '(global-auto-revert-mode t)
 '(indent-tabs-mode nil)
 '(line-spacing 0.4)
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(color-theme-modern dirtree elisp-autofmt ggtags wanderlust dtrace-script-mode cmake-font-lock realgud-lldb slime dash lsp-sourcekit lsp-mode solarized-theme js2-refactor js2-mode flycheck tuareg swift-mo de magit find-file-in-repository ess ensime apples-mode))
 '(scroll-bar-mode nil)
 '(scroll-conservatively 101)
 '(show-paren-mode t)
 '(simpleproj-minor-mode-hook nil)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(server-start)

(defun find-dot-emacs ()
  (interactive)
  (find-file "/home/nealsid/.emacs"))

(global-set-key (kbd "C-c e") 'find-dot-emacs)

(column-number-mode)

(load-theme 'deeper-blue)
(add-to-list 'initial-frame-alist '(font . "-*-Consolas-normal-normal-normal-*-12-*-*-*-m-0-iso10646-1"))
(set-face-font 'completions-common-part "-*-Consolas-normal-normal-normal-*-12-*-*-*-m-0-iso10646-1")
(shell (generate-new-buffer "shell"))
(shell (generate-new-buffer "build"))

(global-set-key (kbd "M-<f10>") (lambda ()
                                  (interactive)
                                  (switch-to-buffer "shell")))

(global-set-key (kbd "M-S-<f10>") (lambda ()
                                    (interactive)
                                    (switch-to-buffer "build")))

(global-set-key (kbd "M-N") 'next-error)
(global-set-key (kbd "M-P") 'previous-error)
(show-paren-mode t)

(setq backup-directory-alist nil)
(add-to-list 'backup-directory-alist (cons "." "/home/nealsid/.emacs.d/backup"))

(defun compile-no-command ()
  (interactive)
  (let ((compilation-read-command nil))
    (compile compile-command)))

(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (font-lock-remove-keywords nil
                                       '((lisp--match-hidden-arg
                                          (0 '(face font-lock-warning-face
                                                    help-echo
                                                    "Easy to misread; consider moving the element to the next line")
                                             prepend))))))

(defun dired-add-keybinding-to-eval-marked-files ()
  (keymap-set dired-mode-map (kbd "E") 'nsd-dired-load-marked-files))

(defun nsd-dired-load-marked-files ()
  (interactive)
  (let ((files-loaded
         (cl-loop for x in (dired-get-marked-files)
           for file-loaded = nil
           do (condition-case x
                  (progn
                    (load-file x)
                    (setq file-loaded t))
                (error x
                       (message "Error: %s %s" (car x) (cdr x))
                       (setq file-loaded nil)))
           when file-loaded collect x)))
    (mapc (lambda (file-without-error)
            (dired-goto-file file-without-error)
            (dired-unmark 1))
          files-loaded)))

  (let ((marked-files (dired-get-marked-files)))
    (mapcar (lambda (file-name)
              (condition-case x
                  (load-file file-name)
                (error
                 (message "%s" (cdr x))
                 (push failed-files file-name))))
            (dired-get-marked-files))
    (dired-unmark-all-marks)
    (message "Failed files: %s" failed-files)))

(add-hook 'dired-mode-hook 'dired-add-keybinding-to-eval-marked-files)
