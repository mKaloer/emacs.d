;; C
(defun my-c-mode-common-hook ()
    ;; my customizations for all of c-mode, c++-mode, objc-mode, java-mode
    (c-set-offset 'substatement-open 0)
    ;; other customizations can go here

    (setq c++-tab-always-indent t)
    (setq c-basic-offset 4)                  ;; Default is 2
    (setq c-indent-level 4)                  ;; Default is 2

    (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
    (setq tab-width 4)
    (setq indent-tabs-mode nil)  ; use spaces only if nil
    (local-set-key (kbd "RET") 'newline-and-indent)
    (electric-indent-mode t)
)
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; MarkDown
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t) 
(setq auto-mode-alist (cons '("\\.text" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))
(custom-set-variables '(markdown-command "/usr/local/Cellar/markdown/1.0.1/bin/markdown"))

;; Ruby
(load "~/.emacs.d/ruby.el")

;; LaTeX
;; Add texbin path
(getenv "PATH")
 (setenv "PATH"
(concat
 "/usr/texbin" ":"

(getenv "PATH")))
(require 'tex)
;; LaTeX word wrap
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
;; Spell check
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(setq TeX-parse-self t)
(setq TeX-auto-save nil)
(setq-default TeX-master nil)
;; Use pdflatex
(setq TeX-PDF-mode t)
(setq latex-run-command "pdflatex")

;; Haskell
(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
