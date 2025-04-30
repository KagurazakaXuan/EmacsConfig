(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(eval-when-compile (require 'use-package))

;; -- editing & tools --
(use-package undo-tree
  :ensure t
  :init (global-undo-tree-mode)
  :custom
  (undo-tree-auto-save-history nil))

(use-package mwim
  :ensure t
  :bind
  ("C-a" . mwim-beginning-of-code-or-line)
  ("C-e" . mwim-end-of-code-or-line))

(use-package neotree
  :ensure t
  :bind
  ("C-<tab>" . neotree-toggle))

(use-package company
  :ensure t
  :init (global-company-mode)
  :config
  (setq company-transformers '(company-sort-by-occurrence)))

(use-package amx
  :ensure t
  :init (amx-mode))

(use-package eshell-toggle
  :ensure t
  :custom
  (eshell-toggle-run-command "clear")
  :bind
  ("C-`" . eshell-toggle))

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

;; -- language support --
(use-package auctex
  :ensure t)

(use-package haskell-mode
  :ensure t)

(use-package swift-mode
  :ensure t
  :mode "\\.swift\\'"
  :interpreter "swift")

(use-package yaml-mode
  :ensure t
  :mode "\\.yml\\'")

(use-package web-mode
  :ensure t
  :mode (("\\.ts\\'" . web-mode)
	 ("\\.js\\'" . web-mode)
	 ("\\.mts\\'" . web-mode)
	 ("\\.mjs\\'" . web-mode)))

;; -- ui tweak --
(use-package solarized-theme
  :ensure t
  :config
  (setq x-underline-at-descent-line t))

(use-package powerline
  :ensure t
  :config
  (powerline-default-theme)
  (setq powerline-default-separator 'nil))

(use-package spaceline
  :ensure t
  :after powerline
  :config
  (spaceline-emacs-theme)
  (setq spaceline-minor-modes-separator " "))

(use-package dashboard
  :ensure t
  :config
  (setq dashboard-banner-logo-title "どこにいたって、人は繋がっているのよ") ; lain
  (setq dashboard-startup-banner (cons "~/.emacs.d/lain.jpg" "~/.emacs.d/lain.txt"))
  (setq dashboard-items '((recents . 10))) ; only recents
  (setq dashboard-center-content t)
  (setq dashboard-footer-messages '("No matter where you go, everyone is connected"
				    "无论在哪儿，人和人都彼此相连")) ; lain
  (dashboard-setup-startup-hook))

(use-package good-scroll
  :ensure t
  :if (display-graphic-p)
  :init (good-scroll-mode))

(provide 'pkgs)
