(require 'ensime)
;; This step causes the ensime-mode to be started whenever
;; scala-mode is started for a buffer.
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
;; Use arrow keys for sbt-console history
(add-hook 'sbt-mode-hook (lambda () (local-set-key (kbd "<up>") 'comint-previous-input)))
(add-hook 'sbt-mode-hook (lambda () (local-set-key (kbd "<down>") 'comint-next-input)))
(add-hook 'scala-mode-hook
	  (lambda () (local-set-key (kbd "C-c C-c")
				    (lambda () (interactive) (ensime-sbt-action "run")))))

;; Disable M-n, M-p ensime keybindings
(eval-after-load "ensime-mode"
  '(progn
     (define-key ensime-mode-map (kbd "M-p") nil)
     (define-key ensime-mode-map (kbd "M-n") nil)))
