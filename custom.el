(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("705f3f6154b4e8fac069849507fd8b660ece013b64a0a31846624ca18d6cf5e1" "a1289424bbc0e9f9877aa2c9a03c7dfd2835ea51d8781a0bf9e2415101f70a7e" "9122dfb203945f6e84b0de66d11a97de6c9edf28b3b5db772472e4beccc6b3c5" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "12fece7b8ef725588213723b85b02bc7610b8cdee26dc48b32c12364a04088d2" "e24180589c0267df991cf54bf1a795c07d00b24169206106624bb844292807b9" "9dae95cdbed1505d45322ef8b5aa90ccb6cb59e0ff26fef0b8f411dfc416c552" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "41b6698b5f9ab241ad6c30aea8c9f53d539e23ad4e3963abff4b57c0f8bf6730" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(elfeed-feeds
   (quote
    ("https://blogs.dropbox.com/tech/feed/" "https://labs.spotify.com/feed/atom/" "https://developers.soundcloud.com/blog.rss" "https://developer.zendesk.com/blog.xml" "http://yahooeng.tumblr.com/rss" "http://eng.uber.com/feed/atom/" "http://feeds.feedburner.com/corner-squareup-com" "https://algorithms.rdio.com/atom" "https://engineering.quora.com/rss" "https://www.periscope.io/blog/atom.xml" "http://tech.oyster.com/feed/atom/" "http://devs.mailchimp.com/blog/feed/atom/" "https://engineering.groupon.com/feed/atom/" "https://codeascraft.com/feed/atom/" "http://www.ebaytechblog.com/feed/" "http://blog.cloudera.com/blog/feed/" "http://engineering.flipboard.com/feed" "http://blog.evernote.com/tech/feed/" "http://engineering.foursquare.com/feed/" "http://code.flickr.net/feed/" "http://feeds.feedburner.com/codinghorror/" "https://scribdtech.wordpress.com/feed/" "http://blogs.atlassian.com/blog-cat/developer/feed" "http://feeds2.feedburner.com/heroku" "http://feeds.feedburner.com/SlideShareEngineering" "http://engineeringblog.yelp.com/feed/atom" "http://instagram-engineering.tumblr.com/rss" "http://feeds.feedburner.com/SlideShareEngineering" "http://engineering.tumblr.com/rss" "http://engineering.tumblr.com/" "https://code.facebook.com/posts/rss/" "http://nerds.airbnb.com/feed/" "http://feeds.feedburner.com/GDBcode?format=xml" "http://techblog.netflix.com/feeds/posts/default" "http://engineering.linkedin.com/taxonomy/term/1/feed" "http://engineering.twitter.com/feeds/posts/default" "http://planet.emacsen.org/atom.xml")))
 '(markdown-command "/usr/local/Cellar/markdown/1.0.1/bin/markdown")
 '(package-selected-packages
   (quote
    (rjsx-mode rsjx-mode protobuf-mode persp-mode editorconfig csv-mode synosaurus py-isort emacs-emojify emojify company-go go-autocomplete atom-one-dark-theme which-key company highlight-tail swiper-helm evil-numbers atom-dark-theme js2-mode apropos use-package pymacs sml-mode quack multi-term persp-projectile perspective xclip workgroups web undo-tree twilight-theme sos smart-mode-line rvm ruby-end ruby-electric rinari phi-search-mc pbcopy org-bullets matlab-mode makefile-runner magit-gh-pulls latex-preview-pane jedi ido-vertical-mode idle-highlight-mode hexrgb helm-swoop helm-spotify helm-projectile helm-ag haskell-mode groovy-mode goto-chg go-mode gitignore-mode gitconfig-mode gitattributes-mode git-timemachine fuzzy-match fuzzy fsharp-mode flycheck flatland-black-theme f expand-region exec-path-from-shell erlang ensime emamux elfeed ein dropdown-list discover dirtree csharp-mode color-theme-wombat color-theme-twilight color-theme-solarized color-theme-sanityinc-tomorrow color-theme-approximate calfw-gcal calfw base16-theme awk-it autopair auto-complete-clang auctex aggressive-indent ace-jump-mode ac-math ac-etags ac-cider)))
 '(safe-local-variable-values
   (quote
    ((TeX-master expand-file-name "master")
     (eval setq TeX-master
	   (expand-file-name "report.tex"
			     (file-name-directory
			      (let
				  ((d
				    (dir-locals-find-file ".")))
				(if
				    (stringp d)
				    d
				  (car d))))))
     (ruby-compilation-executable . "ruby")
     (ruby-compilation-executable . "ruby1.8")
     (ruby-compilation-executable . "ruby1.9")
     (ruby-compilation-executable . "rbx")
     (ruby-compilation-executable . "jruby"))))
 '(sml/theme (quote dark)))
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
 '(font-latex-sectioning-5-face ((t (:inherit variable-pitch :foreground "goldenrod1"))))
 '(sml/col-number ((t (:inherit default :foreground "green"))))
 '(sml/folder ((t (:inherit sml/global :foreground "brightgreen" :weight normal)))))
