(require 'makefile-runner)
(defun latex-makefile-runner ()
  (interactive)
  (makefile-runner "pdf"))

(defvar latex-makefile-mode-map (make-keymap) "latex-makefile-mode keymap.")

(define-key latex-makefile-mode-map (kbd "C-C C-C") 'makefile-runner)

(define-minor-mode latex-makefile-mode
  "Replaces C-C C-C key binding to use a makefile."
  nil " latex-makefile-mode" 'latex-makefile-mode-map)

(provide 'latex-makefile-mode)
