(require 'cask "~/.cask/cask.el")
(cask-initialize)

;;(add-to-list 'load-path "~/.emacs.d/vendor/")

;; My basic preferences
(load "~/.emacs.d/my-config")

;; My functions
(load "~/.emacs.d/my-functions")

;; My key bindings
(load "~/.emacs.d/my-key-bindings")

