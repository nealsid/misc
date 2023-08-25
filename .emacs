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
(package-refresh-contents t)
(unless (package-installed-p 'magit)
  (package-install 'magit))

(setq grep-command "grep -ri -nH -e ")

(global-set-key (kbd "M-F") 'ffap)
(global-set-key (kbd "M-+") 'text-scale-increase)
(global-set-key (kbd "M-_") 'text-scale-decrease)

(push "/Users/nealsid/bin" exec-path)

(windmove-default-keybindings)

(require 'cc-mode)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'prog-mode-hook (lambda ()
                            (setq show-trailing-whitespace t)))
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-to-list 'auto-mode-alist '("\\.tcc\\'" . c++-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-message-face 'default)
 '(custom-enabled-themes '(clarity))
 '(custom-safe-themes
   '("4c8372c68b3eab14516b6ab8233de2f9e0ecac01aaa859e547f902d27310c0c3"
     "6213a6047cc19f580c37ef3f6d47fd5a55ebdf9b5590475d8f7a6aecd79a1cc0"
     "1a094b79734450a146b0c43afb6c669045d7a8a5c28bc0210aba28d36f85d86f"
     "5516001c13a43f1f5be2d7df8035445f8d7c73179f637e40c1503afb184d98f2"
     "ef92efb0f9178b4a1130ffae1571d71983d123f84acd6565e09cb58ca71982c9"
     "6e03b7f86fcca5ce4e63cda5cd0da592973e30b5c5edf198eddf51db7a12b832"
     "67b11ee5d10f1b5f7638035d1a38f77bca5797b5f5b21d16a20b5f0452cbeb46"
     "3fe4861111710e42230627f38ebb8f966391eadefb8b809f4bfb8340a4e85529"
     "58ef0d9d877d9b1c19183f4215de272fa2938744f077e3a69ea12b8b6e852155"
     "d9c957b0e8d2d7f1bbb781fc729e06598017ade2d0c18611e5abbdde0f65d981"
     "1319bfcf42cefb12fad274e5763d0eae0d0401cddc9738bdf220fe89447e9292"
     "8c867d38498653a86c1071714502d01eabb8d8c9ec976a7ddc4d04c23a991a97"
     "0c5204945ca5cdf119390fe7f0b375e8d921e92076b416f6615bbe1bd5d80c88"
     "39a854967792547c704cbff8ad4f97429f77dfcf7b3b4d2a62679ecd34b608da"
     "10551f0a24d0ac97a109f02178e9e34b448ee12a52357911cf3362a6b249cae6"
     "9df3ad3ca8a700784a2fbcfcdaca5da3b6149da52212f22d3a10f48da88581c3"
     "34c1b320a9d35318ca01660d533eee299d538f5a0c505c076511493b0a4f093d"
     "294c4b6a955149c93945f901a284140df29963a57939e9ed2fc4ad79b3605080"
     "ff8be9ed2696bf7bc999423d909a603cb23a9525bb43135c0d256b0b9377c958"
     default))
 '(display-buffer-reuse-frames t)
 '(find-file-visit-truename t)
 '(global-auto-revert-mode t)
 '(indent-tabs-mode nil)
 '(line-spacing 0.4)
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(simpleproj ## rainbow-delimiters helm paredit color-theme-modern
                dirtree elisp-autofmt ggtags wanderlust
                dtrace-script-mode cmake-font-lock realgud-lldb slime
                dash lsp-sourcekit lsp-mode solarized-theme
                js2-refactor js2-mode flycheck tuareg swift-mo de
                magit find-file-in-repository ess ensime apples-mode))
 '(scroll-bar-mode nil)
 '(scroll-conservatively 101)
 '(send-mail-function 'smtpmail-send-it)
 '(show-paren-mode t)
 '(simpleproj-minor-mode-hook nil)
 '(smtpmail-servers-requiring-authorization "smtp.gmail.com")
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 465)
 '(smtpmail-stream-type 'ssl)
 '(tool-bar-mode nil)
 '(vc-follow-symlinks nil)
 '(warning-suppress-types '((comp))))

(server-start)

(defun find-dot-emacs ()
  (interactive)
  (find-file "/home/nealsid/.emacs"))

