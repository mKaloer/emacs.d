(require 'multiple-cursors)
(require 'expand-region)

;; Avoid C-z termination
(global-unset-key (kbd "C-z"))
;; Map S-up terminal input to to S-up
(define-key input-decode-map "\e[1;2A" [S-up])
;; Fix terminal keybindings
(define-key input-decode-map "\e[1;10A" [M-S-up])
(define-key input-decode-map "\e[1;10B" [M-S-down])
(define-key input-decode-map "\e[1;10C" [M-S-right])
(define-key input-decode-map "\e[1;10D" [M-S-left])
(define-key input-decode-map "\e[1;9A" [M-up])
(define-key input-decode-map "\e[1;9B" [M-down])
(define-key input-decode-map "\e[1;9C" [M-right])
(define-key input-decode-map "\e[1;9D" [M-left])

;; Hippie-expand on M-S-<spc>
(global-set-key (kbd "M-SPC") 'hippie-expand)

;; Recent files
(global-set-key "\C-x\ \C-r" 'helm-recentf)

;; Jump
(global-set-key "\C-c\C-j" 'jump)

;; Tags
(global-set-key (kbd "M-'") 'find-tag)
(global-set-key (kbd "M-*") 'pop-tag-mark)

;; Finish nxml element
(global-set-key "\M-." 'nxml-finish-element)

;; Expand region
(global-set-key (kbd "M-q") 'er/expand-region)

;; Kill word
(global-set-key (kbd "C-<backspace>") 'my-backward-kill-word)
(global-set-key (kbd "M-DEL") 'my-backward-kill-word) ;; For terminal

;; Multiple cursors
(global-set-key (kbd "C-æ") 'mc/mark-next-like-this)
(global-set-key (kbd "C-\\") 'mc/mark-next-like-this) ;; For terminal
(global-set-key (kbd "C-x æ") 'mc/mark-all-like-this)
(global-set-key (kbd "C-x ø") 'mc/mark-pop)


;; Move windows with arrow keys
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; Windmove in tmux
(global-set-key "\M-[1;2A" 'windmove-up)
(global-set-key "\M-[1;2B" 'windmove-down)
(global-set-key "\M-[1;2C" 'windmove-right)
(global-set-key "\M-[1;2D" 'windmove-left)
;; Windmove in Cocoa-GUI
(global-set-key (kbd "M-<up>") 'windmove-up)
(global-set-key (kbd "M-<down>") 'windmove-down)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "M-<left>") 'windmove-left)

;; Make windmove work in org-mode:
(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)
;; Open agenda v
(global-set-key (kbd "C-x o") 'org-agenda)

;; Compile in c/c++
(add-hook 'c-mode-common-hook
	  (lambda () (define-key c-mode-base-map (kbd "C-c C-f") 'compile)))

;; Open Shell
(global-set-key (kbd "C-x !") 'eshell)

;; Magit status
(global-set-key (kbd "C-x g") 'magit-status)

(global-set-key (kbd "C-x _") 'dirtree)

;; Move paragraph back
(global-set-key (kbd "M-p") (lambda() (interactive)
			      (backward-paragraph)))
;; Move paragraph forward
(global-set-key (kbd "M-n") (lambda() (interactive)
			      (forward-paragraph)))
;; Next line x10
(global-set-key (kbd "M-N") (lambda() (interactive)
				(next-line 10)))
;; Previous line x10
(global-set-key (kbd "M-P") (lambda() (interactive)
			      (previous-line 10)))
;; Forward-char x10
(global-set-key (kbd "M-F") (lambda() (interactive)
			      (forward-char 10)))
;; Backward-char x10
(global-set-key (kbd "M-B") (lambda() (interactive)
			      (backward-char 10)))


;; Easy window resizing
(global-set-key (kbd "M-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "M-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-<down>") 'shrink-window)
(global-set-key (kbd "M-<up>") 'enlarge-window)
;; For terminal
(global-set-key (kbd "ESC <left>") 'shrink-window-horizontally)
(global-set-key (kbd "ESC <right>") 'enlarge-window-horizontally)
(global-set-key (kbd "ESC <down>") 'shrink-window)
(global-set-key (kbd "ESC <up>") 'enlarge-window)

;; Disable yasnippet tab binding
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
;; Set Yasnippet's key binding to shift+tab
(define-key yas-minor-mode-map (kbd "<backtab>") 'yas-expand)

;; Auto-completion
(define-key ac-completing-map (kbd "RET") nil)
(define-key ac-completing-map [return] nil)
(ac-set-trigger-key "TAB")
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)

;; Make return move cursor to line between pairs
(setq skeleton-pair-alist
      '((?\( _ ?\))
	(?[  _ ?])
	(?{  _ ?})
	(?\" _ ?\")))
(defun autopairs-ret (arg)
      (interactive "P")
      (let (pair)
        (dolist (pair skeleton-pair-alist)
          (when (eq (char-after) (car (last pair)))
            (save-excursion (newline-and-indent))))
        (newline arg)
        (indent-according-to-mode)))
(global-set-key (kbd "RET") 'autopairs-ret)


;; Org-capture
(global-set-key (kbd "C-c r") 'org-capture)

;; Use ibuffer instead of default buffer overview
(global-set-key (kbd "C-x C-b") 'ibuffer-other-window)

;; Undo C--
(global-set-key (kbd "C--") 'undo)

;; Helm-find-file
(global-set-key (kbd "C-x C-f") 'helm-find-files)
;; Helm-M-x
(global-set-key (kbd "M-x") 'helm-M-x)
;; Helm buffer
(global-set-key (kbd "C-x b") 'helm-mini)

;; Create/change frames
(define-prefix-command 'frame-map)
(global-set-key (kbd "C-x f") 'frame-map)
(define-key frame-map (kbd "c") 'make-frame)
(define-key frame-map (kbd "n") 'ns-next-frame)
(define-key frame-map (kbd "p") 'ns-prev-frame)
(define-key frame-map (kbd "x") 'delete-frame)

;; Disable C-t swap
(global-unset-key (kbd "C-t"))

;; Ace jump
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(global-set-key (kbd "C-c C-s") 'helm-swoop)
