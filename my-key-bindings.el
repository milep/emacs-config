(global-set-key "\C-cg" 'magit-status)
(global-set-key "\C-cd" 'duplicate-line)
(global-set-key "\C-cc" 'comment-or-uncomment-region-or-line)
(global-set-key "\C-xd" 'dired-jump)

(global-set-key (kbd "C-c SPC") 'ace-jump-mode)

;; yari-helm stopped working
;; (define-key 'help-command "R" 'yari-helm)
(define-key 'help-command "R" 'yari)
;; Helm specific key bindings are in the my-helm.el

;; Multiple cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; projectile
(global-set-key (kbd "C-c s") 'helm-projectile-ag)
