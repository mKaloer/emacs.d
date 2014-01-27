(tool-bar-mode -1)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

;; Always line-numbers
(global-linum-mode t)
(set-fringe-mode 0)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("51b27837351cc4176c216d31b3a5dd49b69ab99da039af418d0a0215375d90cc" "57119dc6527eace555668274e6ce8bd89422322a6b336999ecaa755c48606752" "7ca0aa20956e836205e5c68533d68864cac0aaf6ef11ab4aac8236dcdab3f42d" "f8e4694eee94205aea070b8cb87ab12f8049c33ddb5df82c74e3565127860423" "c549e518d11fcf6145dbb6908fce2ba9580229ee002fc15ba87d2c7683da63a5" "e02db5c37de3bb8e8b039a1062ed2c3e7343a42f1d3c6d27b8623ccd398fb4ee" "1de10ea11a6c2898841fca93f879d40f85f87ff50801a11059a87a1a108dd449" "144b2676b6a355c5d21dba5ddae05f180aaf7b171006bef8369cfc5013ec4ee9" "2a738af290baf652e995b0be1d24b20c9d71a433e5a86a6d15f4dfc3ccc30da1" "545287ef14b1b686cd88a99cf6ab3629e55ef6b73d59a76253eec65f4ead4fee" default)))
 '(custom-theme-directory "~/.emacs.d/themes/")
 '(ns-right-alternate-modifier (quote none))
 '(safe-local-variable-values (quote ((comment-auto-fill-only-comments . f) (comment-auto-fill-only-comments . t) (word-wrap . 1) (ispell-change-dictionary . "american") (ruby-compilation-executable . "ruby") (ruby-compilation-executable . "ruby1.8") (ruby-compilation-executable . "ruby1.9") (ruby-compilation-executable . "rbx") (ruby-compilation-executable . "jruby"))))
 '(send-mail-function (quote smtpmail-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
 
;; Default theme
(load-theme 'base16-default)
