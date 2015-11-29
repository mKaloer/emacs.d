(package-initialize)

(setq inhibit-splash-screen t)

(load-file "~/.emacs.d/packages.el")

(add-to-list 'load-path "~/.emacs.d/plugins/")

;; Use $PATH exec-files.
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

; Recent files
(use-package recentf
  :ensure t
  :config (progn
	    (recentf-mode 1)
	    (setq recentf-auto-cleanup 'never) ;; disable before we start recentf!
	    (setq recentf-max-menu-items 25)))
;; Set file extension priority for ido-find-file
(setq ido-file-extensions-order '(".org" ".tex" ".py" ".emacs" ".xml"))
(use-package ido-vertical-mode
  :ensure t
  :config (ido-vertical-mode 1))

;; icicles (fuzzy completion)
(require 'apropos)
(use-package fuzzy-match
  :ensure t)
(use-package hexrgb
  :ensure t)
(use-package icicles
  :ensure t)

;; Find-line-in-buffer
(load-file "~/.emacs.d/plugins/find-line-in-buffer.el")

;; Spell checker
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)
(setq flyspell-issue-welcome-flag nil) ;; fix flyspell problem
(setq flyspell-sort-corrections nil)

(use-package ispell
  :ensure t
  :init (setq ispell-program-name "/usr/local/bin/aspell")
  :config (setq ispell-dictionary "english"))

;; Show matching parenthesis
(show-paren-mode 1)

;; Magit
(use-package magit
  :ensure t
  :config (setq magit-last-seen-setup-instructions "1.4.0"))

;; Snippets
(use-package dropdown-list)
(use-package yasnippet
  :ensure t
  :config (progn
	    (yas-global-mode 1)
	    (setq yas-snippet-dirs (append yas-snippet-dirs '("~/.emacs.d/snippets")))
	    (setq yas-prompt-functions
		  '(yas-dropdown-prompt
		    yas-ido-prompt
		    yas-x-prompt
		    yas-completing-prompt
		    yas-no-prompt))))

(setq password-cache-expiry nil)

(use-package phi-search
  :ensure t)

(use-package 'resize-window
  :ensure t)

(load "~/.emacs.d/theme.el")
(load "~/.emacs.d/languages.el")
(load "~/.emacs.d/functions.el")
(load "~/.emacs.d/auto-complete.el")
(load "~/.emacs.d/keybindings.el")
(load "~/.emacs.d/helm-config.el")

(use-package dirtree
  :ensure f)

;; Set default directory to home folder.
(setq default-directory (concat (getenv "HOME") "/"))

;; Save backup files in .saves dir
(setq backup-directory-alist `(("." . "~/.saves")))
(setq auto-save-file-name-transforms
      `((".*" ,"~/.saves/\\1[2.]" t)))
(setq backup-directory-alist
      `((".*" . ,"~/.saves")))

;; SSH with sudo
(set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:%h:"))))
;; Disable mouse-wheel scrolling
(when (display-graphic-p)
  (mouse-wheel-mode -1))

;; Clipboard
(use-package pbcopy
  :ensure t
  :config (turn-on-pbcopy))

;; Order buffers in ibuffer by major mode
(setq ibuffer-default-sorting-mode 'major-mode)

;; Overwrite selection when yanking
(delete-selection-mode 1)

;; Browser
(use-package eww)

;; Clean whitespace
(add-hook 'before-save-hook 'whitespace-cleanup)

;; Indent
;;(global-aggressive-indent-mode)

;; Save place in files
(use-package saveplace
  :config (setq-default save-place t))

;; Start emacs server
(unless (server-running-p) (server-start))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Autocomplete mode
(auto-complete-mode 1)

;; Enable Projectile globally
(projectile-global-mode)

;; Auto-scroll compilations
(setq compilation-scroll-output t)

;; Store various data files in misc folder
(setq bookmark-default-file "~/.emacs.d/misc/bookmarks") ;; bookmarks
(setq mc/list-file "~/.emacs.d/misc/mc-lists.el") ;; Multiple-cursors
(setq ac-comphist-file  "~/.emacs.d/misc/ac-comphist.dat") ;; Auto-complete
(setq ido-save-directory-list-file "~/.emacs.d/misc/ido.last") ;; Ido mode
(setq save-place-file "~/.emacs.d/misc/saved-places") ;; Saved places
(setq projectile-known-projects-file "~/.emacs.d/misc/projectile-bookmarks.eld")
(setq recentf-save-file "~/.emacs.d/misc/recentf") ;; Recentf
(setq request-storage-directory "~/.emacs.d/misc/request") ;; Request.el
(setq tramp-persistency-file-name "~/.emacs.d/misc/tramp") ;; TRAMP
(setq multi-term-program "/bin/zsh")
;; Name perspective
(load-file "~/.emacs.d/plugins/perspective-manager.el")
(load-file "~/.emacs.d/perspectives.el")
