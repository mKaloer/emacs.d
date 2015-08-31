;; Org-mode
;; Support KOMA article
;; (require 'org-latex)

;; Autocomplete for orgmode
(require 'org-ac)
(org-ac/config-default)

(setq org-completion-use-ido t)
;; (require 'org-special-blocks)
;; (if window-system (require 'org-mouse))

;; Open agenda in current window
(setq org-agenda-window-setup 'current-window)

(setq org-use-speed-commands t)

(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(add-hook 'org-mode-hook (lambda () (org-indent-mode 1)))
(add-hook 'org-mode-hook (lambda () (visual-line-mode 1)))

(setf org-latex-default-packages-alist
        (remove '("AUTO" "inputenc" t) org-latex-default-packages-alist))

;; org to latex customisations, -shell-escape needed for minted
(setq org-latex-to-pdf-process          ; for regular export
      '("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f")
      org-e-latex-pdf-process           ; for experimental org-export
      '("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

;; Set agenda files
(setq org-agenda-files (list "~/org"))
(setq org-directory "~/org/")
(setq org-default-notes-file "~/org/notes.org")

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/todo.org" "Tasks")
	 "* TODO %?\n %a")
	("w" "Todo (Work)" entry (file+headline "~/org/work.org" "Tasks")
	 "* TODO %?\n  %^T")
	("W" "Todo (Work, scheduled)" entry (file+headline "~/org/work.org" "Tasks")
	 "* TODO %?\nSCHEDULED: <%(org-read-date nil nil nil nil nil \"+thu\")>")
	("r" "Reminder" entry (file+headline "~/org/todo.org" "Reminders")
	   "* TODO %?\n  %^T")
        ("j" "Journal" entry (file+datetree "~/org/notes.org")
             "* %?\nEntered on %U\n  %i\n  %a")))
;; Reftex export
(require 'ox-bibtex)
