;; hook AC into completion-at-point
(defun sanityinc/auto-complete-at-point ()
  (when (and (not (minibufferp))
	     (fboundp 'auto-complete-mode)
	     auto-complete-mode)
    (auto-complete)))

(defun sanityinc/never-indent ()
  (set (make-local-variable 'indent-line-function) (lambda () 'noindent)))

(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions
	(cons 'sanityinc/auto-complete-at-point
	      (remove 'sanityinc/auto-complete-at-point completion-at-point-functions))))

;; Exclude very large buffers from dabbrev
(defun sanityinc/dabbrev-friend-buffer (other-buffer)
  (< (buffer-size other-buffer) (* 1 1024 1024)))


(defun setup-ac ()
  (progn
    (global-auto-complete-mode t)
    ;; Use etags for completion
    (setq-default ac-expand-on-auto-complete nil)
    (setq-default ac-auto-start nil)
    (setq-default ac-dwim nil)
    (setq tab-always-indent 'complete)  ;; use 't when auto-complete is disabled
    (add-to-list 'completion-styles 'initials t)
    ;; Stop completion-at-point from popping up completion buffers so eagerly
    (setq completion-cycle-threshold 5)
    (setq c-tab-always-indent nil
	  c-insert-tab-function 'indent-for-tab-command)
    (add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)
    (set-default 'ac-sources
		 '(ac-source-imenu
		   ac-source-dictionary
		   ac-source-words-in-buffer
		   ac-source-words-in-same-mode-buffers
		   ac-source-words-in-all-buffer))

    (dolist (mode '(magit-log-edit-mode
		    log-edit-mode org-mode text-mode haml-mode
		    git-commit-mode
		    sass-mode yaml-mode csv-mode espresso-mode haskell-mode
		    html-mode nxml-mode sh-mode smarty-mode clojure-mode
		    lisp-mode textile-mode markdown-mode tuareg-mode
		    js3-mode css-mode less-css-mode sql-mode
		    sql-interactive-mode
		    inferior-emacs-lisp-mode))
      (add-to-list 'ac-modes mode))
    (setq dabbrev-friend-buffer-function 'sanityinc/dabbrev-friend-buffer)
    ;; Use C-n/C-p
    (setq ac-use-menu-map t)
    ;; Default settings
    (define-key ac-menu-map "\C-n" 'ac-next)
    (define-key ac-menu-map "\C-p" 'ac-previous)))

(use-package auto-complete
  :config (setup-ac))
(use-package auto-complete-config)
(use-package auto-complete-clang)
