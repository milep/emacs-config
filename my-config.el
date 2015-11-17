;; Start with the scratch buffer; no start up screen.
(setq inhibit-startup-screen +1)

;; Backup settings
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Setup default font and fallback for Unicode characters.
(set-face-attribute 'default nil
		    :family "Inconsolata"
		    :height 140
		    :weight 'normal
		    :width 'normal)

(when (functionp 'set-fontset-font)
  (set-fontset-font "fontset-default"
		    'unicode
		    (font-spec :family "DejaVu Sans Mono"
			       :width 'normal
			       :size 12.4
			       :weight 'normal)))

;; By default, Emacs saves the options you set via the `customize-*`
;; functions in the user init file, which is "~/.emacs.d/init.el" in
;; this setup. I prefer to have it put that data in a seperate file.
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Remove the toolbar. It's ugly and I never use it. Also remove the
;; scroll bars; below, I set up the fringe to show my position in a
;; buffer.
(tool-bar-mode -1)
(scroll-bar-mode -1)

(menu-bar-mode -1)

(setq-default indicate-buffer-boundaries 'left)
(setq-default indicate-empty-lines +1)


;; Scrolling
(setq redisplay-dont-pause t
      scroll-margin 5
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1
      scroll-error-top-bottom t)
