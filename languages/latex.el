;; LaTeX
;; Add texbin path
(getenv "PATH")
 (setenv "PATH"
(concat
 "/usr/texbin" ":"

(getenv "PATH")))
;; LaTeX word wrap
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
;; Spell check
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(use-package makefile-runner
  :ensure t)
(load "~/.emacs.d/plugins/latex-makefile.el")
(require 'latex-makefile-mode)
(add-hook 'LaTeX-mode-hook 'latex-makefile-mode)
(add-hook 'LaTeX-mode-hook 'flycheck-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(add-hook 'LaTeX-mode-hook (lambda () (local-set-key (kbd "C-c 0") 'reftex-toc)))


(setq TeX-parse-self t)
(setq TeX-auto-save nil)
;; Use pdflatex
(require 'tex)
(TeX-global-PDF-mode t)
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
;; Set lstlisting as verbatim environment
(setq LaTeX-verbatim-environments '("Verbatim" "lstlisting"))


;; use Skim as default pdf viewer
;; Skim's displayline is used for forward search (from .tex to .pdf)
;; option -b highlights the current line; option -g opens Skim in the background
(setq TeX-view-program-selection '((output-pdf "Skim")))
(setq TeX-view-program-list
  '(("Skim" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))
