(require 'multiple-cursors)
(require 'expand-region)

;; Hippie-expand on M-<spc>
(global-set-key "\M- " 'hippie-expand)

;; Recent files
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; Jump
(global-set-key "\C-c\C-j" 'jump)

;; Tags
(global-set-key (kbd "M-'") 'find-tag)
(global-set-key (kbd "M-*") 'pop-tag-mark)

;; Finish nxml element
(global-set-key "\M-." 'nxml-finish-element)

;; Expand region
(global-set-key (kbd "C-c SPC") 'er/expand-region)

;; Kill word
(global-set-key (kbd "C-<backspace>") 'my-backward-kill-word)

;; Multiple cursors
(global-set-key (kbd "C-æ") 'mc/mark-next-like-this)
(global-set-key (kbd "C-x æ") 'mc/mark-all-like-this)

;; Move windows with arrow keys
(when (fboundp 'windmove-default-keybindings)
      (windmove-default-keybindings))
;; Make windmove work in org-mode:
(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)

;; Compile in c/c++
(add-hook 'c-mode-common-hook
	  (lambda () (define-key c-mode-base-map (kbd "C-c C-f") 'compile)))

;; Open Shell
(global-set-key (kbd "C-x !") 'eshell)

;; Magit status
(global-set-key (kbd "C-x g") 'magit-status)
