(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'tango-dark
)
;; automatic file associations
(add-to-list 'auto-mode-alist '("\\.launch$" . xml-mode))

(add-to-list 'load-path "/opt/ros/kinetic/share/emacs/site-lisp")
(require 'rosemacs-config)

;; move 5 lines at a time when scrolling past top/bottom
(setq scroll-conservatively 0)
(setq scroll-step 5)

;; make F7 jump to previous marks globally
;; (defun xah-pop-local-mark-ring ()
;;     "Move cursor to last mark position of current buffer.
;; Call this repeatedly will cycle all positions in `mark-ring'.
;; URL `http://ergoemacs.org/emacs/emacs_jump_to_previous_position.html'
;; Version 2016-04-04"
;;     (interactive)
;;     (set-mark-command t))

;; (global-set-key (kbd "<f7>") 'pop-global-mark)
;; (global-set-key (kbd "<f8>") 'xah-pop-local-mark-ring)


;; (defmacro my-unpop-to-mark-advice ()
;;   "Enable reversing direction with un/pop-to-mark."
;;   `(defadvice ,(key-binding (kbd "C-SPC")) (around my-unpop-to-mark activate)
;;      "Unpop-to-mark with negative arg"
;;      (let* ((arg (ad-get-arg 0))
;; 	    (num (prefix-numeric-value arg)))
;;        (cond
;; 	;; Enabled repeated un-pops with C-SPC
;; 	((eq last-command 'unpop-to-mark-command)
;; 	 (if (and arg (> num 0) (<= num 4))
;; 	     ad-do-it ;; C-u C-SPC reverses back to normal direction
;; 	   ;; Otherwise continue to un-pop
;; 	   (setq this-command 'unpop-to-mark-command)
;; 	   (unpop-to-mark-command)))
;; 	;; Negative argument un-pops: C-- C-SPC
;; 	((< num 0)
;; 	 (setq this-command 'unpop-to-mark-command)
;; 	 (unpop-to-mark-command))
;; 	(t
;; 	 ad-do-it)))))
;; (my-unpop-to-mark-advice)

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

