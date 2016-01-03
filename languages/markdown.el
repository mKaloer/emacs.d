;; MarkDown
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.text" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))
(custom-set-variables '(markdown-command "/usr/local/Cellar/markdown/1.0.1/bin/markdown"))
(add-hook 'markdown-mode-hook 'pandoc-mode)
(add-hook 'pandoc-mode-hook 'pandoc-load-default-settings)
(add-hook 'pandoc-mode-hook (lambda () (local-set-key (kbd "C-c C-e") 'pandoc-main-hydra/body)))

(defun markdown-make-heading-l1 nil
  "Makes the text at the current line a heading."
  (interactive "*")
  (let ((titlelen (- (line-end-position) (line-beginning-position))))
    (newline)
    (insert-char ?= titlelen)))

(defun markdown-make-heading-l2 nil
  "Makes the text at the current line a level 2 heading."
  (interactive "*")
  (let ((titlelen (- (line-end-position) (line-beginning-position))))
    (newline)
    (insert-char ?- titlelen)))
