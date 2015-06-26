(setq inhibit-splash-screen t)

(load-file "~/.emacs.d/packages.el")

(add-hook 'after-init-hook '(lambda ()
			      (org-agenda nil "t")))

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

;; Jump
(load-file "~/.emacs.d/plugins/jumping.el")
(setq jump-places (jmp-file-read "~/.emacs.d/jump_dirs.lsp"))

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
(load "~/.emacs.d/index.el")
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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("9122dfb203945f6e84b0de66d11a97de6c9edf28b3b5db772472e4beccc6b3c5" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "12fece7b8ef725588213723b85b02bc7610b8cdee26dc48b32c12364a04088d2" "e24180589c0267df991cf54bf1a795c07d00b24169206106624bb844292807b9" "9dae95cdbed1505d45322ef8b5aa90ccb6cb59e0ff26fef0b8f411dfc416c552" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "41b6698b5f9ab241ad6c30aea8c9f53d539e23ad4e3963abff4b57c0f8bf6730" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(markdown-command "/usr/local/Cellar/markdown/1.0.1/bin/markdown")
 '(safe-local-variable-values
   (quote
    ((eval setq TeX-master
	   (expand-file-name "report.tex"
			     (file-name-directory
			      (let
				  ((d
				    (dir-locals-find-file ".")))
				(if
				    (stringp d)
				    d
				  (car d))))))
     (ruby-compilation-executable . "ruby")
     (ruby-compilation-executable . "ruby1.8")
     (ruby-compilation-executable . "ruby1.9")
     (ruby-compilation-executable . "rbx")
     (ruby-compilation-executable . "jruby"))))
 '(sml/theme (quote dark)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-latex-sectioning-0-face ((t (:inherit font-latex-sectioning-1-face))))
 '(font-latex-sectioning-1-face ((t (:inherit font-latex-sectioning-2-face))))
 '(font-latex-sectioning-2-face ((t (:inherit font-latex-sectioning-3-face))))
 '(font-latex-sectioning-3-face ((t (:inherit font-latex-sectioning-4-face))))
 '(font-latex-sectioning-4-face ((t (:inherit font-latex-sectioning-5-face))))
 '(font-latex-sectioning-5-face ((t (:inherit variable-pitch :foreground "goldenrod1"))))
 '(sml/col-number ((t (:inherit default :foreground "green"))))
 '(sml/folder ((t (:inherit sml/global :foreground "brightgreen" :weight normal))))
 '(sml/global ((t (:foreground "cyan" :inverse-video nil)))))

;; Autocomplete mode
(auto-complete-mode 1)

;; Enable Projectile globally
(projectile-global-mode)

;; Auto-scroll compilations
(setq compilation-scroll-output t)
