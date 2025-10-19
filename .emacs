(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay nil)
 '(line-spacing 0.4)
 '(lsp-keymap-prefix "s-j")
 '(lsp-semantic-tokens-enable t)
 '(package-selected-packages
   '(airplay company deadgrep elpy flycheck fsharp-mode lsp-mode
             lsp-treemacs lsp-ui magit persistent-scratch powerline
             request-deferred rust-mode yasnippet))
 '(scroll-step 1))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(set-frame-font "-outline-Consolas-regular-normal-normal-mono-17-*-*-*-c-*-iso8859-1")

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(column-number-mode 1)
(load-theme 'deeper-blue)

(require 'lsp)
(ido-mode)

(setq w32-pass-lwindow-to-system nil)
(setq w32-lwindow-modifier 'super)
(w32-register-hot-key [s-j])
;;(w32-register-hot-key [s-y])
(require 'yasnippet)
(global-set-key (kbd "C-c l") 'goto-line)

(defun prog-mode-hook-display-line-numbers ()
  (display-line-numbers-mode 1))
(defun prog-mode-hook-bind-yas-expand-key ()
  (keymap-local-set "C-M-y" 'yas-expand))
(defun prog-mode-no-tabs-mode ()
  (setq indent-tabs-mode nil))
(defun prog-mode-magit-status-keybinding ()
  (local-set-key (kbd "M-S-g") 'magit-status))
(defun prog-mode-hook-bind-treemacs-symbols ()
  (local-set-key (kbd "s-j s") 'lsp-treemacs-symbols))
(defun prog-mode-hook ()
  (local-set-key (kbd "s-j s") 'lsp-treemacs-symbols))
  
(add-hook 'prog-mode-hook 'prog-mode-no-tabs-mode)
(add-hook 'prog-mode-hook 'prog-mode-magit-status-keybinding)
(add-hook 'prog-mode-hook 'prog-mode-hook-display-line-numbers)
(add-hook 'prog-mode-hook 'prog-mode-hook-bind-yas-expand-key)
(add-hook 'prog-mode-hook 'yas-minor-mode)
(add-hook 'prog-mode-hook 'prog-mode-hook-bind-treemacs-symbols)

(add-hook 'dired-mode-hook 'prog-mode-magit-status-keybinding)
(defun csharp-mode-hook-lsp-mode-enable ()
  (lsp-mode))

(add-hook 'csharp-mode-hook 'csharp-mode-hook-lsp-mode-enable)

(defun compilation-mode-hook-enable-output-scrolling ()
  (setq compilation-scroll-output t))

(add-hook 'compilation-mode-hook 'compilation-mode-hook-enable-output-scrolling)
(set-face-background 'mode-line-active "blue")
(set-face-foreground 'mode-line-active "white")
(set-face-foreground 'mode-line-buffer-id "white")
(setq find-program "c:/progra~1/git/usr/bin/find.exe")
(windmove-default-keybindings)

(global-set-key (kbd "<f10>") (lambda ()
                                (interactive)
                                (switch-to-buffer "shell")))
(defun eshell-keybindings ()
  (local-set-key (kbd "<up>") 'previous-line)
  (local-set-key (kbd "<down>") 'next-line))

(add-hook 'eshell-mode-hook 'eshell-keybindings)
(keymap-global-set "M-o" 'other-window)

(persistent-scratch-setup-default)
(add-to-list 'process-coding-system-alist '("rustfmt" . utf-8-unix))

(defun deadgrep-here (search-term)
  "Start deadgrep from the current working directory."
  (interactive (list (deadgrep--read-search-term)))
  (deadgrep search-term default-directory))

(defun find-dot-emacs ()
  (interactive)
  (find-file "~/.emacs"))

(global-set-key (kbd "C-c e") 'find-dot-emacs)

(global-set-key (kbd "C-C f d") (lambda ()
                                  (interactive)
                                  (dired "C:/users/neals/downloads")))

(global-set-key (kbd "M-C-G") 'deadgrep-here)
(add-hook 'dired-mode-hook (lambda ()
                             (keymap-local-set "M-G" 'deadgrep-here)))

(global-set-key (kbd "C-M-d") (lambda ()
                                (interactive)
                                (dired default-directory)))

(define-key yas-minor-mode-map (kbd "SPC") yas-maybe-expand)

(global-set-key (kbd "C-c p l") 'package-list-packages)

(global-set-key (kbd "<f9>") (lambda ()
                               (interactive)
                               (switch-to-buffer "*scratch*")))

(defun nsd-help-for-identifier-at-point ()
  (interactive)
  (other-window-prefix)
  (if (functionp (intern (symbol-under-or-before-point)))
      (describe-function (intern (symbol-under-or-before-point)))
    (describe-variable (intern (symbol-under-or-before-point)))))
(global-set-key (kbd "<f1>") 'nsd-help-for-identifier-at-point)
  

