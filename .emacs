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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-buffer-reuse-frames t)
 '(js2-basic-offset 2)
 '(ns-command-modifier (quote meta))
 '(package-selected-packages
   (quote
    (lsp-ui flycheck lsp-sourcekit spinner lsp-mode nasm-mode xcscope web-mode tuareg swift-mode magit find-file-in-repository ess ensime apples-mode)))
 '(safe-local-variable-values
   (quote
    ((eval add-hook
	   (quote prog-mode-hook)
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
		(featurep
		 (quote swift-project-settings))
		(and
		 (fboundp
		  (quote tramp-tramp-file-p))
		 (tramp-tramp-file-p this-directory)))
	     (add-to-list
	      (quote load-path)
	      (concat this-directory "utils")
	      :append)
	     (let
		 ((swift-project-directory this-directory))
	       (require
		(quote swift-project-settings))))
	   (set
	    (make-local-variable
	     (quote swift-project-directory))
	    this-directory)))))
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

(eval-after-load 'lsp-mode
  (progn
    (require 'lsp-sourcekit)
    (setq lsp-sourcekit-executable
          "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp")))
