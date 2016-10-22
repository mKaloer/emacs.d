;; Home perspective
(add-to-list
 'perspmgr-perspectives
 (cons "Home" (lambda ()
		(org-agenda nil "n")
		(if (fboundp 'elfeed)
		    (progn
		      (split-window-right)
		      (other-window 1)
		      (elfeed))))))

;; Scratch perspective
(add-to-list
 'perspmgr-perspectives
 (cons "Scratch" (lambda ()
		   (switch-to-buffer "*scratch*"))))
;; AAU P7 report
(add-to-list
 'perspmgr-perspectives
 (cons "P7 Report" (lambda ()
		     (find-file "~/Documents/Studie/SW7/AAUP7/report/master.tex")
		     (magit-status-internal "~/Documents/Studie/SW7/AAUP7/"))))

;; AAU P7 prototype
(add-to-list
 'perspmgr-perspectives
 (cons "P7 Prototype" (lambda ()
		     (find-file "~/Documents/Studie/SW7/AAUP7/prototype/")
		     (magit-status-internal "~/Documents/Studie/SW7/AAUP7/"))))

;; Work
(add-to-list
 'perspmgr-perspectives
 (cons "Work" (lambda ()
		(dired "~/Tradeshift/Backend-Conversions/")
		(split-window-below)
		(org-agenda nil "w")
		(magit-status-internal "~/Tradeshift/Backend-Conversions//"))))


(setq perspmgr-initial-perspectives (list "Home" "Scratch"))
(persp-mode)
;(require 'persp-projectile)
