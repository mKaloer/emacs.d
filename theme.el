(tool-bar-mode -1)
(menu-bar-mode -1)

;; Always trust themes
(setq custom-safe-themes t)
(use-package smart-mode-line
  :ensure t
  :config (lambda
	    (sml/setup)))

;; Always line-numbers
(global-linum-mode t)
(when (display-graphic-p)
  (set-fringe-mode 0))
(setq linum-format " %d  ")

(if window-system
    (set-fontset-font t 'hangul (font-spec :name "SourceCodePro")))


(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'atom-dark t)

;; Highlight current line
(global-hl-line-mode 1)
;; Modify color
(set-face-background 'hl-line "#2A2A2A2A")
(set-face-background 'mode-line "#2A2A2A2A")
(set-face-foreground 'linum "#AAAAAAAA")
;; Make green string color darker
(set-face-foreground 'font-lock-string-face "#a8CC60")
;; Keep syntax highlighting
(set-face-foreground 'highlight nil)
(if (display-graphic-p)
    (set-background-color "#151515"))
