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

;; My basic preferences
(load "~/.emacs.d/my-config")

;; Helm
(load "~/.emacs.d/my-helm")

;; My functions
(load "~/.emacs.d/my-functions")

;; My key bindings
(load "~/.emacs.d/my-key-bindings")

(require 'fullframe)
(fullframe magit-status magit-mode-quit-window)

;; The fringe is the vertical region at the right and left of the
;; buffer. Emacs lets you customize it of course.
;; Here I set up git diffs and buffer position in the fringe.
(when (window-system)
  (require 'git-gutter-fringe))
(global-git-gutter-mode +1)

;; flycheck for syntax checking
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Use aspell for ispell
;; On OS X "brew install aspell"
(setq ispell-program-name "aspell")
