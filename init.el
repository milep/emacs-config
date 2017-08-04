
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; Updates Cask file automagically
(require 'pallet)
(pallet-mode t)

(cond ((memq window-system '(mac ns))
       (exec-path-from-shell-initialize))
      ((equal window-system nil)
       (exec-path-from-shell-copy-env "PATH")))

(org-babel-load-file "~/.emacs.d/configuration.org")

;;(add-to-list 'load-path "~/.emacs.d/vendor/")

;; My basic preferences
(load "~/.emacs.d/my-config")

;; Helm
(load "~/.emacs.d/my-helm")

;; My functions
(load "~/.emacs.d/my-functions")

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
;; fix erb autopairing (the extra >)
;; http://emacs.stackexchange.com/questions/15188/smartparens-and-web-mode-conflict-to-add-extra-angular-bracket
(sp-local-pair 'web-mode "%" "%" :wrap "C-%")
(sp-local-pair 'web-mode "<" ">" :wrap "C->")

;; Ruby
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))
(add-hook 'enh-ruby-mode-hook 'ruby-tools-mode)
(setq enh-ruby-deep-indent-paren nil)

(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'enh-ruby-mode-hook 'robe-mode)
(eval-after-load 'company
  '(push 'company-robe company-backends))

;; Javascript
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;; You may also want to hook it in for shell scripts running via node.js:
;;   (add-to-list 'interpreter-mode-alist '("node" . js2-mode))

;; Web mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.erb" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-enable-auto-closing t)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)
;; fix erb autopairing (the extra >)
(setq web-mode-enable-auto-pairing nil)

;; Projectile
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(add-to-list 'projectile-globally-ignored-directories "tmp")
(add-to-list 'projectile-globally-ignored-directories "log")
(add-to-list 'grep-find-ignored-directories "tmp")
(add-to-list 'grep-find-ignored-files "*.min.css")
(add-to-list 'grep-find-ignored-files "*.min.js")
(add-to-list 'grep-find-ignored-files "*.js.map")
;; (add-to-list 'grep-find-ignored-files "*.ttf")
;; (add-to-list 'grep-find-ignored-files "*.otf")
;; (add-to-list 'grep-find-ignored-files "*.woff")
;; (add-to-list 'grep-find-ignored-files "*.eot")
;; (add-to-list 'grep-find-ignored-files "*.svg")

;; Multiple cursors
(require 'multiple-cursors)

;; Autosave bookmarks
(setq bookmark-save-flag 1)

;; Yasnippet
(require 'yasnippet)
;; I want space after comment
(with-eval-after-load "snippets/prog-mode/.yas-setup.elc"
  (defun yas-with-comment (str)
    (format "%s %s%s" comment-start str comment-end)))
(yas-reload-all)
(add-hook 'ruby-mode-hook 'yas-minor-mode)
(add-hook 'enh-ruby-mode-hook 'yas-minor-mode)

;; My key bindings
(load "~/.emacs.d/my-key-bindings")
