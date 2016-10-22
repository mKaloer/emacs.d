(require 'multiple-cursors)
(require 'expand-region)

;; Disabel right meta key os GUI
(if (display-graphic-p)
    (progn
      (setq mac-option-key-is-meta t)
      (setq mac-right-option-modifier nil)))


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
(define-key input-decode-map "\e[46;5U" (kbd "C-."))

;; Hippie-expand on M-S-<spc>
(global-set-key (kbd "<f2>") 'hippie-expand)

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

;; Windmove in tmux
(global-set-key (kbd "<f1> <up>") 'windmove-up)
(global-set-key (kbd "<f1> <down>") 'windmove-down)
(global-set-key (kbd "<f1> <right>") 'windmove-right)
(global-set-key (kbd "<f1> <left>") 'windmove-left)

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
(global-set-key (kbd "C-c ;") 'resize-window)
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

;; Auto-completion (Company)
(global-set-key (kbd "C-.") 'company-complete)

;; Make return move cursor to line between pairs
(setq skeleton-pair-alist
      '((?\( _ ?\))
	(?[  _ ?])
	(?{  _ ?})
	(?\" _ ?\")))
;; (defun autopairs-ret (arg)
;;       (interactive "P")
;;       (let (pair)
;;	(dolist (pair skeleton-pair-alist)
;;	  (when (eq (char-after) (car (last pair)))
;;	    (save-excursion (newline-and-indent))))
;;	(newline arg)
;;	(indent-according-to-mode)))
;; (global-set-key (kbd "RET") 'autopairs-ret)

(global-set-key (kbd "RET") 'newline-and-indent)

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
;; Search
(global-set-key (kbd "C-c C-s") 'isearch-forward)
(global-set-key (kbd "C-s") 'swiper)

;; Disable keyboard-escape-quit
(global-unset-key (kbd "ESC ESC ESC"))

;; Perspective manager
(global-set-key (kbd "C-x x x") 'perspmgr-open-perspective)

;; Fill paragraph
(global-set-key (kbd "C-c l") 'fill-paragraph)
