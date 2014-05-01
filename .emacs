; .emacs

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; enable visual feedback on selections
;(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

;; always end a file with a newline
;(setq require-final-newline 'query)

;;; uncomment for CJK utf-8 support for non-Asian users
;; (require 'un-define)

(ido-mode)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(unless (package-installed-p 'scala-mode2)
  (package-refresh-contents) (package-install 'scala-mode2))
(unless (package-installed-p 'color-theme)
  (package-refresh-contents) (package-install 'color-theme))
(unless (package-installed-p 'color-theme-solarized)
  (package-refresh-contents) (package-install 'color-theme-solarized))
(unless (package-installed-p 'web-mode)
  (package-refresh-contents) (package-install 'web-mode))
(unless (package-installed-p 'ess)
  (package-refresh-contents) (package-install 'ess))
(unless (package-installed-p 'tuareg)
  (package-refresh-contents) (package-install 'tuareg))
(unless (package-installed-p 'framemove)
  (package-refresh-contents) (package-install 'framemove))
(unless (package-installed-p 'magit)
  (package-refresh-contents) (package-install 'magit))
(unless (package-installed-p 'pydoc-info)
  (package-refresh-contents) (package-install 'pydoc-info))
(unless (package-installed-p 'find-file-in-repository)
  (package-refresh-contents) (package-install 'find-file-in-repository))

(setq grep-command "grep -ri -nH -e ")

;;(set-face-foreground 'comint-highlight-prompt "lightblue")
(global-set-key (kbd "M-F") 'ffap)

(global-set-key (kbd "M-+") 'text-scale-increase)
(global-set-key (kbd "M-_") 'text-scale-decrease)

(setq exec-path (append exec-path (list "/Users/nealsid/bin" )))
(unless (package-installed-p 'ensime)
  (package-refresh-contents) (package-install 'ensime))
(unless (package-installed-p 'js2-mode)
  (package-refresh-contents) (package-install 'js2-mode))

(c-set-offset 'innamespace 0)
(defconst my-cc-style
  '("cc-mode"
    (c-offsets-alist . ((innamespace . [0])))))
(c-add-style "my-cc-mode" my-cc-style)

;; add pylookup to your loadpath, ex) ~/.emacs.d/pylookup
(setq pylookup-dir "/Users/nealsid/elisp/pylookup")
(add-to-list 'load-path pylookup-dir)

;; load pylookup when compile time
(eval-when-compile (require 'pylookup))

(setq display-buffer-reuse-frames t)
(require 'framemove)
(windmove-default-keybindings)
(setq framemove-hook-into-windmove t)

(require 'cc-mode)
(load-file "~/elisp/google-c-style.el")
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(scroll-bar-mode nil)
 '(show-trailing-whitespace t)
 '(tool-bar-mode nil)
 '(display-buffer-reuse-frames t)
 '(mac-command-modifier 'meta))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
