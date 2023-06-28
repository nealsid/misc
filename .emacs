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
 '(custom-enabled-themes '(manoj-dark))
 '(display-buffer-reuse-frames t)
 '(global-auto-revert-mode t)
 '(indent-tabs-mode nil)
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(elisp-autofmt ggtags wanderlust dtrace-script-mode cmake-font-lock realgud-lldb slime dash lsp-sourcekit lsp-mode solarized-theme js2-refactor js2-mode flycheck tuareg swift-mo de magit find-file-in-repository ess ensime apples-mode))
 '(scroll-bar-mode nil)
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

(add-hook 'dired-mode-hook
          (lambda ()
            (keymap-set dired-mode-map (kbd "E")
                        (lambda ()
                          (interactive)
                          (mapcar 'load-file (dired-get-marked-files))))))
