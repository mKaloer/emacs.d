(require 'package)
(setq package-enable-at-startup nil)
(package-initialize)

; Marmalade and melpa
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
;; Org packages
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

; Get list: C-h v package-activated-list
(setq package-list '(magit-gh-pulls s pcache magit git-rebase-mode git-commit-mode gh logito pcache magit-gh-pulls gh logito pcache gh logito logito pcache pcache ac-cider auto-complete popup cider queue pkg-info epl dash clojure-mode ac-etags auto-complete popup ac-math math-symbol-lists auto-complete popup ace-jump-mode aggressive-indent names auctex auto-complete-clang auto-complete popup autopair awk-it base16-theme calfw google-maps calfw-gcal cider queue pkg-info epl dash clojure-mode clojure-mode color-theme-approximate color-theme-sanityinc-tomorrow color-theme-solarized color-theme color-theme-twilight color-theme-wombat color-theme csharp-mode dirtree windata tree-mode discover makey dropdown-list ein request websocket emamux ensime scala-mode2 popup yasnippet company sbt-mode scala-mode2 auto-complete popup dash s erlang exec-path-from-shell expand-region f dash s flatland-black-theme flycheck let-alist pkg-info epl dash fsharp-mode dash s pos-tip popup auto-complete popup fuzzy fuzzy-match git-timemachine gitattributes-mode gitconfig-mode gitignore-mode go-mode google-maps goto-chg groovy-mode haskell-mode helm-ag helm async helm-projectile dash projectile pkg-info epl dash helm async helm-swoop helm async hexrgb icicles idle-highlight-mode ido-vertical-mode imenu+ jedi auto-complete popup jedi-core python-environment deferred epc ctable concurrent deferred jedi-core python-environment deferred epc ctable concurrent deferred latex-preview-pane magit git-rebase-mode git-commit-mode makefile-runner makey math-symbol-lists matlab-mode multi names org-ac yaxception log4e auto-complete-pcmp yaxception log4e auto-complete popup org-bullets org-gcal org alert log4e gntp request-deferred request deferred org-plus-contrib pbcopy phi-search-mc multiple-cursors phi-search popup pos-tip projectile pkg-info epl dash python-environment deferred queue request-deferred request deferred restclient rinari jump inflections findr ruby-compilation inf-ruby inf-ruby ruby-compilation inf-ruby ruby-electric ruby-end rvm sbt-mode scala-mode2 scala-mode2 smart-mode-line rich-minority smartparens dash solarized-theme dash sos org sx let-alist markdown-mode tree-mode tuareg caml twilight-theme undo-tree virtualenvwrapper s dash websocket windata workgroups xclip yaml-mode yasnippet yaxception zenburn-theme))
; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
