;; Rinari (Ruby on Rails)
(require 'ido)
(ido-mode t)
(require 'rinari)
(require 'rvm)
(rvm-use-default)

;; Causes Emacs to fail load on startup.
;; (load "~/.emacs.d/plugins/nxhtml/autostart.el")

(add-hook 'ruby-mode-hook (lambda () (ruby-electric-mode)))

(setq ruby-insert-encoding-magic-comment nil)

;; MuMaMo-Mode for rhtml files
(add-to-list 'load-path "~/.emacs.d/plugins/nxhtml/util/")
(require 'mumamo-fun)
(setq mumamo-chunk-coloring 5)
(add-to-list 'auto-mode-alist '("\\.rhtml\\'" . eruby-html-mumamo))
(add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . eruby-html-mumamo))
;; Workaround the annoying warnings:
;;    Warning (mumamo-per-buffer-local-vars):
;;    Already 'permanent-local t: buffer-file-name
(when (and (equal emacs-major-version 24)
           (equal emacs-minor-version 2))
  (eval-after-load "mumamo"
    '(setq mumamo-per-buffer-local-vars
           (delq 'buffer-file-name mumamo-per-buffer-local-vars))))

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

