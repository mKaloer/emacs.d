;;; find-line-in-buffer.el ---
;;
;; Filename: find-line-in-buffer.el
;; Description: Finds a specific line in the buffer using binary search.
;; Author: Mads Kalør
;;

(defun find-line-in-region (start end)
  "Finds a line in the region between start and end"
  (let ((mid (+ start (/ (- end start) 2)))) ;; Calculate middle line
    (goto-char (point-min)) ;; Go to mid line
    (forward-line (1- mid)) ;;
    (if (> (- end start) 1) ;; Base case
	(let ((input (read-char "Above (p) or below (n): ")))
	  (if (eq input ?p)
	      (progn
		(message "up")
		(find-line-in-region start mid))
	    (if (eq input ?n)
		(progn
		  (message "Down")
		  (find-line-in-region mid end))))))))


(defun find-line-in-buffer (in-region)
  "Finds a line in the buffer using binary search.
If called with prefix, it is run on the current region."
  (interactive "P")
  (deactivate-mark)
  (if (and in-region ;; Make sure region contains multiple lines
	   (eq (line-number-at-pos (point)) (line-number-at-pos (mark))))
      (user-error "Region must contain several lines!"))
  ;; Set start and end positions based on argument
  (let ((start (if in-region (min (point) (mark)) (point-min)))
	(end (if in-region (max (point) (mark)) (point-max))))
    (push-mark)
    (find-line-in-region (line-number-at-pos start) (line-number-at-pos end))))
