;; minimal UI
;; done first, so there's no popup
(scroll-bar-mode -1)
(tool-bar-mode   -1)
(tooltip-mode    -1)
(menu-bar-mode   -1)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
;; Package configs
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org" . "https://orgmode.org/elpa/")
                        ("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; manually load undo-tree (evil dependency)
;; because elpa is unreliable
(unless (package-installed-p 'undo-tree)
  (package-install-file "~/.emacs.d/undo-tree-0.6.3.el"))

;; always install packages
(setq use-package-always-ensure t)

(use-package org)
(org-babel-load-file (expand-file-name (concat user-emacs-directory "config.org")))
