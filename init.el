(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; Updates cask file automagically
(require 'pallet)
(pallet-mode t)

;;(add-to-list 'load-path "~/.emacs.d/vendor/")

;; My basic preferences
(load "~/.emacs.d/my-config")

;; My functions
(load "~/.emacs.d/my-functions")

;; My key bindings
(load "~/.emacs.d/my-key-bindings")

