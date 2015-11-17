(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; Updates Cask file automagically
(require 'pallet)
(pallet-mode t)

(cond ((memq window-system '(mac ns))
       (exec-path-from-shell-initialize))
      ((equal window-system nil)
       (exec-path-from-shell-copy-env "PATH")))

;;(add-to-list 'load-path "~/.emacs.d/vendor/")

(require 'fullframe)
(fullframe magit-status magit-mode-quit-window)

;; My basic preferences
(load "~/.emacs.d/my-config")

;; Helm
(load "~/.emacs.d/my-helm")

;; My functions
(load "~/.emacs.d/my-functions")

;; My key bindings
(load "~/.emacs.d/my-key-bindings")