(global-set-key (kbd "C-c e") 'find-dot-emacs)

(column-number-mode)

(load-theme 'deeper-blue)
(add-to-list 'initial-frame-alist '(font . "-*-Consolas-normal-normal-normal-*-28-*-*-*-m-0-iso10646-1"))
(set-face-font 'completions-common-part "-*-Consolas-normal-normal-normal-*-28-*-*-*-m-0-iso10646-1")
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
         (cl-loop for file-to-load in (dired-get-marked-files)
           for file-loaded = nil
           do (condition-case load-error
                  (setq file-loaded (load-file file-to-load))
                (error load-error
                       (message "Error: %s %s" (car load-error) (cdr load-error))))
           when file-loaded collect file-to-load)))
    (mapc (lambda (file-without-error)
            (dired-goto-file file-without-error)
            (dired-unmark 1))
          files-loaded)))

(add-hook 'dired-mode-hook 'dired-add-keybinding-to-eval-marked-files)
(add-hook 'prog-mode-hook 'which-function-mode)
(add-hook 'prog-mode-hook (lambda ()
                            (display-line-numbers-mode)
                            (hl-line-mode)
                            (setq hl-line-range-function 'nsd-hl-line-range-function)
                            (global-set-key (kbd "s-\\") 'nsd-obarray-based-completion-helm)))

(add-hook 'which-function-mode-hook (lambda ()
                                      (set-face-foreground 'which-func "White")))

(defun ert-run-tests-in-current-file ()
  (interactive)
  (ert '(satisfies (lambda (ert-test-case)
                     (string-equal (ert-test-file-name ert-test-case) (buffer-file-name))))))

(defun show-current-buffer-two-vertical-windows ()
  (interactive)
  (split-window-horizontally)
  (switch-to-buffer-other-window (current-buffer)))

(set-face-foreground 'font-lock-function-name-face "DeepSkyBlue1")
(set-face-foreground 'font-lock-doc-face "cornsilk1")
(set-face-foreground 'font-lock-keyword-face "DodgerBlue1")
(set-face-foreground 'font-lock-string-face "LightSlateBlue")
(set-face-foreground 'mode-line-buffer-id "White")
(set-face-foreground 'mode-line-active "White")
(set-face-background 'mode-line-active "MediumBlue")
(set-face-foreground 'line-number "gray30")

(defvar nsd-window-parameters
  '(window-parameters . ((no-other-window . t)
                         (no-delete-other-windows . t))))

(setq fit-window-to-buffer-horizontally t)
(setq window-resize-pixelwise nil)

(setq
 display-buffer-alist
 `(("\\*\\(?:[Hh]el[mp]\\|xref\\|info\\|ggtags-global\\)\\*" display-buffer-in-side-window
    (side . right) (window-width . fit-window-to-buffer)
    ,nsd-window-parameters)
   ("\\*\\(?:\\|grep\\|Completions\\)\\*"
    display-buffer-in-side-window
    (side . bottom) (slot . -1) (preserve-size . (nil . t))
    ,nsd-window-parameters)
   ("\\*\\(?:shell\\|compilation\\)\\*" display-buffer-in-side-window
    (side . bottom) (slot . 1) (preserve-size . (nil . t))
    ,nsd-window-parameters)))

(defun nsd-hl-line-range-function ()
  (save-excursion
    (let ((beg-pos (pos-bol))
          (end-pos (pos-eol)))
      (cond ((eq beg-pos end-pos) nil)
            (t (cons beg-pos end-pos))))))

(defun nsd-all-windows-with-parameter (parameter &optional value frame any minibuf)
  (let ((matching-windows (list))
        (window-walking-function (lambda (one-window)
                                   (let ((window-parameter-value (window-parameter one-window parameter)))
	                             (when (and window-parameter-value
		                                (or (not value) (equal value window-parameter-value)))
                                       (push one-window matching-windows))))))
    (walk-window-tree window-walking-function frame any minibuf)
    matching-windows))

(defvar mywm-side-window-last-shown-buffer
  '((top . nil)
   (right . nil)
   (bottom . nil)
   (left . nil))
  "Alist of side window locations to last buffer shown")

(defun mywm-toggle-windows-at-side (side-window-location)
  (let* ((window--sides-inhibit-check t)
         (side-windows (nsd-all-windows-with-parameter 'window-side side-window-location))
         (side-window-buffers (mapcar (lambda (side-window)
                                        (window-buffer side-window))
                                      side-windows)))

    (if side-windows
        (progn
          (setf (alist-get side-window-location mywm-side-window-last-shown-buffer)
                side-window-buffers)
          (mapc 'delete-window side-windows))
      (mapc 'display-buffer (alist-get side-window-location mywm-side-window-last-shown-buffer)))))

(global-set-key (kbd "C-s-r") (lambda () (interactive) (mywm-toggle-windows-at-side 'right)))
(global-set-key (kbd "C-s-b") (lambda () (interactive) (mywm-toggle-windows-at-side 'bottom)))
(global-set-key (kbd "C-s-l") (lambda () (interactive) (mywm-toggle-windows-at-side 'left)))
(global-set-key (kbd "C-s-t") (lambda () (interactive) (mywm-toggle-windows-at-side 'top)))
(global-set-key (kbd "C-s-f") (lambda () (interactive) (describe-function (function-called-at-point))))

(defvar side-window-cycle-percentages '(.1 .25 .5)
  "List of percentages of frame size to cycle through when resizing side windows.")

(defalias 'local 'let*)

(defun animated-window-resize (window delta &optional horizontal ignore pixelwise)
  "Resizes a window using window-resize, but does it in a line by line fashion for a sliding effect in the UI."
  (local ((step (/ delta (abs delta)))
          (resize-and-redisplay-fn (lambda (n)
                                     (window-resize window step horizontal ignore pixelwise)
                                     (redisplay))))
    (mapc resize-and-redisplay-fn (number-sequence step delta step))))

(defun cycle-side-window-sizes (side-window-location)
  "Change size (width or height, depending on the location) of side
windows in a manner which cycles through preset sizes (see
`side-window-cycle-percentages')"
  (let* ((window-to-resize (window-with-parameter 'window-side side-window-location))
               (horizontal (cond ((member side-window-location '(left right))
                                  t)
                                 (nil)))
                 (max-size (cond (horizontal (frame-width))
                                 ((frame-height))))
         (window-size-list (mapcar (lambda (x)
                                     (truncate (* x max-size)))
                                   side-window-cycle-percentages))
           (window-size-fn (cond (horizontal 'window-width)
                                 ('window-height)))
              (window-size (funcall window-size-fn window-to-resize))
                (next-size (or (cl-find-if (lambda (x) (< window-size x))
                                           window-size-list)
                               (car window-size-list)))
       (window-resize-args (list window-to-resize
                                 (- next-size window-size)
                                 horizontal)))
    (apply 'animated-window-resize window-resize-args)))

(setq nsd--obarray-entries-as-strings (list))

(defun nsd--update-obarray-string-list ()
  (setq nsd--obarray-entries-as-strings (list))
  (mapatoms (lambda (atom)
              (push (format "%s" atom) nsd--obarray-entries-as-strings))))

(nsd--update-obarray-string-list)

(defun nsd-obarray-based-completion ()
  (interactive)
  (let ((read-result
         (ido-completing-read "symbol> " nsd--obarray-entries-as-strings nil nil (thing-at-point 'symbol)))
        (current-symbol-bounds (bounds-of-thing-at-point 'symbol)))
    (delete-region (car current-symbol-bounds) (cdr current-symbol-bounds))
    (insert read-result)))

(defun nsd-obarray-based-completion-helm ()
  (interactive)
  (let ((read-result
         (helm :sources `(,(helm-build-sync-source "obarray" :candidates nsd--obarray-entries-as-strings))
               :input (concat "^" (thing-at-point 'symbol))
               :prompt "symbol> "))
        (current-symbol-bounds (bounds-of-thing-at-point 'symbol)))
    (delete-region (car current-symbol-bounds) (cdr current-symbol-bounds))
    (insert read-result)))

(setq helm-display-function 'helm-display-buffer-in-own-frame
      helm-use-undecorated-frame-option t)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(define-skeleton elisp-locals-skeleton
  "Inserts a locals (i.e. let) skeleton at point"
  nil
  "(locals ((" _ "))\n"
  "  ()")

(define-skeleton elisp-cond-skeleton
  "Inserts a cond skeleton at point"
  nil
  "(cond (" _ " ()))\n")
