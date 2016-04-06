;; This is based on prelude-helm.el


(defun setup-helm ()
  (progn
    (require 'helm-config)
    (require 'helm-projectile)
    (when (executable-find "curl")
      (setq helm-google-suggest-use-curl-p t))
    (setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-buffers-fuzzy-matching           t ; fuzzy matching buffer names when non--nil
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t ;
      helm-ff-skip-boring-files             t)
    ;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
    ;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
    ;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
    (global-set-key (kbd "C-c h") 'helm-command-prefix)
    (global-unset-key (kbd "C-x c"))

    (define-key helm-command-map (kbd "o")     'helm-occur)
    (define-key helm-command-map (kbd "g")     'helm-do-grep)
    (define-key helm-command-map (kbd "C-c w") 'helm-wikipedia-suggest)
    (define-key helm-command-map (kbd "SPC")   'helm-all-mark-rings)
    (setq helm-ff-file-name-history-use-recentf t)
    (helm-mode 1)))

(use-package helm
  :ensure t
  :config (setup-helm))

