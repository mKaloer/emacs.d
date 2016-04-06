;; C
(defun my-c-mode-common-hook ()
    (c-set-offset 'substatement-open 0)
    (c-set-offset 'func-decl-cont 0)
    (c-set-offset 'substatement 0)
    ;; other customizations can go here

    (setq c++-tab-always-indent t)
    (setq c-basic-offset 4)                  ;; Default is 2
    (setq c-indent-level 4)                  ;; Default is 2

    (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
    (setq tab-width 4)
    (setq indent-tabs-mode nil)  ; use spaces only if nil
    (local-set-key (kbd "C-c C-c") 'makefile-runner)
)
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(add-hook 'c-mode-common-hook 'flycheck-mode)

;; Use c++ 11
(add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++14")))
(add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++14")))
