(load-file "~/.emacs.d/plugins/hl-tags-mode.el")
(add-hook 'html-mode-hook (lambda () (hl-tags-mode)))

;; React
(use-package rjsx-mode
  :ensure t
  )
