(setq package-enable-at-startup nil)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/plugins/")

; Recent files
(require 'recentf)
(setq recentf-auto-cleanup 'never) ;; disable before we start recentf!
(recentf-mode 1)
(setq recentf-max-menu-items 25)

;; icicles (fuzzy completion)
(add-to-list 'load-path "~/.emacs.d/plugins/icicles/icicles-master")
(add-to-list 'load-path "~/.emacs.d/plugins/icicles")
(require 'apropos)
(require 'fuzzy-match)
(require 'hexrgb)
(require 'icicles)

;; Jump
(load-file "~/.emacs.d/plugins/jumping.el")
(setq jump-places (jmp-file-read "~/.emacs.d/jump_dirs.lsp"))

;; Spell checker
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)
(setq flyspell-issue-welcome-flag nil) ;; fix flyspell problem
(setq ispell-program-name "/opt/local/bin/aspell")
(require 'ispell)
(setq flyspell-sort-corrections nil)

;; Git
(add-to-list 'load-path "~/.emacs.d/plugins/magit")
(require 'magit)

(require 'autopair)

(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

(setq password-cache-expiry nil)

(add-to-list 'load-path
              "~/.emacs.d/plugins/multiple-cursors.el")

(add-to-list 'load-path
              "~/.emacs.d/plugins/phi-search")
(require 'phi-search)

(add-to-list 'load-path
              "~/.emacs.d/plugins/expand-region.el")

(add-to-list 'load-path "~/.emacs.d/plugins/ESS/lisp/")
(load "ess-site")

(load "~/.emacs.d/theme.el")
(load "~/.emacs.d/languages.el")
(load "~/.emacs.d/functions.el")
(load "~/.emacs.d/index.el")
(load "~/.emacs.d/auto-complete.el")
(load "~/.emacs.d/keybindings.el")
