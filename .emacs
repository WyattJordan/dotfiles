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
;; done move 5 lines at a time when scrolling past top/bottom


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
;; Done jump between global marks with M-left/right


;; highlight indentations
(add-to-list 'load-path "~/.emacs.d/lisp_plugins")
(load "highlight-indent-guides.el")
(add-hook 'find-file-hook
	  (lambda ()
	    (when (string= (file-name-extension buffer-file-name) "py")
	      (highlight-indent-guides-mode +1))))
;; or use (require 'highlight-indent-guides)
;; done highlight indentations


;; Initialize Melpa for easy package install
;; M-x package-refresh-contents && M-x package-list-packages (to see available)
;; M-x package-install RET <pkg name> RET (to install)
;; This lisp code form here: http://melpa.org/#/getting-started
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
		    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
        (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))

(require 'ace-window)
(global-set-key (kbd "M-p") 'ace-window)

;; rosemacs
;;(add-to-list 'load-path "/opt/ros/kinetic/share/emacs/site-lisp")
;;(require 'rosemacs-config)

(package-initialize)

