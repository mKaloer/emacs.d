(defun format-lines-per-language-aux (data keys)
  (if keys
      (let ((lang (car keys)))
	(insert (propertize (format "%s: \t%d" lang (gethash lang data)) 'font-lock-face '(:underline t)))
	(format-lines-per-language-aux data (cdr keys)))))

(defun format-lines-per-language (data)
  (format-lines-per-language-aux data (hash-table-keys data)))

;; Determines the language for the given file and returns an association (file-type . 1) for aggregating a sum
(defun count-language-for-file (file)
  (cons (assoc-default file auto-mode-alist 'string-match) 1))

(defun count-lines-per-language (dir &optional ignore-hidden-files)
   (interactive (list (read-directory-name "Project directory:")))
   (let ((buffer (get-buffer-create (generate-new-buffer-name "*Languages*"))))
     (switch-to-buffer-other-window buffer)
     (with-current-buffer buffer
       (text-mode)
       (format-lines-per-language (count-lines-per-language-in-hash dir ignore-hidden-files)))
     (read-only-mode)))

(defun reduce-assoc-to-hash-aux (fun list res default)
  (if (null list)
      res
    (let*
	((elmnt (car list)) ; Current pair we are looking at
	(value (gethash (car elmnt) res default))) ; Current count of value in res
      (puthash (car elmnt) (funcall fun (cdr elmnt) value) res) ; Update hash table
      (reduce-assoc-to-hash-aux fun (cdr list) res default)))) ; Recursive call

(defun fold-assoc-right (fun list default)
  (fold-assoc-right-aux fun list '() default))

(defun fold-assoc-right-aux (fun list res default)
  (if (null (car list))
      res
    (let*
	((elmnt (car list)) ; Current pair we are looking at
	(value (or (cdr (assoc (car elmnt) res)) default))) ; Current count of value in res
      (fold-assoc-right-aux fun (cdr list) (cons (cons (car elmnt) (funcall fun (cdr elmnt) value)) res) (+ 1 default)))))


(defun reduce-assoc-to-hash (fun list default)
  (reduce-assoc-to-hash-aux fun list (make-hash-table) default))

(defun find-languages-for-files ()
  (mapcar 'count-language-for-file (projectile-all-project-files)))

(reduce-assoc (lambda (a b) (+ a b)) '((1 . 1) (1 . 1) (1 . 1) (2 . 1)) 0)
(hash-table-keys (reduce-assoc-to-hash (lambda (a b) (+ a b)) '((1 . 1) (1 . 1) (1 . 1) (2 . 1)) 0))

(directory-files-recursively "~/Tradeshift" "^[^.]+.*")
(count-lines-per-language-in-hash "~/Tradeshift")
(count-lines-per-language "~/Tradeshift")
(fold-assoc-right '+ (find-languages-for-files) 0)
