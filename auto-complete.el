;; Add expand-tag to hippie-expand

(defun tags-complete-tag (string predicate what)
     (save-excursion
     ;; Do not ask for tag table even though it is needed.
     (if (eq what nil)
	(all-completions string (tags-completion-table) predicate))))

(defun he-tag-beg ()
  (let ((p
         (save-excursion 
           (backward-word 1)
           (point))))
    p))

(defun try-expand-tag (old)
  (unless  old
    (he-init-string (he-tag-beg) (point))
    (setq he-expand-list (sort
                          (all-completions he-search-string 'tags-complete-tag) 'string-lessp)))
  (while (and he-expand-list
              (he-string-member (car he-expand-list) he-tried-table))
              (setq he-expand-list (cdr he-expand-list)))
  (if (null he-expand-list)
      (progn
        (when old (he-reset-string))
        ())
    (he-substitute-string (car he-expand-list))
    (setq he-expand-list (cdr he-expand-list))
    t))
(add-to-list 'hippie-expand-try-functions-list 'try-expand-tag) 

;; Expand file-name
 (fset 'my-complete-file-name
        (make-hippie-expand-function '(try-complete-file-name-partially
                                       try-complete-file-name)))

