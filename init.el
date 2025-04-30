;; speed up init
(setq gc-cons-threshold (* 128 1024 1024))
(add-hook 'emacs-startup-hook (lambda () (setq gc-cons-threshold (* 20 1024 1024))))

;; We use use-package and setopt, so require 29.
(let ((minver "29.4"))
 (when (version< emacs-version minver)
   (error "Your Emacs is too old, update to Emacs %s or higher" minver)))

;; some editing settings
(column-number-mode t)
(global-auto-revert-mode t)
(delete-selection-mode t)

;; backup settings
(setq make-backup-files nil) ; don't generate "file~"
(setq auto-save-default nil) ; don't generate "#file#"

;; ui settings
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-hl-line-mode t)
(global-visual-line-mode t)
(global-display-line-numbers-mode t)
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)
(setopt display-fill-column-indicator-column 100) ; it is a custom variable, so use setopt
(setopt display-fill-column-indicator-character ?\u00a6) ; also custom variable

;; gui settings
(when (display-graphic-p)
  (add-to-list 'default-frame-alist '(width . 120))
  (add-to-list 'default-frame-alist '(height . 40))
  (when (member "Droid Sans Mono" (font-family-list))
    (set-frame-font "Droid Sans Mono-12" t t)))

;; eww
(setq shr-max-width 100)
(setq shr-width 100)
(setq shr-use-fonts nil)

;; exit
(setq confirm-kill-processes nil)

;; custom
(unless (file-exists-p "~/.emacs.d/custom.el") ; if there is no custom.el, generate it
  (with-temp-buffer (write-file "~/.emacs.d/custom.el")))
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; user scripts
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'pkgs)
(require 'indent)
(require 'autotheme)
(require 'fonts)
