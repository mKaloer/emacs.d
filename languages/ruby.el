;; Rinari (Ruby on Rails)
(require 'ido)
(ido-mode t)
(use-package rinari
  :ensure t)
(require 'rinari)
(use-package rvm
  :ensure t)
(require 'rvm)
(rvm-use-default)

;; Causes Emacs to fail load on startup.
;; (load "~/.emacs.d/plugins/nxhtml/autostart.el")
(use-package ruby-electric
  :ensure t)
(add-hook 'ruby-mode-hook (lambda () (ruby-electric-mode)))

(setq ruby-insert-encoding-magic-comment nil)

;; Auto-reload all buffers when changed on disk
(global-auto-revert-mode t)

(add-to-list 'auto-mode-alist '(".rb\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rabl\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.jbuilder\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.prawn\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))

;; Ruby-electric
(require 'ruby-electric)

(use-package yaml-mode
  :ensure t)
;; Yaml-mode
(require 'yaml-mode)
    (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; Missing from ruby-mode.el, see https://groups.google.com/group/emacs-on-rails/msg/565fba8263233c28
(defun ruby-insert-end () 
  "Insert \"end\" at point and reindent current line." 
  (interactive) 
  (insert "end") 
  (ruby-indent-line t) 
  (end-of-line)) 

