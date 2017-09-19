(use-package virtualenvwrapper
  :ensure t
  )
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

(setq venv-location "~/.virtualenvs/")
;; Show in mode line
(setq-default mode-line-format (cons '(:exec venv-current-name) mode-line-format))

;; Jedi
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
;; flycheck
(add-hook 'python-mode-hook 'flycheck-mode)

;; IPython Notebook
(use-package ein
  :ensure t)

;; Store python env in misc folder
(setq python-environment-directory "~/.emacs.d/misc/python-environments")

(defun isort-before-save-matplotlib
    (if (save-excursion
	  (goto-char (point-min))
	  (search-forward "matplotlib.use" nil t))
	2
	4)
  )

(use-package py-isort
  :ensure t
  );:config (add-hook 'before-save-hook 'py-isort-before-save))
