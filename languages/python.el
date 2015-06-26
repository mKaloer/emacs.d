(require 'virtualenvwrapper)
(venv-initialize-interactive-shells) ;; Interactive shell support
(venv-initialize-eshell) ;; Eshell support

(defun set-venv-dir ()
  "Asks for the venv directory and optionally activates it"
  (interactive)
  (let ((dir (expand-file-name (read-directory-name "Set venv directory:"))))
    (progn
      (setq venv-location (list dir))
      (if (y-or-n-p "Set environment?")
	  ;; Set as current venv
	  (venv-workon
	   (file-name-nondirectory
	    (directory-file-name (file-name-directory "/test/test/venv/"))))))))

;; Ask for venv if not set
(add-hook 'python-mode-hook (lambda ()
			      (if (eq venv-current-name nil)
				  (set-venv-dir))))

;; Jedi
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
;; flycheck
(add-hook 'python-mode-hook 'flycheck-mode)

;; IPython Notebook
(require 'ein)
