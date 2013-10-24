;; Always start an emacs server by default
(require 'server)
(unless (server-running-p)
  (server-start))

;; Setup marmalade and melpa
(require 'package)
(add-to-list 'package-archives
             '("marmalade" .  "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))

(package-initialize)

;; Define packages for installation
(setq my-packages
      '(auto-complete
        clojure-mode
        nrepl
        ;; nrepl-tracing
        ac-nrepl
        rainbow-delimiters
        color-theme-solarized
        nlinum
        smartparens
        evil))

;; Fetch the list of packages available
(when (not package-archive-contents)
  (package-refresh-contents))

;; Install mypackages if necessary
(mapc (lambda (pkg)
        (unless (package-installed-p pkg)
          (package-install pkg)))
      my-packages)

;; Turn on evil
(evil-mode 1)

;; Load solarized
(load-theme 'solarized-dark t)

;; Avoid annoying toolbar and menubar
(when window-system
  (tool-bar-mode -1)
  (menu-bar-mode -1))

;; Do not show special buffers
(setq nrepl-hide-special-buffers t)
(global-linum-mode 1)


(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)

(require 'smartparens-config)
(add-hook 'nrepl-repl-mode-hook 'smartparens-strict-mode)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'nrepl-mode))
