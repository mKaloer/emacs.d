(use-package go-mode
  :ensure t
  :config (progn
		(setenv "GOPATH" "~/Development/golang")
		(add-hook 'go-mode-hook 'my-go-mode-hook)))
(use-package go-autocomplete
  :ensure t
  :config (with-eval-after-load 'go-mode
		(require 'go-autocomplete)))

(use-package company-go
  :ensure t)

(defun my-go-mode-hook ()
  ; Call Gofmt before saving
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Auto complete
  (set (make-local-variable 'company-backends) '(company-go))
  (company-mode)
  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
	  (set (make-local-variable 'compile-command)
	   "go build -v && go test -v && go vet"))
   ; Go oracle
  (load-file "$GOPATH/src/golang.org/x/tools/cmd/oracle/oracle.el")
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump)
  ; Compile and run
  (local-set-key (kbd "C-c C-c") 'compile)
  (local-set-key (kbd "C-c C-e") 'go-compile-and-run)
  (setq tab-width 4))

(defun go-compile-and-run (file)
  "Compiles and runs the given file"
  (interactive "f")
  (shell-command (concat "go run " file)))
