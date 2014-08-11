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

(load "~/.emacs.d/plugins/latex-makefile.el")
(require 'latex-makefile-mode)
(add-hook 'LaTeX-mode-hook 'latex-makefile-mode)
(add-hook 'LaTeX-mode-hook 'flycheck-mode)

(setq TeX-parse-self t)
(setq TeX-auto-save nil)
(setq-default TeX-master nil)
;; Use pdflatex
(setq TeX-PDF-mode t)
(setq latex-run-command "pdflatex")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-latex-sectioning-0-face ((t (:inherit font-latex-sectioning-1-face))))
 '(font-latex-sectioning-1-face ((t (:inherit font-latex-sectioning-2-face))))
 '(font-latex-sectioning-2-face ((t (:inherit font-latex-sectioning-3-face))))
 '(font-latex-sectioning-3-face ((t (:inherit font-latex-sectioning-4-face))))
 '(font-latex-sectioning-4-face ((t (:inherit font-latex-sectioning-5-face))))
 '(font-latex-sectioning-5-face ((t (:inherit variable-pitch :foreground "goldenrod1")))))


;; Haskell
(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

;; Scala
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

;; Org-mode
;; Support KOMA article
(require 'org-latex)
(add-to-list 'org-export-latex-classes
          '("koma-article"
             "\\documentclass{scrartcl}"
             ("\\section{%s}" . "\\section*{%s}")
             ("\\subsection{%s}" . "\\subsection*{%s}")
             ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
             ("\\paragraph{%s}" . "\\paragraph*{%s}")
             ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
;; Make windmove work in org-mode:
(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)

;; Ocaml
(add-to-list 'load-path "~/.elisp/tuareg-mode")
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)
(setq auto-mode-alist 
      (append '(("\\.ml[ily]?$" . tuareg-mode)
		("\\.topml$" . tuareg-mode))
	      auto-mode-alist))

;; Python
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t) 
(add-hook 'python-mode-hook 'electric-pair-mode)
(add-hook 'python-mode-hook 'electric-indent-mode)
