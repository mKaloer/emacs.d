(require 'ensime)
;; This step causes the ensime-mode to be started whenever
;; scala-mode is started for a buffer.
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
;; Use arrow keys for sbt-console history
(add-hook 'sbt-mode-hook (lambda () (local-set-key (kbd "<up>") 'comint-previous-input)))
(add-hook 'sbt-mode-hook (lambda () (local-set-key (kbd "<down>") 'comint-next-input)))

;; Disable M-n, M-p ensime keybindings
(eval-after-load "ensime-mode"
  '(progn
     (define-key ensime-mode-map (kbd "M-p") nil)
     (define-key ensime-mode-map (kbd "M-n") nil)))

(defun scala-newline-indent-put-in-asterisk-comment ()
  "Creates a newline, indents, and adds an asterisk if inside a multi-line comment"
  (interactive)
  (newline-and-indent)
  (scala-indent:insert-asterisk-on-multiline-comment))

(defun setup-scala-keys ()
  (local-set-key (kbd "RET") 'scala-newline-indent-put-in-asterisk-comment)
  (local-set-key (kbd "C-x C-r") 'sbt-send-region)
  (local-set-key (kbd "C-c C-c") (lambda () ensime-sbt-action "run")))

(add-hook 'scala-mode-hook 'setup-scala-keys)
