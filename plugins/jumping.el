; Directory jumping stuff. Convenient direct jumping to files or directories given simple names.
; Kurt Nørmark, normark@cs.aau.dk. 

; The jumping facility relies on an association list bound to the variable jump-places.
; The association list maps names to directories of files. Sample jump-places variable:
; 
;   (
;     ("jumping" . "/user/normark/lisp/jump-places.lsp")
;     ("p2025" . "/user/normark/projects/p2025/")
;     ("prog5" . "/user/normark/courses/prog5/prog5-05/prog5-05.laml")
;   )
; 
; If you put the list in a file j.lsp, read it by
;
;  (setq jump-places (jmp-file-read "j.lsp"))
;

; This program is free software; you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation; either version 2 of the License, or
; (at your option) any later version.
; 
; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.
; 
; You should have received a copy of the GNU General Public License
; along with this program; if not, write to the Free Software
; Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA


(defun jump (where)
  "Activate a directory editor at the place WHERE, in case WHERE is a directory name (a string).
Open the file in case WHERE is a file name.
When called interactively, the user is prompted for the parameter with completion.
The completions are governed by the association list jump-places."
 (interactive 
   (list (completing-read "Jump where: " jump-places nil nil)))
  (let ((dir-or-file 
          (if (jmp-seems-to-be-file-path where) where (cdr (assoc where jump-places)))))
    (cond ((and dir-or-file (file-directory-p dir-or-file))
            (dired dir-or-file)
            (dired-sort-other (concat dired-listing-switches "t"))  ; always sort by modification time
            (goto-char (point-min))
            (dired-next-line 2)
           )
          ((and dir-or-file (file-exists-p dir-or-file))
            (find-file dir-or-file))
          (t (beep) (message "Cannot jump")))
    (message dir-or-file)
  )
)

(defun save-buffer-at-jumping-directory (prefix)
  "Save the current buffer in one of the jumping directories.
You will be prompted for the directory in the minibuffer.
With a prefix argument, you will also be prompted for an alternative name of the buffer.
Notice that the possibly changed buffer name becomes the file name.
Be careful, because no warnings are issued if you overwrite a file."
  (interactive "P")
  (let* ((buf-name (if prefix (read-from-minibuffer "New name of buffer: ") (buffer-name)))
         (dir-name (completing-read (concat "Save buffer " buf-name " in which directory: ")
                   jump-places nil t))
         (dir (cdr (assoc dir-name jump-places))))
    (write-file (concat dir "/" buf-name))))

(defun insert-jump-directory (where)
 "Insert the directory named WHERE at the place of the cursor (point)."
 (interactive 
   (list (completing-read "Insert which directory: " jump-places nil nil)))
   (let ((dir (cdr (assoc where jump-places))))
    (insert dir)))

(defun insert-jump-directory (where)
 "Insert the directory named WHERE at the place of the cursor (point)."
 (interactive 
   (list (completing-read "Insert which directory: " jump-places nil nil)))
   (let ((dir (cdr (assoc where jump-places))))
    (insert dir)))

(defun jmp-seems-to-be-file-path (x)
 (= 47 (aref x 0)))

(defvar path-of-jump-file nil "The full path of the jump place file")

(defun jmp-file-read (file)
  "Read the first Lisp expression from file (full path)"
  (save-excursion
    (let ((temp-buf (generate-new-buffer "file-reading.tmp")))
      (setq path-of-jump-file file)
      (set-buffer temp-buf)
      (insert-file file)
      (goto-char (point-min))
      (prog1
        (read temp-buf)
        (kill-buffer temp-buf)))))


(defun load-jump ()
 "Re-read jump places. Call this command after you have edited your jump place file."
 (interactive) (setq jump-places (jmp-file-read path-of-jump-file)))