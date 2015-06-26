;; require or autoload paredit-mode
(add-hook 'clojure-mode-hook 'paredit-mode)

;; require or autoload smartparens
(add-hook 'clojure-mode-hook 'smartparens-strict-mode)

(add-hook 'clojure-mode-hook 'flycheck-mode)

;; Auto completion
(require 'ac-cider)
(add-hook 'cider-mode-hook 'ac-flyspell-workaround)
(add-hook 'cider-mode-hook 'ac-cider-setup)
(add-hook 'cider-repl-mode-hook 'ac-cider-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-mode))
