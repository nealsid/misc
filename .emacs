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
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(compilation-message-face 'default)
 '(cua-global-mark-cursor-color "#689d6a")
 '(cua-normal-cursor-color "#7c6f64")
 '(cua-overwrite-cursor-color "#b57614")
 '(cua-read-only-cursor-color "#98971a")
 '(custom-enabled-themes '(manoj-dark))
 '(custom-safe-themes
   '("285d1bf306091644fb49993341e0ad8bafe57130d9981b680c1dbd974475c5c7" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "0fffa9669425ff140ff2ae8568c7719705ef33b7a927a0ba7c5e2ffcfac09b75" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" default))
 '(display-buffer-reuse-frames t)
 '(fci-rule-color "#ebdbb2")
 '(global-auto-revert-mode t)
 '(highlight-changes-colors '("#d3869b" "#8f3f71"))
 '(highlight-symbol-colors
   '("#ed94d1d49b5c" "#d6a6dca4af86" "#eb91bc26933d" "#e1bec426b1e5" "#e40eda899de8" "#ef29c40f9556" "#c667cd43b3ba"))
 '(highlight-symbol-foreground-color "#665c54")
 '(highlight-tail-colors
   '(("#ebdbb2" . 0)
     ("#c6c148" . 20)
     ("#82cc73" . 30)
     ("#5b919b" . 50)
     ("#e29a3f" . 60)
     ("#df6835" . 70)
     ("#f598a7" . 85)
     ("#ebdbb2" . 100)))
 '(hl-bg-colors
   '("#e29a3f" "#df6835" "#cf5130" "#f598a7" "#c2608f" "#5b919b" "#82cc73" "#c6c148"))
 '(hl-fg-colors
   '("#fbf1c7" "#fbf1c7" "#fbf1c7" "#fbf1c7" "#fbf1c7" "#fbf1c7" "#fbf1c7" "#fbf1c7"))
 '(hl-paren-colors '("#689d6a" "#b57614" "#076678" "#8f3f71" "#98971a"))
 '(indent-tabs-mode nil)
 '(js2-basic-offset 2)
 '(lsp-ui-doc-border "#665c54")
 '(nrepl-message-colors
   '("#9d0006" "#af3a03" "#b57614" "#747400" "#c6c148" "#004858" "#689d6a" "#d3869b" "#8f3f71"))
 '(ns-command-modifier 'meta)
 '(package-selected-packages
   '(wanderlust dtrace-script-mode cmake-font-lock realgud-lldb slime dash lsp-sourcekit lsp-mode solarized-theme js2-refactor js2-mode flycheck tuareg swift-mode magit find-file-in-repository ess ensime apples-mode))
 '(pos-tip-background-color "#ebdbb2")
 '(pos-tip-foreground-color "#665c54")
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
 '(show-paren-mode t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#98971a" "#ebdbb2" 0.2))
 '(term-default-bg-color "#fbf1c7")
 '(term-default-fg-color "#7c6f64")
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   '((20 . "#9d0006")
     (40 . "#ab334a550b62")
     (60 . "#b0db61140f75")
     (80 . "#b57614")
     (100 . "#ad02822e15d7")
     (120 . "#a85287c016d2")
     (140 . "#a3618d2917dc")
     (160 . "#9e26927018f5")
     (180 . "#98971a")
     (200 . "#8bd799a13aed")
     (220 . "#84859aa247c0")
     (240 . "#7c5c9ba253bb")
     (260 . "#731d9ca05f39")
     (280 . "#689d6a")
     (300 . "#4df186d970f8")
     (320 . "#3e5d7bc973bd")
     (340 . "#2af870f6763a")
     (360 . "#076678")))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   '(unspecified "#fbf1c7" "#ebdbb2" "#750000" "#9d0006" "#747400" "#98971a" "#8a5100" "#b57614" "#004858" "#076678" "#9f4d64" "#d3869b" "#2e7d33" "#689d6a" "#7c6f64" "#3c3836"))
 '(wl-smtp-authenticate-type "login")
 '(wl-smtp-connection-type 'ssl)
 '(xterm-color-names
   ["#ebdbb2" "#9d0006" "#98971a" "#b57614" "#076678" "#d3869b" "#689d6a" "#32302f"])
 '(xterm-color-names-bright
   ["#fbf1c7" "#af3a03" "#a89984" "#3c3836" "#7c6f64" "#8f3f71" "#665c54" "#282828"]))

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
(set-face-font 'completions-common-part "-*-Consolas-normal-normal-normal-*-16-*-*-*-m-0-iso10646-1")
(shell (generate-new-buffer "shell"))
(shell (generate-new-buffer "build"))

(load "/Users/nealsid/src/github/llvm-project/llvm/utils/emacs/emacs.el")

(global-set-key (kbd "M-<f10>") (lambda ()
                                  (interactive)
                                  (switch-to-buffer "shell")))

(global-set-key (kbd "M-S-<f10>") (lambda ()
                                    (interactive)
                                    (switch-to-buffer "build")))

(global-set-key (kbd "M-N") 'next-error)
(global-set-key (kbd "M-P") 'previous-error)
(show-paren-mode t)

(load "/Users/nealsid/src/github/ecc/ecc.el")
(setq llvm-project (make-project "/Users/nealsid/src/github/llvm-project"
                                 "/Users/nealsid/src/github/llvm-project-build"))

(setq backup-directory-alist nil)
(add-to-list 'backup-directory-alist (cons "." "/Users/nealsid/.emacs.d/backup"))

(defun compile-no-command ()
  (interactive)
  (let ((compilation-read-command nil))
    (compile compile-command)))
