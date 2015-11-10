(tool-bar-mode -1)
(menu-bar-mode -1)

;; Always trust themes
(setq custom-safe-themes t)

(sml/setup)

;; Always line-numbers
(global-linum-mode t)
(when (display-graphic-p)
  (set-fringe-mode 0))
(setq linum-format " %d  ")

(set-default-font "SourceCodePro 12")

(load-theme 'flatland-black t)
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;;(load-theme 'atom-dark t)

;; Highlight current line
(global-hl-line-mode 1)
;; Modify color
(set-face-background 'hl-line "#222222")
(set-face-background 'mode-line "#222222")
(set-face-background 'mode-line "#222222")
;; Keep syntax highlighting
(set-face-foreground 'highlight nil)
