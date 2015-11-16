(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; Updates Cask file automagically
(require 'pallet)
(pallet-mode t)

;;(add-to-list 'load-path "~/.emacs.d/vendor/")

;; My basic preferences
(load "~/.emacs.d/my-config")

;; Helm
(load "~/.emacs.d/my-helm")

;; My functions
(load "~/.emacs.d/my-functions")

;; My key bindings
(load "~/.emacs.d/my-key-bindings")

