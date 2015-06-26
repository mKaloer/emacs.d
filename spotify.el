
(defun spotify-next-track ()
  "Goes to next track on Spotify."
  (interactive)
  (shell-command
   "osascript -e 'tell application \"Spotify\" to next track'"))

