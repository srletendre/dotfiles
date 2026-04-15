(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode -1)
(show-paren-mode t)
(blink-cursor-mode 0)
(global-display-line-numbers-mode t)
(global-hl-line-mode t)

(setq make-backup-files nil)
(delete-selection-mode t)

(if (display-graphic-p)
    (progn ;; GUI MODE

      (load-theme 'whiteboard)

      (set-face-attribute 'default (selected-frame) :height 150 :background "cornsilk")
      (custom-set-faces
       '(font-lock-comment-face       ((t (:foreground "dark gray"   :slant oblique       ))))
       '(font-lock-function-name-face ((t (:foreground "dark orange"                      ))))
       '(font-lock-string-face        ((t (:foreground "DarkOrange4"                      ))))
       '(whitespace-space             ((t (:background "cornsilk"    :foreground "wheat1" ))))
       '(whitespace-line              ((t (:background "color-234"   :foreground "violet" ))))
       '(whitespace-tab               ((t (:background "color-234"   :foreground "violet" ))))
       '(whitespace-indentation       ((t (:background "cornsilk"    :foreground "red"    ))))
       '(highlight                    ((t (:background "lemon chiffon"                    ))))
       )


      )
  (progn ;; TERMINAL MODE
    (load-theme 'manoj-dark)
    )
  )

(add-hook 'prog-mode-hook 'whitespace-mode)


(setq whitespace-style '(face tabs spaces
space-before-tab indentation space-after-tab space-mark tab-mark))


(add-hook 'prog-mode-hook 'toggle-truncate-lines)


(defun goto-dir ()
  (interactive)
  (find-file
   (cadr (split-string (pwd) "Directory "))))
(global-set-key (kbd "C-x <up>") 'goto-dir)
(global-set-key (kbd "C-<up>") 'goto-dir)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ORG MODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'org-mode-hook
	  (lambda ()
	    (org-indent-mode)))
;; ;; https://orgmode.org/org.html#Languages:
;; (org-babel-do-load-languages
;;   'org-babel-load-languages
;;   '((emacs-lisp . t)
;;      (R . t)
;;      (python . t)
;;      (perl . t)
;;      (scheme . t)
;;      (ruby . t)
;;      (plantuml . t)
;;      (ditaa . t)
;;      (sh . t)
;;      ))
(setq org-hide-emphasis-markers t)
(setq org-hide-block-overlays t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; NAVIGATION
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(recentf-mode 1)

(global-set-key (kbd "<f12>")
		(lambda()(interactive)
		  (switch-to-buffer (get-buffer-create "*scratch*"))))

;; At least on the mouse I use, these are the buttons on the side.
(global-set-key (kbd "<mouse-8>") 'previous-buffer) ; This is what C-x <left> does
(global-set-key (kbd "<mouse-9>") 'next-buffer)     ; This is what C-x <right> does
(global-set-key (kbd "<C-left>") 'previous-buffer)     ; replaces left-word (but M-left is still left-word)
(global-set-key (kbd "<C-right>") 'next-buffer)     ; replaces right-word (but M-right is still right-word)

;; TODO: There must be a function which finds the pwd more directly!
(defun file-up-directory ()
  "Navigate one level up in the directory structure."
  (interactive)
  (if (eq major-mode 'dired-mode)
      (dired-up-directory)
      (find-file
        (cadr (split-string (pwd) "Directory ")))))

(global-set-key (kbd "<C-up>")   'file-up-directory) ; replaces binding of backward-paragraph
(global-set-key (kbd "<C-down>")   'file-up-directory) ; replaces binding of backward-paragraph
(global-set-key (kbd "C-x <up>") 'file-up-directory)
(global-set-key (kbd "C-0") (lambda () (interactive)
			      (delete-window)))
;;(global-set-key (kbd "C-x C-b") (lambda () (interactive)(list-buffers t)))
major-mode



(add-hook 'org-mode-hook
  (lambda () (org-indent-mode)))

(load "/home/sean/Desktop/github-repos/dotfiles/emacs/profile1/easy-glyph-entry.el")



(defvar possible-line-selection nil)

(defun decimal-sequence-to-number-internal (starting seq)
    (cond
       ((not seq) starting)
       (
	(decimal-sequence-to-number-internal (+ (* 10 starting) (car seq))
				    (cdr seq) ) ) )
    
)
(defun decimal-sequence-to-number (seq)
  ; For example, 
  ; (decimal-sequence-to-number '(2 8 4))
  ; returns 284
  (decimal-sequence-to-number-internal 0 seq) )


(decimal-sequence-to-number '(2 8 4))

(defun move-to-buffer-line (n)
  (interactive)
  (print n)
  (beginning-of-buffer)
  (forward-line (- n 1)) )

(defun lines-in-buffer ()
  (count-lines 1
   (- (point-max) 1)))

(defun lf (number)
  (if (not possible-line-selection)
      (setq possible-line-selection number)
      (setq possible-line-selection (+ (* 10 possible-line-selection) number)))
  (if (> possible-line-selection (lines-in-buffer))
      (progn (setq possible-line-selection nil) (move-to-buffer-line 1))
      (progn
        (move-to-buffer-line possible-line-selection)
        (if (<= (lines-in-buffer) (* 10 possible-line-selection))
            (if (eq major-mode 'bookmark-bmenu-mode)
                (bookmark-bmenu-this-window)
                (move-end-of-line nil))))))





(defun lfSPC () (interactive) (lf " "))
(defun lf1 () (interactive) (lf 1))
(defun lf2 () (interactive) (lf 2))
(defun lf3 () (interactive) (lf 3))
(defun lf4 () (interactive) (lf 4))
(defun lf5 () (interactive) (lf 5))
(defun lf6 () (interactive) (lf 6))
(defun lf7 () (interactive) (lf 7))
(defun lf8 () (interactive) (lf 8))
(defun lf9 () (interactive) (lf 9))
(defun lf0 () (interactive) (lf 0))
(defun lf-comma () (interactive) (setq possible-line-selection nil))

(add-hook 'bookmark-bmenu-mode-hook
	  (lambda ()
	   (setq possible-line-selection nil)
	   (local-set-key (kbd "1") 'lf1)
	   (local-set-key (kbd "2") 'lf2)
	   (local-set-key (kbd "3") 'lf3)
	   (local-set-key (kbd "4") 'lf4)
	   (local-set-key (kbd "5") 'lf5)
	   (local-set-key (kbd "6") 'lf6)
	   (local-set-key (kbd "7") 'lf7)
	   (local-set-key (kbd "8") 'lf8)
	   (local-set-key (kbd "9") 'lf9)
	   (local-set-key (kbd "0") 'lf0)
	   (local-set-key (kbd ",") 'lf-comma)) )

(add-hook 'dired-mode-hook
	  (lambda ()
	   (setq possible-line-selection nil)
	   (local-set-key (kbd "1") 'lf1)
	   (local-set-key (kbd "2") 'lf2)
	   (local-set-key (kbd "3") 'lf3)
	   (local-set-key (kbd "4") 'lf4)
	   (local-set-key (kbd "5") 'lf5)
	   (local-set-key (kbd "6") 'lf6)
	   (local-set-key (kbd "7") 'lf7)
	   (local-set-key (kbd "8") 'lf8)
	   (local-set-key (kbd "9") 'lf9)
	   (local-set-key (kbd "0") 'lf0)
	   (local-set-key (kbd ",") 'lf-comma)) )

(add-hook 'buffer-menu-mode-hook
	  (lambda ()
	   (setq possible-line-selection nil)
	   (local-set-key (kbd "1") 'lf1)
	   (local-set-key (kbd "2") 'lf2)
	   (local-set-key (kbd "3") 'lf3)
	   (local-set-key (kbd "4") 'lf4)
	   (local-set-key (kbd "5") 'lf5)
	   (local-set-key (kbd "6") 'lf6)
	   (local-set-key (kbd "7") 'lf7)
	   (local-set-key (kbd "8") 'lf8)
	   (local-set-key (kbd "9") 'lf9)
	   (local-set-key (kbd "0") 'lf0)
	   (local-set-key (kbd ",") 'lf-comma)) )

(add-hook 'buffer-menu-mode-hook
          (lambda ()
            (local-set-key (kbd "<mouse-1>") 'bookmark-bmenu-this-window)))
;; (defun search-files (term)
;;   "Search for files"
;;   (interactive "sFile-name:")
;;   (

;;    ))

;; (search-files)

;; major-mode

;; (defun mode-remember ()
;;   "dwq"
;;   (interactive)
;;   (progn)
;;   )



; ` <-- read help on this!





(setq register-preview-delay 0)

(global-set-key (kbd "C-x l") 'locate) ;previously count-lines-page
(global-set-key (kbd "C-x g") 'rgrep) ;previously unbound

(global-set-key (kbd "C-,") 'backward-delete-char) ;previously unbound
(global-set-key (kbd "C-.") 'delete-char) ;previously unbound
;; C-q previously bound to quoted-insert


(defun window-setup ()
  (interactive)
  (progn
    (shell)
    (delete-other-windows)
    (split-window-right)
    (other-window 1)
    (find-file "~")
    (split-window-below)
    (other-window 2)))

(defun proj-setup ()
  (interactive)
  (progn
    (vc-dir "~/proj")
    (delete-other-windows)
    (split-window-right)hk
    (other-window 1)
    (find-file "~/proj")
    (split-window-below)
    (other-window 2)))

(defvar window-in-focus nil)

(defun toggle-focus-window ()
  (interactive)
  (if window-in-focus
      (progn
        (jump-to-register ?w)
        (setq window-in-focus nil))
      (progn
        (window-configuration-to-register ?w)
        (delete-other-windows)
        (setq window-in-focus t))))


(global-set-key (kbd "C-x f") 'toggle-focus-window)  ;previously set-fill-column

;; (setq x (current-window-configuration))
;; (set-window-configuration x)
(put 'downcase-region 'disabled nil)

