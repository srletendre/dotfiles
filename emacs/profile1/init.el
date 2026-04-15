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


(add-hook 'org-mode-hook
  (lambda () (org-indent-mode)))

(load "/home/sean/Desktop/github-repos/dotfiles/emacs/profile1/easy-glyph-entry.el")
