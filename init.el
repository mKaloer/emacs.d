(setq package-enable-at-startup nil)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/plugins/")

; Marmalade (Package archive for package.el)
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)


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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#1a1a1a" "#ac4142" "#90a959" "#f4bf75" "#6a9fb5" "#aa759f" "#6a9fb5" "#505050"])
 '(ansi-term-color-vector [unspecified "#1a1a1a" "#ac4142" "#90a959" "#f4bf75" "#6a9fb5" "#aa759f" "#6a9fb5" "#505050"])
 '(custom-safe-themes (quote ("b34067c399d1ee287fe2dd5d387b53420427653e9577be3425ea7e5fb8c0e0db" "51b27837351cc4176c216d31b3a5dd49b69ab99da039af418d0a0215375d90cc" "57119dc6527eace555668274e6ce8bd89422322a6b336999ecaa755c48606752" "7ca0aa20956e836205e5c68533d68864cac0aaf6ef11ab4aac8236dcdab3f42d" "f8e4694eee94205aea070b8cb87ab12f8049c33ddb5df82c74e3565127860423" "c549e518d11fcf6145dbb6908fce2ba9580229ee002fc15ba87d2c7683da63a5" "e02db5c37de3bb8e8b039a1062ed2c3e7343a42f1d3c6d27b8623ccd398fb4ee" "1de10ea11a6c2898841fca93f879d40f85f87ff50801a11059a87a1a108dd449" "144b2676b6a355c5d21dba5ddae05f180aaf7b171006bef8369cfc5013ec4ee9" "2a738af290baf652e995b0be1d24b20c9d71a433e5a86a6d15f4dfc3ccc30da1" "545287ef14b1b686cd88a99cf6ab3629e55ef6b73d59a76253eec65f4ead4fee" default)))
 '(custom-theme-directory "~/.emacs.d/themes/")
 '(markdown-command "/usr/local/Cellar/markdown/1.0.1/bin/markdown")
 '(ns-right-alternate-modifier (quote none))
 '(safe-local-variable-values (quote ((comment-auto-fill-only-comments . f) (comment-auto-fill-only-comments . t) (word-wrap . 1) (ispell-change-dictionary . "american") (ruby-compilation-executable . "ruby") (ruby-compilation-executable . "ruby1.8") (ruby-compilation-executable . "ruby1.9") (ruby-compilation-executable . "rbx") (ruby-compilation-executable . "jruby"))))
 '(send-mail-function (quote smtpmail-send-it)))
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
 '(font-latex-sectioning-5-face ((t (:inherit variable-pitch :foreground "goldenrod1")))))
