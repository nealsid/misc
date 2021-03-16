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
 '(custom-safe-themes
   '("0fffa9669425ff140ff2ae8568c7719705ef33b7a927a0ba7c5e2ffcfac09b75" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" default))
 '(display-buffer-reuse-frames t)
 '(indent-tabs-mode nil)
 '(js2-basic-offset 2)
 '(ns-command-modifier 'meta)
 '(package-selected-packages
   '(lsp-sourcekit lsp-mode solarized-theme js2-refactor js2-mode flycheck tuareg swift-mode magit find-file-in-repository ess ensime apples-mode))
 '(safe-local-variable-values
   '((eval add-hook 'prog-mode-hook
           (lambda nil
             (whitespace-mode 1))
           (not :APPEND)
           :BUFFER-LOCAL)
     (tab-always-indent . t)
     (swift-basic-offset . 2)
     (whitespace-style face lines indentation:space)
     (swift-syntax-check-fn . swift-project-swift-syntax-check)
     (swift-find-executable-fn . swift-project-executable-find)
     (eval let*
           ((x
             (dir-locals-find-file default-directory))
            (this-directory
             (if
                 (listp x)
                 (car x)
               (file-name-directory x))))
           (unless
               (or
                (featurep 'swift-project-settings)
                (and
                 (fboundp 'tramp-tramp-file-p)
                 (tramp-tramp-file-p this-directory)))
             (add-to-list 'load-path
                          (concat this-directory "utils")
                          :append)
             (let
                 ((swift-project-directory this-directory))
               (require 'swift-project-settings)))
           (set
            (make-local-variable 'swift-project-directory)
            this-directory))))
 '(scroll-bar-mode nil)
 '(show-trailing-whitespace t)
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
  (find-file "/Users/nealsid/.emacs"))

(global-set-key (kbd "C-c e") 'find-dot-emacs)

(load "/Users/nealsid/src/github/ejj/ejj.el")

(load-theme 'deeper-blue)
(add-to-list 'initial-frame-alist '(font . "-*-Consolas-normal-normal-normal-*-16-*-*-*-m-0-iso10646-1"))

(shell (generate-new-buffer "shell"))
(shell (generate-new-buffer "build"))

(global-set-key (kbd "M-<f10>") (lambda ()
                                  (interactive)
                                  (switch-to-buffer "shell")))

(global-set-key (kbd "M-S-<f10>") (lambda ()
                                    (interactive)
                                    (switch-to-buffer "build")))
