(custom-set-variables
 '(inhibit-startup-screen t))
(custom-set-faces
 )

(load-theme 'tango-dark)
;; automatic file associations
(add-to-list 'auto-mode-alist '("\\.launch$" . xml-mode))


;; move 5 lines at a time when scrolling past top/bottom
(setq scroll-conservatively 0)
(setq scroll-step 5)
(set-face-attribute 'region nil :background "#633" :foreground "#ffffff")

;; jump between global marks with M-left/right
(setq global-mark-ring-max 32) ;; default is 16, bigger just in case
(defun marker-is-point-p (marker)
  "test if marker is current point"
  (and (eq (marker-buffer marker) (current-buffer))
       (= (marker-position marker) (point))))

(defun push-mark-maybe ()
  "push mark onto `global-mark-ring' if mark head or tail is not current location"
  (if (not global-mark-ring) (error "global-mark-ring empty")
    (unless (or (marker-is-point-p (car global-mark-ring))
		(marker-is-point-p (car (reverse global-mark-ring))))
      (push-mark))))

(defun backward-global-mark ()
  "use `pop-global-mark', pushing current point if not on ring."
  (interactive)
  (push-mark-maybe)
  (when (marker-is-point-p (car global-mark-ring))
    (call-interactively 'pop-global-mark))
  (call-interactively 'pop-global-mark))

(defun forward-global-mark ()
  "hack `pop-global-mark' to go in reverse, pushing current point if not on ring."
  (interactive)
  (push-mark-maybe)
  (setq global-mark-ring (nreverse global-mark-ring))
  (when (marker-is-point-p (car global-mark-ring))
    (call-interactively 'pop-global-mark))
  (call-interactively 'pop-global-mark)
  (setq global-mark-ring (nreverse global-mark-ring)))

(global-set-key [M-left] (quote backward-global-mark))
(global-set-key [M-right] (quote forward-global-mark))

;; highlight indentations
(add-to-list 'load-path "~/.emacs.d/")
(require 'highlight-indent-guides)

;; rosemacs
(add-to-list 'load-path "/opt/ros/kinetic/share/emacs/site-lisp")
(require 'rosemacs-config)
