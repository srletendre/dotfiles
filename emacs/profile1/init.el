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
