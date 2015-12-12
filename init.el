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

;; Enable company mode globally
(add-hook 'after-init-hook 'global-company-mode)

;; Default smartparens config
(require 'smartparens-config)
(require 'smartparens-ruby)
(smartparens-global-mode)
(show-smartparens-global-mode t)

;; Ruby
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))
(add-hook 'enh-ruby-mode-hook 'ruby-tools-mode)
(setq enh-ruby-deep-indent-paren nil)

;; Web mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.erb" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)
