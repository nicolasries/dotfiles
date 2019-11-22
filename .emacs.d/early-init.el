;; avoid outdated files
(setq load-prefer-newer t)
;; minimal UI
;; done first, so there's no popup
(scroll-bar-mode -1)
(tool-bar-mode   -1)
(tooltip-mode    -1)
(menu-bar-mode   -1)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
