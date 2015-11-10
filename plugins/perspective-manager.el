;;; perspective-manager.el --- Management of perspective.el perspectives

;; Copyright (C) 2015 Mads Kalør
;; Author: Mads Kalør <mads@kaloer.com>
;; Maintainer: Mads Kalør <mads@kaloer.com>
;; Created: 2 Oct 2015
;; Keywords: perspectives, frames, workspaces
;; Package-Requires: ((perspective "1.12"))

;;; Description
;; This package defines a number of functions to manage and define perspectives for perspective.el.
;; Perspectives are defined by a name and a setup function. Some perspectives can optionally be
;; loaded when persp-mode is started, or they can be instantiated as needed.


(defvar perspmgr-initial-perspectives nil
  "The list of the initial perspective names.
The first element is the initial perspective. If nil, the default is used.
")

(defun perspmgr-open-perspective (force-setup name)
  "Opens a perspective. If it does not exist, it is created, otherwise
it is simply activated. If called with prefix argument, the setup will
run even if the perspective already exists"
  (interactive
   (list
    current-prefix-arg
    (completing-read "Open perspective: " (mapcar 'car perspmgr-perspectives))))
  (perspmgr-switch-to-perspective (assoc name perspmgr-perspectives) force-setup))

(defun perspmgr-switch-to-perspective (perspective &optional force-setup)
  "Switches to the perspective of the given name. If it does not exist,
the setup function is called."
  (let* ((persp-name (car perspective))
	(persp-setup (cdr perspective))
	(persp-exists (member persp-name (persp-names))))
    (persp-switch persp-name)
    (message "EXISTS?:")
    (message (prin1-to-string persp-exists))
    (message (prin1-to-string force-setup))
    (if (or (not persp-exists) force-setup)
	;; New perspective or force setup: run setup function
	(funcall persp-setup))))

(defvar perspmgr-perspectives nil
  "Alist of saved perspectives.
The key of each list item is the name of the perspective, and the value is a
function to setup the perspective when initially created.")

(add-hook
 'persp-mode-hook
 (lambda ()
   ;; Initial perspective is the first in the list
   (let ((initial-perspective (car perspmgr-initial-perspectives)))
     ;; Setup each perspective in the list
     (mapcar
      (lambda (perspective)
	(let
	    ;; If the perspective does not exist, and it is the initial
	    ;; perspective, we should not create a new perspective
	    ;; but instead change the perspective created for us by
	    ;; perspective.el. We rename it and run the setup function.
	    ((is-initial (and (not (member perspective (persp-names)))
			      (equal perspective initial-perspective))))
	  (if is-initial
	      (persp-rename perspective))
	  (perspmgr-open-perspective is-initial perspective)))
      perspmgr-initial-perspectives)
     ;; Finally, set initial perspective as active
     (perspmgr-open-perspective nil initial-perspective))))
