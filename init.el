(package-initialize)

(setq inhibit-splash-screen t)

(load-file "~/.emacs.d/packages.el")

(add-to-list 'load-path "~/.emacs.d/plugins/")

;; Use $PATH exec-files.
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

; Recent files
(require 'recentf)
(setq recentf-auto-cleanup 'never) ;; disable before we start recentf!
(recentf-mode 1)
(setq recentf-max-menu-items 25)

;; Set file extension priority for ido-find-file
(setq ido-file-extensions-order '(".org" ".tex" ".py" ".emacs" ".xml"))
(require 'ido-vertical-mode)
(ido-vertical-mode 1)

;; icicles (fuzzy completion)
(require 'apropos)
(require 'fuzzy-match)
(require 'hexrgb)
(require 'icicles)

;; Find-line-in-buffer
(load-file "~/.emacs.d/plugins/find-line-in-buffer.el")

;; Spell checker
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)
(setq flyspell-issue-welcome-flag nil) ;; fix flyspell problem
(setq ispell-program-name "/usr/local/bin/aspell")
(require 'ispell)
(setq ispell-dictionary "english")
(setq flyspell-sort-corrections nil)

;; Show matching parenthesis
(show-paren-mode 1)

(require 'magit)
(setq magit-last-seen-setup-instructions "1.4.0")

(require 'yasnippet)
(yas-global-mode 1)
(setq yas-snippet-dirs (append yas-snippet-dirs '("~/.emacs.d/snippets")))
(require 'dropdown-list)
(setq yas-prompt-functions
      '(yas-dropdown-prompt
        yas-ido-prompt
        yas-x-prompt
        yas-completing-prompt
        yas-no-prompt))

(setq password-cache-expiry nil)

(require 'phi-search)

(load "~/.emacs.d/theme.el")
(load "~/.emacs.d/languages.el")
(load "~/.emacs.d/functions.el")
(load "~/.emacs.d/auto-complete.el")
(load "~/.emacs.d/keybindings.el")
(load "~/.emacs.d/helm-config.el")

(require 'dirtree)

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
(require 'pbcopy)
(turn-on-pbcopy)

;; Order buffers in ibuffer by major mode
(setq ibuffer-default-sorting-mode 'major-mode)

;; Overwrite selection when yanking
(delete-selection-mode 1)

(require 'eww)
(add-hook 'write-file-hooks 'delete-trailing-whitespace)

;; Indent
;;(global-aggressive-indent-mode)

;; Save place in files
(require 'saveplace)
(setq-default save-place t)

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

;; Name perspective
(load-file "~/.emacs.d/plugins/perspective-manager.el")
(load-file "~/.emacs.d/perspectives.el")

;; Magit default color
(setq magit-log-arguments '("--graph" "--color" "--decorate"))
