;;; packages.el --- PHP Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq php-extended-packages
      '(
        ac-php
        company
        feature-mode
        drupal-mode
        eldoc
        flycheck
        ggtags
        helm-gtags
        php-auto-yasnippets
        php-mode
        phpcbf
        phpunit
        ))

(when (configuration-layer/layer-usedp 'auto-completion)
  (defun php-extended/post-init-company ()
    (spacemacs|add-company-hook php-mode))

  ;; (defun php-extended/post-init-ac-php ()
  ;;   (push 'company-ac-php-backend company-backends-php-mode)))
  )

(defun php-extended/init-feature-mode ()
  "Initialize feature mode for Behat"
  (use-package feature-mode
    :mode (("\\.feature\\'" . feature-mode))))

(defun php-extended/init-drupal-mode ()
  (use-package drupal-mode
    :defer t))

(defun php-extended/init-ac-php ()
  (use-package ac-php
    :defer t
    :init (progn
            (use-package ac-php-company
              :defer t)
            )))

(defun php-extended/post-init-eldoc ()
  (add-hook 'php-mode-hook 'eldoc-mode)
  (when (configuration-layer/package-usedp 'ggtags)
    (spacemacs/ggtags-enable-eldoc 'php-mode)))

(defun php-extended/post-init-flycheck ()
  (add-hook 'php-mode-hook 'flycheck-mode))

(defun php-extended/post-init-ggtags ()
  (add-hook 'php-mode-hook 'ggtags-mode))

(defun php-extended/post-init-helm-gtags ()
  (spacemacs/helm-gtags-define-keys-for-mode 'php-mode))

(defun php-extended/init-php-auto-yasnippets ()
  (use-package php-auto-yasnippets
    :defer t))

(defun php-extended/init-php-mode ()
  (use-package php-mode
    :defer t
    :mode ("\\.php\\'" . php-mode)))

(defun php-extended/init-phpcbf ()
  (use-package phpcbf
    :defer t))

(defun php-extended/init-phpunit ()
  (use-package phpunit
    :defer t))
