(add-to-list 'load-path "plugins/")

; Recent files
(require 'recentf)
(setq recentf-auto-cleanup 'never) ;; disable before we start recentf!
(recentf-mode 1)
(setq recentf-max-menu-items 25)

;; icicles (fuzzy completion)
(add-to-list 'load-path "icicles/icicles-master")
(add-to-list 'load-path "icicles")
(require 'apropos)
(require 'fuzzy-match)
(require 'hexrgb)
(require 'icicles)

;; Jump
(load-file "jumping.el")
(setq jump-places (jmp-file-read "jump_dirs.lsp"))

;; Spell checker
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)
(setq flyspell-issue-welcome-flag nil) ;; fix flyspell problem
(setq ispell-program-name "/opt/local/bin/aspell")
(require 'ispell)
(setq flyspell-sort-corrections nil)

;; Git
(add-to-list 'load-path "magit")
(require 'magit)

(require 'autopair)

(add-to-list 'load-path
              "yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

(setq password-cache-expiry nil)

(add-to-list 'load-path
              "multiple-cursors.el")

(add-to-list 'load-path
              "phi-search")
(require 'phi-search)

(add-to-list 'load-path
              "expand-region.el")

(add-to-list 'load-path "ESS/lisp/")
(load "ess-site")

(load "theme.el")
(load "languages.el")
(load "functions.el")
(load "index.el")
(load "auto-complete.el")
(load "keybindings.el")
