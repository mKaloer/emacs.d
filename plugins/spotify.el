(require 'button)

;; Basic functionality

(defun spotify-play-pause ()
  "Plays/pauses Spotify"
  (interactive)
  (shell-command-to-string
   "osascript -e 'tell application \"Spotify\" to playpause'"))

(defun spotify-next-track ()
  "Plays the next track"
  (interactive)
  (shell-command-to-string
   "osascript -e 'tell application \"Spotify\" to next track'"))

(defun spotify-previous-track ()
  "Plays previous track/or restarts current"
  (interactive)
  (shell-command-to-string
   "osascript -e 'tell application \"Spotify\" to previous track'"))

(defun spotify-get-track ()
  "Gets information about the current track"
  (interactive)
  (let
      ((artist
	(replace-regexp-in-string
	 "\n$" ""
	 (shell-command-to-string
	  "osascript -e 'Tell application \"Spotify\" to artist of current track'")))
       (title (replace-regexp-in-string "\n$" ""
					(shell-command-to-string
					 "osascript -e 'Tell application \"Spotify\" to name of current track'")))
       (album (replace-regexp-in-string "\n$" ""
					(shell-command-to-string
					 "osascript -e 'Tell application \"Spotify\" to album of current track'")))
       (track-id (replace-regexp-in-string "\n$" ""
					   (shell-command-to-string
					    "osascript -e 'Tell application \"Spotify\" to id of current track'" ))))
    (list `(:artist ,artist) `(:title ,title) `(:album ,album) `(:track-id ,track-id))))


;; Define spotify-mode
(define-derived-mode spotify-mode nil
  "Spotify"
  (local-set-key (kbd "SPC") 'spotify-play-pause)
  (local-set-key (kbd "n") 'spotify-next-track)
  (local-set-key (kbd "p") 'spotify-previous-track))

(defun make-buffer ()
  "Creates the spotify buffer and window if it does not exist"
  (let ((buf (get-buffer-create "Spotify")))
    (select-window (split-window-below))
    (switch-to-buffer buf)
    (setq buffer-read-only t)
    (let ((buffer-read-only nil))
      ;; Format track
      (insert
       (apply 'format "%s - %s"
	      (let
		  ((track (spotify-get-track)))
		(list
		 (nth 1 (assoc :artist (spotify-get-track)))
		 (nth 1 (assoc :title (spotify-get-track)))))))
      (newline)
      ;; Add prev, play/pause and next buttons
      (insert-button "Previous" 'action (lambda (x) (spotify-previous-track)))
      (newline)
      (insert-button "Play/Pause" 'action (lambda (x) (spotify-play-pause)))
      (newline)
      (insert-button "Next" 'action (lambda (x) (spotify-next-track)))
      (spotify-mode)
      ))
  (shrink-window-if-larger-than-buffer))

(make-buffer)
